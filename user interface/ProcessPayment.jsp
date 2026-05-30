<%@ page language="java" contentType="text/plain; charset=UTF-8"
         pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.UUID" %>
<%
/* ============================================================
   ProcessPayment.jsp  — WITH DATABASE PERSISTENCE
   Validates input, inserts into PostgreSQL, returns TXN_ID.
   ============================================================ */

response.setHeader("Cache-Control", "no-cache, no-store");
response.setHeader("Pragma", "no-cache");

/* ── 1. Session guard ─────────────────────────────────────── */
String loggedInUser  = (String) session.getAttribute("loggedInUser");
String loggedInEmail = (String) session.getAttribute("loggedInEmail");

if (loggedInUser == null || loggedInUser.isEmpty()) {
    response.setStatus(403);
    out.print("ERROR:Not authenticated. Please log in again.");
    out.flush();
    return;
}
if (loggedInEmail == null) loggedInEmail = "";

/* ── 2. Read & auto-detect payMode ───────────────────────── */
String payModeRaw = request.getParameter("payMode");
String payMode    = (payModeRaw != null) ? payModeRaw.trim().toLowerCase() : "";

if (!"upi".equals(payMode) && !"bank".equals(payMode)) {
    String hasUpi  = request.getParameter("upiId");
    String hasBank = request.getParameter("bankAcc");
    if      (hasUpi  != null && !hasUpi.trim().isEmpty())  payMode = "upi";
    else if (hasBank != null && !hasBank.trim().isEmpty())  payMode = "bank";
    else                                                    payMode = "upi";
}

/* ── 3. Read params based on payMode ─────────────────────── */
String note          = request.getParameter("note");
if (note == null) note = "";
note = note.trim();

String recipientRef  = "";
String recipientName = "";
String ifscCode      = "";
String methodLabel   = "";

if ("upi".equals(payMode)) {
    recipientRef  = request.getParameter("upiId");
    recipientName = request.getParameter("upiName");
    if (recipientRef  == null) recipientRef  = "";
    if (recipientName == null) recipientName = "";
    recipientRef  = recipientRef.trim();
    recipientName = recipientName.trim();
    methodLabel   = "UPI";
} else {
    recipientName = request.getParameter("bankName");
    recipientRef  = request.getParameter("bankAcc");
    ifscCode      = request.getParameter("bankIfsc");
    if (recipientName == null) recipientName = "";
    if (recipientRef  == null) recipientRef  = "";
    if (ifscCode      == null) ifscCode      = "";
    recipientName = recipientName.trim();
    recipientRef  = recipientRef.trim();
    ifscCode      = ifscCode.trim();
    methodLabel   = "NEFT/IMPS";
}

/* ── 4. Validate amount ──────────────────────────────────── */
String amountStr = request.getParameter("amount");
double amount = 0;
try {
    String rawAmt = (amountStr != null)
        ? amountStr.trim().replaceAll("[^0-9.]", "")
        : "0";
    if (rawAmt.isEmpty()) rawAmt = "0";
    amount = Double.parseDouble(rawAmt);
} catch (Exception e) {
    out.print("ERROR:Invalid amount value.");
    out.flush();
    return;
}
if (amount <= 0) {
    out.print("ERROR:Amount must be greater than 0.");
    out.flush();
    return;
}
if (amount > 500000) {
    out.print("ERROR:Amount exceeds maximum limit of Rs 5,00,000.");
    out.flush();
    return;
}

/* ── 5. Generate unique transaction ID ───────────────────── */
String txnId = "pay_" + System.currentTimeMillis()
             + "_" + UUID.randomUUID().toString().replace("-","").substring(0, 6);

/* ── 6. Insert into PostgreSQL ───────────────────────────── */
Connection con = null;
PreparedStatement ps = null;
try {
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/postgres", "postgres", "arnab05");

    /* Ensure table exists (safe no-op if already present) */
    Statement stmt = con.createStatement();
    stmt.executeUpdate(
        "CREATE TABLE IF NOT EXISTS transactions (" +
        "  id              SERIAL PRIMARY KEY," +
        "  txn_id          VARCHAR(64)    NOT NULL UNIQUE," +
        "  sender_email    VARCHAR(255)   NOT NULL," +
        "  sender_name     VARCHAR(255)   NOT NULL," +
        "  pay_mode        VARCHAR(16)    NOT NULL," +
        "  recipient_name  VARCHAR(255)," +
        "  recipient_ref   VARCHAR(255)   NOT NULL," +
        "  ifsc_code       VARCHAR(16)," +
        "  amount          NUMERIC(12,2)  NOT NULL," +
        "  note            TEXT," +
        "  status          VARCHAR(20)    NOT NULL DEFAULT 'Completed'," +
        "  created_at      TIMESTAMP      NOT NULL DEFAULT NOW()" +
        ")"
    );
    stmt.close();

    /* Insert the new transaction row */
    ps = con.prepareStatement(
        "INSERT INTO transactions " +
        "  (txn_id, sender_email, sender_name, pay_mode, " +
        "   recipient_name, recipient_ref, ifsc_code, amount, note, status) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'Completed')"
    );
    ps.setString(1, txnId);
    ps.setString(2, loggedInEmail.trim());
    ps.setString(3, loggedInUser.trim());
    ps.setString(4, methodLabel);
    ps.setString(5, recipientName.isEmpty() ? null : recipientName);
    ps.setString(6, recipientRef);
    ps.setString(7, ifscCode.isEmpty()      ? null : ifscCode);
    ps.setBigDecimal(8, BigDecimal.valueOf(amount));
    ps.setString(9, note.isEmpty()          ? null : note);
    ps.executeUpdate();

} catch (Exception e) {
    /* DB write failed — log it but still return TXN_ID so the UI keeps working */
    application.log("ProcessPayment DB error: " + e.getMessage());
    out.print("TXN_ID:" + txnId + ":DB_WARN");
    out.flush();
    return;
} finally {
    if (ps  != null) try { ps.close();  } catch(Exception ex) {}
    if (con != null) try { con.close(); } catch(Exception ex) {}
}

/* ── 7. Return success ───────────────────────────────────── */
out.print("TXN_ID:" + txnId);
out.flush();
%>
