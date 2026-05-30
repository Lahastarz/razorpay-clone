<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.Map" %>
<%!
/* Helper: escape HTML — declared at class level so it works everywhere */
private String escFn(String s) {
    if (s == null) return "";
    return s.replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;");
}
%>
<%
/* ── Session guard ── */
String loggedInUser = (String) session.getAttribute("loggedInUser");
if (loggedInUser == null || loggedInUser.isEmpty()) {
    response.sendRedirect("Login.jsp");
    return;
}
String loggedInEmail = (String) session.getAttribute("loggedInEmail");
if (loggedInEmail == null) loggedInEmail = "";
String avatarLetter = loggedInUser.substring(0, 1).toUpperCase();

/* ── Inner class for transaction rows ── */
class TxnRow {
    String txnId, recipientName, recipientRef, payMode, ifscCode, note, status, createdAt;
    double amount;
    TxnRow(String txnId, String recipientName, String recipientRef,
           String payMode, String ifscCode, double amount,
           String note, String status, String createdAt) {
        this.txnId = txnId; this.recipientName = recipientName;
        this.recipientRef = recipientRef; this.payMode = payMode;
        this.ifscCode = ifscCode; this.amount = amount;
        this.note = note; this.status = status; this.createdAt = createdAt;
    }
}

ArrayList<TxnRow> txnList = new ArrayList<>();
int txnCount = 0;
double totalSent = 0;
String dbError = null;

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try {
    Class.forName("org.postgresql.Driver");
    con = DriverManager.getConnection(
        "jdbc:postgresql://localhost:5432/postgres", "postgres", "arnab05");

    /* Ensure table exists */
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

    /* Fetch this user's transactions, newest first */
    ps = con.prepareStatement(
        "SELECT txn_id, recipient_name, recipient_ref, pay_mode, ifsc_code, " +
        "       amount, note, status, " +
        "       TO_CHAR(created_at, 'DD Mon YYYY, HH12:MI AM') AS created_at " +
        "FROM transactions WHERE sender_email = ? ORDER BY created_at DESC");
    ps.setString(1, loggedInEmail.trim());
    rs = ps.executeQuery();
    while (rs.next()) {
        double amt = rs.getDouble("amount");
        txnList.add(new TxnRow(
            rs.getString("txn_id"),
            rs.getString("recipient_name") != null ? rs.getString("recipient_name") : "",
            rs.getString("recipient_ref"),
            rs.getString("pay_mode"),
            rs.getString("ifsc_code") != null ? rs.getString("ifsc_code") : "",
            amt,
            rs.getString("note") != null ? rs.getString("note") : "",
            rs.getString("status"),
            rs.getString("created_at")
        ));
        txnCount++;
        totalSent += amt;
    }
} catch (Exception e) {
    dbError = e.getMessage();
} finally {
    if (rs  != null) try { rs.close();  } catch(Exception ex) {}
    if (ps  != null) try { ps.close();  } catch(Exception ex) {}
    if (con != null) try { con.close(); } catch(Exception ex) {}
}

/* Count by status */
long completedCount = 0, pendingCount = 0, failedCount = 0;
for (TxnRow t : txnList) {
    if ("Completed".equals(t.status)) completedCount++;
    else if ("Pending".equals(t.status)) pendingCount++;
    else if ("Failed".equals(t.status)) failedCount++;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Dashboard – Razorpay</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,400;0,9..40,500;0,9..40,600;0,9..40,700;0,9..40,800&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --blue-700: #1d4ed8;
      --blue-600: #2563eb;
      --blue-500: #3b82f6;
      --blue-50:  #eff6ff;
      --blue-100: #dbeafe;
      --green-500: #22c55e;
      --green-50:  #f0fdf4;
      --green-100: #dcfce7;
      --green-600: #16a34a;
      --green-700: #15803d;
      --red-50:  #fef2f2;
      --red-100: #fee2e2;
      --red-500: #ef4444;
      --red-600: #dc2626;
      --amber-50:  #fffbeb;
      --amber-100: #fef3c7;
      --amber-600: #d97706;
      --amber-700: #b45309;
      --gray-900: #0f172a;
      --gray-800: #1e293b;
      --gray-700: #334155;
      --gray-600: #475569;
      --gray-500: #64748b;
      --gray-400: #94a3b8;
      --gray-300: #cbd5e1;
      --gray-200: #e2e8f0;
      --gray-100: #f1f5f9;
      --gray-50:  #f8fafc;
      --sidebar-w: 248px;
      --radius-sm: 8px;
      --radius-md: 12px;
      --radius-lg: 16px;
      --radius-xl: 20px;
      --shadow-sm: 0 1px 3px rgba(15,23,42,0.06), 0 1px 2px rgba(15,23,42,0.04);
      --shadow-md: 0 4px 12px rgba(15,23,42,0.08), 0 2px 6px rgba(15,23,42,0.05);
      --shadow-lg: 0 10px 32px rgba(15,23,42,0.1), 0 4px 12px rgba(15,23,42,0.06);
    }

    body {
      font-family: 'DM Sans', sans-serif;
      background: #f0f4f8;
      color: var(--gray-900);
      min-height: 100vh;
      display: flex;
      overflow-x: hidden;
    }

    /* ── SIDEBAR ─────────────────────────────────────────── */
    .sidebar {
      width: var(--sidebar-w);
      min-height: 100vh;
      background: #fff;
      border-right: 1px solid var(--gray-200);
      display: flex;
      flex-direction: column;
      position: fixed;
      top: 0; left: 0;
      z-index: 100;
      box-shadow: var(--shadow-sm);
    }

    .sidebar-logo {
      height: 64px;
      padding: 0 20px;
      display: flex;
      align-items: center;
      gap: 10px;
      border-bottom: 1px solid var(--gray-100);
      text-decoration: none;
    }

    .logo-icon {
      width: 34px; height: 34px;
      background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
      border-radius: 10px;
      display: flex; align-items: center; justify-content: center;
      box-shadow: 0 4px 10px rgba(37,99,235,0.35);
    }

    .logo-icon svg { width: 18px; height: 18px; }

    .logo-text {
      font-size: 17px;
      font-weight: 800;
      color: var(--gray-900);
      letter-spacing: -0.4px;
    }

    .sidebar-section {
      padding: 18px 12px 6px;
    }

    .sidebar-section-label {
      font-size: 10px;
      font-weight: 700;
      text-transform: uppercase;
      letter-spacing: 1px;
      color: var(--gray-400);
      padding: 0 10px;
      margin-bottom: 4px;
    }

    .nav-item {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 9px 10px;
      border-radius: var(--radius-sm);
      font-size: 13.5px;
      font-weight: 500;
      color: var(--gray-500);
      text-decoration: none;
      cursor: pointer;
      transition: background 0.15s, color 0.15s;
      position: relative;
    }

    .nav-item:hover { background: var(--gray-50); color: var(--gray-800); }

    .nav-item.active {
      background: var(--blue-50);
      color: var(--blue-600);
      font-weight: 600;
    }

    .nav-item svg { width: 15px; height: 15px; flex-shrink: 0; }

    .nav-badge {
      margin-left: auto;
      background: var(--blue-600);
      color: white;
      font-size: 10px;
      font-weight: 700;
      padding: 2px 7px;
      border-radius: 100px;
      min-width: 20px;
      text-align: center;
    }

    .nav-badge.new {
      background: #dcfce7;
      color: var(--green-700);
    }

    .sidebar-bottom {
      margin-top: auto;
      padding: 14px 12px;
      border-top: 1px solid var(--gray-100);
    }

    .user-card {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px 12px;
      border-radius: var(--radius-md);
      background: var(--gray-50);
      border: 1px solid var(--gray-100);
    }

    .avatar {
      width: 34px; height: 34px;
      background: linear-gradient(135deg, var(--blue-600), var(--blue-500));
      color: white;
      border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-size: 13px;
      font-weight: 700;
      flex-shrink: 0;
      box-shadow: 0 2px 6px rgba(37,99,235,0.3);
    }

    .user-info { overflow: hidden; }
    .user-name  { font-size: 13px; font-weight: 700; color: var(--gray-900); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    .user-email { font-size: 11px; color: var(--gray-400); white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

    /* ── MAIN LAYOUT ──────────────────────────────────────── */
    .page-wrap {
      margin-left: var(--sidebar-w);
      flex: 1;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }

    /* ── TOPBAR ───────────────────────────────────────────── */
    .topbar {
      height: 64px;
      background: #fff;
      border-bottom: 1px solid var(--gray-200);
      display: flex;
      align-items: center;
      padding: 0 32px;
      gap: 14px;
      position: sticky;
      top: 0; z-index: 50;
      box-shadow: var(--shadow-sm);
    }

    .topbar-title {
      font-size: 14.5px;
      font-weight: 700;
      color: var(--gray-900);
      flex: 1;
    }

    .topbar-search {
      display: flex;
      align-items: center;
      gap: 8px;
      background: var(--gray-50);
      border: 1.5px solid var(--gray-200);
      border-radius: var(--radius-sm);
      padding: 7px 14px;
      width: 240px;
      transition: border-color 0.15s, box-shadow 0.15s;
    }
    .topbar-search:focus-within {
      border-color: var(--blue-400, #60a5fa);
      box-shadow: 0 0 0 3px rgba(59,130,246,0.1);
    }

    .topbar-search svg { width: 14px; height: 14px; color: var(--gray-400); flex-shrink: 0; }
    .topbar-search input {
      background: transparent;
      border: none;
      outline: none;
      font-size: 13px;
      color: var(--gray-700);
      font-family: 'DM Sans', sans-serif;
      width: 100%;
    }
    .topbar-search input::placeholder { color: var(--gray-400); }

    .topbar-actions { display: flex; align-items: center; gap: 8px; }

    .icon-btn {
      width: 36px; height: 36px;
      background: var(--gray-50);
      border: 1.5px solid var(--gray-200);
      border-radius: var(--radius-sm);
      display: flex; align-items: center; justify-content: center;
      cursor: pointer;
      transition: all 0.15s;
      text-decoration: none;
      position: relative;
    }
    .icon-btn:hover { background: var(--gray-100); border-color: var(--gray-300); }
    .icon-btn svg { width: 15px; height: 15px; color: var(--gray-500); }

    .notif-dot {
      position: absolute;
      top: 6px; right: 6px;
      width: 7px; height: 7px;
      background: var(--red-500);
      border-radius: 50%;
      border: 1.5px solid white;
    }

    .btn-logout {
      display: flex; align-items: center; gap: 6px;
      padding: 7px 14px;
      background: transparent;
      border: 1.5px solid var(--gray-200);
      border-radius: var(--radius-sm);
      font-size: 12.5px;
      font-weight: 600;
      color: var(--gray-500);
      cursor: pointer;
      text-decoration: none;
      font-family: 'DM Sans', sans-serif;
      transition: all 0.15s;
    }
    .btn-logout:hover { background: #fef2f2; border-color: #fca5a5; color: var(--red-600); }
    .btn-logout svg { width: 14px; height: 14px; }

    /* ── CONTENT ──────────────────────────────────────────── */
    .content { padding: 28px 32px; flex: 1; }

    /* ── HERO BANNER ──────────────────────────────────────── */
    .hero {
      background: linear-gradient(135deg, #0c1445 0%, #1a2980 40%, #26d0ce 100%);
      border-radius: var(--radius-xl);
      padding: 36px 44px;
      margin-bottom: 24px;
      position: relative;
      overflow: hidden;
      display: flex;
      align-items: center;
      justify-content: space-between;
      box-shadow: 0 12px 40px rgba(26,41,128,0.25);
    }

    .hero::before {
      content: '';
      position: absolute;
      right: -60px; top: -60px;
      width: 300px; height: 300px;
      background: radial-gradient(circle, rgba(255,255,255,0.07) 0%, transparent 70%);
      border-radius: 50%;
    }
    .hero::after {
      content: '';
      position: absolute;
      left: 30%; bottom: -80px;
      width: 260px; height: 260px;
      background: radial-gradient(circle, rgba(38,208,206,0.12) 0%, transparent 70%);
      border-radius: 50%;
    }

    .hero-left { position: relative; z-index: 1; }

    .hero-tag {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      background: rgba(255,255,255,0.1);
      border: 1px solid rgba(255,255,255,0.18);
      color: rgba(255,255,255,0.9);
      font-size: 11.5px;
      font-weight: 600;
      padding: 4px 12px;
      border-radius: 100px;
      margin-bottom: 14px;
      letter-spacing: 0.4px;
      backdrop-filter: blur(6px);
    }

    .hero-tag svg { width: 12px; height: 12px; color: #7dd3fc; }

    .hero h1 {
      font-size: 30px;
      font-weight: 800;
      color: #fff;
      line-height: 1.2;
      margin-bottom: 8px;
      letter-spacing: -0.5px;
    }

    .hero h1 span { color: #7dd3fc; }

    .hero p {
      font-size: 14px;
      color: rgba(255,255,255,0.6);
      margin-bottom: 22px;
      line-height: 1.6;
    }

    .hero-btns { display: flex; gap: 10px; flex-wrap: wrap; }

    .btn-primary {
      display: inline-flex; align-items: center; gap: 6px;
      background: #fff;
      color: var(--blue-700);
      font-weight: 700;
      font-size: 13px;
      padding: 9px 20px;
      border-radius: var(--radius-sm);
      text-decoration: none;
      transition: all 0.15s;
      font-family: 'DM Sans', sans-serif;
      border: none;
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(0,0,0,0.15);
    }
    .btn-primary:hover { transform: translateY(-1px); box-shadow: 0 4px 14px rgba(0,0,0,0.2); }
    .btn-primary svg { width: 14px; height: 14px; }

    .btn-secondary {
      display: inline-flex; align-items: center; gap: 6px;
      background: rgba(255,255,255,0.1);
      color: rgba(255,255,255,0.9);
      font-weight: 600;
      font-size: 13px;
      padding: 9px 20px;
      border-radius: var(--radius-sm);
      text-decoration: none;
      border: 1px solid rgba(255,255,255,0.22);
      transition: background 0.15s;
      font-family: 'DM Sans', sans-serif;
      cursor: pointer;
      backdrop-filter: blur(4px);
    }
    .btn-secondary:hover { background: rgba(255,255,255,0.18); }

    .hero-right {
      position: relative; z-index: 1;
      display: flex;
      flex-direction: column;
      gap: 10px;
      min-width: 220px;
    }

    .hero-pill {
      background: rgba(255,255,255,0.1);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(255,255,255,0.16);
      border-radius: 100px;
      padding: 9px 18px;
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 13px;
      color: white;
      font-weight: 500;
    }

    .hero-pill svg { width: 13px; height: 13px; color: #7dd3fc; }

    .pill-dot {
      width: 8px; height: 8px;
      border-radius: 50%;
      background: #4ade80;
      box-shadow: 0 0 6px rgba(74,222,128,0.6);
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0%, 100% { opacity: 1; transform: scale(1); }
      50% { opacity: 0.6; transform: scale(0.85); }
    }

    /* ── KPI CARDS ────────────────────────────────────────── */
    .kpi-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin-bottom: 24px;
    }

    .kpi-card {
      background: #fff;
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-lg);
      padding: 20px 22px;
      transition: box-shadow 0.2s, transform 0.2s;
      cursor: default;
      box-shadow: var(--shadow-sm);
    }

    .kpi-card:hover {
      box-shadow: var(--shadow-md);
      transform: translateY(-2px);
    }

    .kpi-top {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 14px;
    }

    .kpi-label {
      font-size: 11px;
      font-weight: 700;
      color: var(--gray-400);
      text-transform: uppercase;
      letter-spacing: 0.7px;
    }

    .kpi-icon {
      width: 38px; height: 38px;
      border-radius: var(--radius-sm);
      display: flex; align-items: center; justify-content: center;
    }
    .kpi-icon svg { width: 17px; height: 17px; }

    .kpi-blue   { background: #eff6ff; color: var(--blue-600); }
    .kpi-green  { background: #f0fdf4; color: var(--green-600); }
    .kpi-amber  { background: #fffbeb; color: var(--amber-600); }
    .kpi-red    { background: #fef2f2; color: var(--red-600); }

    .kpi-value {
      font-size: 26px;
      font-weight: 800;
      color: var(--gray-900);
      letter-spacing: -0.5px;
      margin-bottom: 6px;
      line-height: 1;
    }

    .kpi-change {
      display: flex;
      align-items: center;
      gap: 4px;
      font-size: 12px;
      font-weight: 600;
    }
    .kpi-change.up   { color: var(--green-600); }
    .kpi-change.neutral { color: var(--gray-400); }
    .kpi-change svg { width: 12px; height: 12px; }

    /* ── TWO-COLUMN GRID ──────────────────────────────────── */
    .two-col {
      display: grid;
      grid-template-columns: 1fr 340px;
      gap: 20px;
      margin-bottom: 24px;
    }

    /* ── CARDS ────────────────────────────────────────────── */
    .card {
      background: #fff;
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-lg);
      overflow: hidden;
      box-shadow: var(--shadow-sm);
    }

    .card-header {
      padding: 18px 22px 14px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      border-bottom: 1px solid var(--gray-100);
    }

    .card-title {
      font-size: 14.5px;
      font-weight: 700;
      color: var(--gray-900);
    }

    .card-sub {
      font-size: 12px;
      color: var(--gray-400);
      margin-top: 2px;
    }

    .link-btn {
      font-size: 12.5px;
      font-weight: 600;
      color: var(--blue-600);
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 4px;
      transition: opacity 0.15s;
    }
    .link-btn:hover { opacity: 0.75; }
    .link-btn svg { width: 12px; height: 12px; }

    /* ── TABLE ────────────────────────────────────────────── */
    .txn-table { width: 100%; border-collapse: collapse; }

    .txn-table thead th {
      padding: 10px 22px;
      text-align: left;
      font-size: 10.5px;
      font-weight: 700;
      color: var(--gray-400);
      text-transform: uppercase;
      letter-spacing: 0.6px;
      background: var(--gray-50);
      border-bottom: 1px solid var(--gray-100);
    }

    .txn-table tbody tr {
      border-bottom: 1px solid var(--gray-100);
      transition: background 0.12s;
    }
    .txn-table tbody tr:last-child { border-bottom: none; }
    .txn-table tbody tr:hover { background: #f8fafc; }

    .txn-table td { padding: 12px 22px; font-size: 13px; }

    .txn-id { color: var(--gray-400); font-family: 'Courier New', monospace; font-size: 11.5px; }

    .txn-desc { font-weight: 600; color: var(--gray-900); font-size: 13.5px; }
    .txn-method { color: var(--gray-400); font-size: 11.5px; margin-top: 2px; }

    .txn-amount { font-weight: 700; color: var(--gray-900); }

    .badge {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      padding: 3px 9px;
      border-radius: 100px;
      font-size: 11.5px;
      font-weight: 700;
    }
    .badge-success { background: #dcfce7; color: var(--green-700); }
    .badge-pending { background: #fef3c7; color: var(--amber-700); }
    .badge-failed  { background: #fee2e2; color: var(--red-600); }

    /* ── ACTIVITY FEED ────────────────────────────────────── */
    .activity-list { padding: 0 22px; }

    .activity-item {
      display: flex;
      gap: 12px;
      padding: 13px 0;
      border-bottom: 1px solid var(--gray-100);
    }
    .activity-item:last-child { border-bottom: none; }

    .activity-dot {
      width: 8px; height: 8px;
      border-radius: 50%;
      margin-top: 5px;
      flex-shrink: 0;
    }
    .dot-blue  { background: var(--blue-500); box-shadow: 0 0 0 3px rgba(59,130,246,0.15); }
    .dot-green { background: var(--green-500); box-shadow: 0 0 0 3px rgba(34,197,94,0.15); }
    .dot-amber { background: #f59e0b; box-shadow: 0 0 0 3px rgba(245,158,11,0.15); }
    .dot-gray  { background: var(--gray-300); }

    .activity-text {
      font-size: 13px;
      color: var(--gray-600);
      line-height: 1.55;
    }
    .activity-text strong { color: var(--gray-900); }

    .activity-time {
      font-size: 11px;
      color: var(--gray-400);
      margin-top: 3px;
    }

    /* ── PRODUCTS SECTION ─────────────────────────────────── */
    .section-head {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 14px;
    }

    .section-title {
      font-size: 16px;
      font-weight: 800;
      color: var(--gray-900);
      letter-spacing: -0.2px;
    }

    .section-title span { color: var(--blue-600); }

    .products-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 14px;
      margin-bottom: 24px;
    }

    .product-card {
      background: #fff;
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-lg);
      padding: 22px;
      display: flex;
      flex-direction: column;
      gap: 12px;
      cursor: pointer;
      transition: box-shadow 0.2s, transform 0.2s, border-color 0.2s;
      text-decoration: none;
      color: inherit;
      position: relative;
      overflow: hidden;
      box-shadow: var(--shadow-sm);
    }

    .product-card:hover {
      box-shadow: 0 10px 32px rgba(37,99,235,0.12);
      transform: translateY(-3px);
      border-color: var(--blue-100);
    }

    .product-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 3px;
      background: linear-gradient(90deg, var(--blue-600), var(--blue-400, #60a5fa));
      opacity: 0;
      transition: opacity 0.2s;
    }

    .product-card:hover::before { opacity: 1; }

    .product-icon-wrap {
      width: 46px; height: 46px;
      border-radius: 12px;
      display: flex; align-items: center; justify-content: center;
    }

    .product-icon-wrap svg { width: 20px; height: 20px; }

    .pi-blue  { background: #eff6ff; color: var(--blue-600); }
    .pi-green { background: #f0fdf4; color: var(--green-600); }
    .pi-teal  { background: #f0fdfa; color: #0d9488; }
    .pi-rose  { background: #fff1f2; color: #e11d48; }
    .pi-amber { background: #fffbeb; color: var(--amber-600); }
    .pi-slate { background: #f1f5f9; color: #475569; }

    .product-card h3 {
      font-size: 14px;
      font-weight: 700;
      color: var(--gray-900);
    }

    .product-card p {
      font-size: 12.5px;
      color: var(--gray-500);
      line-height: 1.6;
    }

    .product-card-footer {
      display: flex;
      align-items: center;
      gap: 14px;
      margin-top: auto;
      padding-top: 2px;
    }

    .product-link {
      font-size: 12px;
      font-weight: 700;
      color: var(--blue-600);
      display: flex;
      align-items: center;
      gap: 4px;
    }

    .product-link svg { width: 11px; height: 11px; }

    .product-link-ghost {
      font-size: 12px;
      font-weight: 600;
      color: var(--gray-400);
    }

    /* ── BOTTOM GRID ──────────────────────────────────────── */
    .bottom-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }

    .info-list { padding: 0 22px 6px; }

    .info-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid var(--gray-100);
      font-size: 13px;
    }
    .info-row:last-child { border-bottom: none; }
    .info-key { color: var(--gray-500); font-weight: 500; }
    .info-val { color: var(--gray-900); font-weight: 600; }

    .status-badge {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      background: #dcfce7;
      color: var(--green-700);
      font-size: 12px;
      font-weight: 700;
      padding: 3px 10px;
      border-radius: 100px;
    }

    .status-dot {
      width: 6px; height: 6px;
      background: var(--green-500);
      border-radius: 50%;
      animation: pulse 2s infinite;
    }

    .plan-chip {
      background: var(--blue-50);
      color: var(--blue-600);
      font-size: 12px;
      font-weight: 700;
      padding: 3px 10px;
      border-radius: 100px;
      border: 1px solid var(--blue-100);
    }

    /* ── SUPPORT CARD ─────────────────────────────────────── */
    .support-body { padding: 18px 22px; }

    .support-item {
      display: flex;
      align-items: center;
      gap: 13px;
      padding: 11px 0;
      border-bottom: 1px solid var(--gray-100);
      text-decoration: none;
      color: inherit;
      transition: all 0.15s;
    }
    .support-item:last-child { border-bottom: none; }
    .support-item:hover .support-label { color: var(--blue-600); }

    .support-icon {
      width: 36px; height: 36px;
      border-radius: var(--radius-sm);
      background: var(--gray-50);
      border: 1px solid var(--gray-100);
      display: flex; align-items: center; justify-content: center;
      flex-shrink: 0;
    }
    .support-icon svg { width: 15px; height: 15px; color: var(--gray-500); }

    .support-label { font-size: 13px; font-weight: 600; color: var(--gray-800); transition: color 0.15s; }
    .support-sub   { font-size: 11.5px; color: var(--gray-400); margin-top: 1px; }

    .support-arrow { margin-left: auto; color: var(--gray-300); flex-shrink: 0; }
    .support-arrow svg { width: 13px; height: 13px; }

    /* ── RESPONSIVE ───────────────────────────────────────── */
    @media (max-width: 1100px) {
      .kpi-grid { grid-template-columns: repeat(2, 1fr); }
      .two-col  { grid-template-columns: 1fr; }
      .hero-right { display: none; }
    }

    @media (max-width: 768px) {
      :root { --sidebar-w: 0px; }
      .sidebar { display: none; }
      .products-grid { grid-template-columns: 1fr; }
      .bottom-grid   { grid-template-columns: 1fr; }
      .content { padding: 20px; }
      .hero { padding: 28px 24px; }
      .hero h1 { font-size: 22px; }
      .topbar { padding: 0 20px; }
      .topbar-search { display: none; }
    }

    /* ── TRANSACTIONS STATS STRIP ───────────────────────────── */
    .txn-stats-strip {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 14px;
      margin-bottom: 20px;
    }

    .txn-stat-card {
      border-radius: var(--radius-lg);
      padding: 20px 22px;
      border: 1px solid transparent;
      box-shadow: var(--shadow-sm);
      position: relative;
      overflow: hidden;
    }

    .txn-stat-card::after {
      content: '';
      position: absolute;
      bottom: 0; right: 0;
      width: 60px; height: 60px;
      border-radius: 50%;
      opacity: 0.12;
    }

    .stat-blue  { background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%); border-color: #bfdbfe; }
    .stat-blue::after  { background: var(--blue-600); }
    .stat-green { background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%); border-color: #bbf7d0; }
    .stat-green::after { background: var(--green-600); }
    .stat-amber { background: linear-gradient(135deg, #fffbeb 0%, #fef3c7 100%); border-color: #fde68a; }
    .stat-amber::after { background: var(--amber-600); }
    .stat-red   { background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%); border-color: #fecaca; }
    .stat-red::after   { background: var(--red-600); }

    .stat-label { font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.7px; margin-bottom: 8px; }
    .stat-blue  .stat-label { color: #3b82f6; }
    .stat-green .stat-label { color: var(--green-600); }
    .stat-amber .stat-label { color: var(--amber-600); }
    .stat-red   .stat-label { color: var(--red-500); }

    .stat-value { font-size: 28px; font-weight: 800; letter-spacing: -0.6px; line-height: 1; }
    .stat-blue  .stat-value { color: var(--blue-700); }
    .stat-green .stat-value { color: var(--green-700); }
    .stat-amber .stat-value { color: var(--amber-700); }
    .stat-red   .stat-value { color: var(--red-600); }

    /* Method chip */
    .txn-mode-chip {
      display: inline-flex;
      align-items: center;
      font-size: 10.5px; font-weight: 700;
      padding: 3px 8px; border-radius: 6px;
      letter-spacing: 0.3px;
    }
    .mode-upi  { background: #eff6ff; color: var(--blue-600); border: 1px solid #bfdbfe; }
    .mode-bank { background: #f0fdf4; color: var(--green-700); border: 1px solid #bbf7d0; }

    .txn-note-text { font-size: 12.5px; color: var(--gray-500); font-style: italic; }
    .txn-date { font-size: 11.5px; color: var(--gray-400); white-space: nowrap; }

    /* Full table enhanced */
    .txn-table-full thead th:nth-child(4) { min-width: 100px; }

    /* Empty state */
    .txn-empty-state { text-align: center; padding: 64px 20px; }
    .txn-empty-icon {
      width: 68px; height: 68px;
      margin: 0 auto 16px;
      background: var(--gray-100); border-radius: var(--radius-lg);
      display: flex; align-items: center; justify-content: center;
      border: 1px solid var(--gray-200);
    }
    .txn-empty-icon svg { width: 30px; height: 30px; color: var(--gray-400); }
    .txn-empty-title { font-size: 15px; font-weight: 700; color: var(--gray-800); margin-bottom: 6px; }
    .txn-empty-sub   { font-size: 13px; color: var(--gray-400); }

    /* Table footer */
    .txn-table-footer {
      padding: 13px 22px;
      font-size: 12px;
      color: var(--gray-400);
      border-top: 1px solid var(--gray-100);
      background: var(--gray-50);
    }

    .txn-page-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 22px;
    }

    .txn-page-title {
      font-size: 20px;
      font-weight: 800;
      color: var(--gray-900);
      letter-spacing: -0.4px;
    }

    .txn-page-sub {
      font-size: 13px;
      color: var(--gray-400);
      margin-top: 3px;
    }

    .btn-send-money {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      background: linear-gradient(135deg, var(--blue-600) 0%, var(--blue-700) 100%);
      color: #fff;
      font-size: 13.5px;
      font-weight: 700;
      padding: 10px 22px;
      border-radius: var(--radius-md);
      border: none;
      cursor: pointer;
      font-family: 'DM Sans', sans-serif;
      transition: all 0.15s;
      box-shadow: 0 4px 14px rgba(37,99,235,0.35);
      letter-spacing: 0.1px;
    }
    .btn-send-money:hover {
      box-shadow: 0 6px 20px rgba(37,99,235,0.45);
      transform: translateY(-1px);
    }
    .btn-send-money:active { transform: scale(0.98); }
    .btn-send-money svg { width: 16px; height: 16px; }

    .txn-full-table-wrap {
      background: #fff;
      border: 1px solid var(--gray-200);
      border-radius: var(--radius-lg);
      overflow: hidden;
      box-shadow: var(--shadow-sm);
    }

    .txn-filter-bar {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 14px 22px;
      border-bottom: 1px solid var(--gray-100);
      flex-wrap: wrap;
      background: var(--gray-50);
    }

    .txn-filter-search {
      display: flex;
      align-items: center;
      gap: 8px;
      background: #fff;
      border: 1.5px solid var(--gray-200);
      border-radius: var(--radius-sm);
      padding: 8px 12px;
      flex: 1;
      min-width: 200px;
      transition: border-color 0.15s;
    }
    .txn-filter-search:focus-within { border-color: var(--blue-500); }
    .txn-filter-search svg { width: 13px; height: 13px; color: var(--gray-400); flex-shrink: 0; }
    .txn-filter-search input {
      background: transparent; border: none; outline: none;
      font-size: 13px; color: var(--gray-700);
      font-family: 'DM Sans', sans-serif; width: 100%;
    }

    .txn-filter-select {
      background: #fff; border: 1.5px solid var(--gray-200);
      border-radius: var(--radius-sm); padding: 8px 12px;
      font-size: 13px; color: var(--gray-700);
      font-family: 'DM Sans', sans-serif; outline: none; cursor: pointer;
      transition: border-color 0.15s;
    }
    .txn-filter-select:focus { border-color: var(--blue-500); }

    /* ── SEND MONEY MODAL ───────────────────────────────────── */
    .modal-overlay {
      position: fixed;
      inset: 0;
      background: rgba(15,23,42,0.6);
      backdrop-filter: blur(6px);
      z-index: 1000;
      display: none;
      align-items: center;
      justify-content: center;
      animation: fadeIn 0.2s ease;
    }
    .modal-overlay.open { display: flex; }

    @keyframes fadeIn {
      from { opacity: 0; }
      to   { opacity: 1; }
    }

    .modal {
      background: #fff;
      border-radius: var(--radius-xl);
      width: 520px;
      max-width: calc(100vw - 40px);
      max-height: calc(100vh - 60px);
      overflow-y: auto;
      box-shadow: 0 24px 80px rgba(0,0,0,0.22);
      animation: slideUp 0.25s ease;
    }

    @keyframes slideUp {
      from { opacity: 0; transform: translateY(24px) scale(0.97); }
      to   { opacity: 1; transform: translateY(0) scale(1); }
    }

    .modal-header {
      padding: 28px 28px 0;
      display: flex;
      align-items: flex-start;
      justify-content: space-between;
    }

    .modal-header-left { }
    .modal-title { font-size: 20px; font-weight: 800; color: var(--gray-900); letter-spacing: -0.3px; }
    .modal-sub   { font-size: 13px; color: var(--gray-400); margin-top: 4px; }

    .modal-close {
      width: 34px; height: 34px;
      background: var(--gray-100); border: none; border-radius: 8px;
      cursor: pointer; display: flex; align-items: center; justify-content: center;
      color: var(--gray-500); transition: background 0.15s;
      flex-shrink: 0;
    }
    .modal-close:hover { background: var(--gray-200); }
    .modal-close svg { width: 16px; height: 16px; }

    .modal-body { padding: 24px 28px 28px; }

    /* Tab switcher */
    .pay-tabs {
      display: flex;
      background: var(--gray-100);
      border-radius: 10px;
      padding: 4px;
      gap: 4px;
      margin-bottom: 24px;
    }

    .pay-tab {
      flex: 1;
      padding: 9px 12px;
      border: none;
      background: transparent;
      border-radius: 7px;
      font-size: 13px;
      font-weight: 600;
      color: var(--gray-500);
      cursor: pointer;
      font-family: 'DM Sans', sans-serif;
      transition: all 0.15s;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
    }
    .pay-tab svg { width: 14px; height: 14px; }
    .pay-tab.active {
      background: #fff;
      color: var(--blue-600);
      box-shadow: 0 1px 4px rgba(0,0,0,0.1);
    }

    .tab-panel { display: none; }
    .tab-panel.active { display: block; }

    /* Form fields in modal */
    .m-form-group { margin-bottom: 16px; }
    .m-label {
      display: block; font-size: 12.5px; font-weight: 700;
      color: var(--gray-500); text-transform: uppercase;
      letter-spacing: 0.5px; margin-bottom: 6px;
    }
    .m-input {
      width: 100%; padding: 12px 14px;
      border: 1.5px solid var(--gray-200);
      border-radius: 10px; font-size: 14.5px;
      color: var(--gray-900); outline: none;
      font-family: 'DM Sans', sans-serif;
      transition: border-color 0.15s, box-shadow 0.15s;
      background: #fff;
    }
    .m-input::placeholder { color: var(--gray-400); font-size: 13.5px; }
    .m-input:focus {
      border-color: var(--blue-500);
      box-shadow: 0 0 0 3px rgba(59,130,246,0.12);
    }
    .m-input.has-prefix { padding-left: 40px; }

    .m-input-wrap { position: relative; }
    .m-prefix {
      position: absolute; left: 14px; top: 50%;
      transform: translateY(-50%);
      font-size: 14.5px; font-weight: 700; color: var(--gray-400);
      pointer-events: none;
    }

    .m-row { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }

    .amount-limit {
      font-size: 11.5px; color: var(--gray-400);
      margin-top: 5px;
    }

    .m-textarea {
      width: 100%; padding: 12px 14px;
      border: 1.5px solid var(--gray-200);
      border-radius: 10px; font-size: 13.5px;
      color: var(--gray-900); outline: none;
      font-family: 'DM Sans', sans-serif;
      transition: border-color 0.15s, box-shadow 0.15s;
      resize: none; min-height: 80px;
    }
    .m-textarea:focus {
      border-color: var(--blue-500);
      box-shadow: 0 0 0 3px rgba(59,130,246,0.12);
    }

    /* Confirm summary */
    .pay-summary {
      background: var(--blue-50);
      border: 1.5px solid var(--blue-100);
      border-radius: 12px;
      padding: 16px;
      margin-bottom: 20px;
      display: none;
    }
    .pay-summary.visible { display: block; }
    .pay-summary-row {
      display: flex; justify-content: space-between;
      font-size: 13px; padding: 4px 0;
    }
    .pay-summary-key { color: var(--gray-500); }
    .pay-summary-val { color: var(--gray-900); font-weight: 600; }
    .pay-summary-amt { font-size: 22px; font-weight: 800; color: var(--blue-600); margin-bottom: 8px; }

    .btn-pay {
      width: 100%;
      padding: 14px;
      background: var(--blue-600);
      color: #fff;
      border: none;
      border-radius: 10px;
      font-size: 15px;
      font-weight: 700;
      cursor: pointer;
      font-family: 'DM Sans', sans-serif;
      transition: background 0.15s, transform 0.1s;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      letter-spacing: 0.1px;
    }
    .btn-pay:hover { background: #1d4ed8; }
    .btn-pay:active { transform: scale(0.99); }
    .btn-pay:disabled { background: #93c5fd; cursor: not-allowed; }
    .btn-pay svg { width: 16px; height: 16px; }

    /* Success screen */
    .pay-success {
      text-align: center;
      padding: 20px 0 8px;
      display: none;
    }
    .pay-success.visible { display: block; }

    .success-icon {
      width: 72px; height: 72px;
      background: var(--green-100);
      border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      margin: 0 auto 16px;
    }
    .success-icon svg { width: 36px; height: 36px; color: var(--green-700); }

    .success-title { font-size: 20px; font-weight: 800; color: var(--gray-900); margin-bottom: 6px; }
    .success-sub   { font-size: 13.5px; color: var(--gray-400); margin-bottom: 20px; }
    .success-txn   { font-size: 12px; color: var(--gray-400); font-family: monospace; }

    .btn-done {
      display: inline-flex; align-items: center; gap: 6px;
      background: var(--blue-600); color: #fff;
      font-size: 13.5px; font-weight: 700;
      padding: 10px 28px; border-radius: 10px;
      border: none; cursor: pointer;
      font-family: 'DM Sans', sans-serif;
      margin-top: 16px;
    }

    /* Error banner in modal */
    .m-error {
      background: var(--red-50); border: 1.5px solid #fecaca;
      color: var(--red-600); border-radius: 8px;
      padding: 10px 14px; font-size: 13px; font-weight: 500;
      margin-bottom: 16px; display: none;
      gap: 8px; align-items: flex-start;
    }
    .m-error.visible { display: flex; }
    .m-error svg { width: 16px; height: 16px; flex-shrink: 0; margin-top: 1px; }

    /* Recipient info chip in txn table */
    .txn-recip { color: var(--gray-400); font-size: 11px; margin-top: 2px; font-family: 'Courier New', monospace; }
  </style>
</head>
<body>

  <!-- ── SIDEBAR ── -->
  <aside class="sidebar">
    <a class="sidebar-logo" href="#">
      <div class="logo-icon">
        <svg viewBox="0 0 24 24" fill="none" stroke="white" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
          <polygon points="13,2 4,14 12,14 11,22 20,10 12,10"/>
        </svg>
      </div>
      <span class="logo-text">Razorpay</span>
    </a>

    <div class="sidebar-section">
      <div class="sidebar-section-label">Main</div>

      <a href="#" class="nav-item active" id="navOverview" onclick="showSection('overview'); return false;">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
        Overview
      </a>

      <a href="#" class="nav-item" id="navTransactions" onclick="showSection('transactions'); return false;">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg>
        Transactions
        <span class="nav-badge" id="txnBadge"><%= txnCount %></span>
      </a>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
        Payment Links
        <span class="nav-badge new">New</span>
      </a>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
        Invoices
      </a>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
        Settlements
      </a>
    </div>

    <div class="sidebar-section">
      <div class="sidebar-section-label">Products</div>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
        Payment Gateway
      </a>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
        Smart Collect
      </a>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
        Subscriptions
      </a>
    </div>

    <div class="sidebar-section">
      <div class="sidebar-section-label">Settings</div>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/></svg>
        API Keys
      </a>

      <a href="#" class="nav-item">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
        Account
      </a>
    </div>

    <div class="sidebar-bottom">
      <div class="user-card">
        <div class="avatar"><%= avatarLetter %></div>
        <div class="user-info">
          <div class="user-name"><%= escFn(loggedInUser) %></div>
          <div class="user-email"><%= escFn(loggedInEmail) %></div>
        </div>
      </div>
    </div>
  </aside>

  <!-- ── PAGE WRAPPER ── -->
  <div class="page-wrap">

    <!-- TOPBAR -->
    <header class="topbar">
      <div class="topbar-title">Dashboard</div>

      <div class="topbar-search">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
        <input type="text" placeholder="Search transactions, orders..."/>
      </div>

      <div class="topbar-actions">
        <div class="icon-btn">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
          <span class="notif-dot"></span>
        </div>
        <div class="icon-btn">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.07 4.93a10 10 0 0 1 0 14.14M4.93 4.93a10 10 0 0 0 0 14.14"/></svg>
        </div>
        <a href="Logout.jsp" class="btn-logout">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
          Logout
        </a>
      </div>
    </header>

    <!-- CONTENT -->
    <main class="content">

      <!-- HERO BANNER -->
      <div class="hero">
        <div class="hero-left">
          <div class="hero-tag">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10"/></svg>
            AI-Powered Payments
          </div>
          <h1>Welcome back,<br/><span><%= escFn(loggedInUser) %>!</span></h1>
          <p>Your payment infrastructure is live. Start collecting payments instantly.</p>
          <div class="hero-btns">
            <a href="#" class="btn-primary">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>
              Create Payment Link
            </a>
            <a href="#" class="btn-secondary">View Docs</a>
          </div>
        </div>

        <div class="hero-right">
          <div class="hero-pill">
            <div class="pill-dot"></div>
            Payment Gateway Active
          </div>
          <div class="hero-pill">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            KYC Verified
          </div>
          <div class="hero-pill">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
            Settlements Enabled
          </div>
        </div>
      </div>

      <!-- KPI CARDS -->
      <div class="kpi-grid">
        <div class="kpi-card">
          <div class="kpi-top">
            <div class="kpi-label">Total Sent</div>
            <div class="kpi-icon kpi-blue">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
            </div>
          </div>
          <div class="kpi-value">&#8377;<%= String.format("%,.0f", totalSent) %></div>
          <div class="kpi-change <%= txnCount > 0 ? "up" : "neutral" %>">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
            <%= txnCount > 0 ? "Across " + txnCount + " transaction" + (txnCount > 1 ? "s" : "") : "No transactions yet" %>
          </div>
        </div>

        <div class="kpi-card">
          <div class="kpi-top">
            <div class="kpi-label">Transactions</div>
            <div class="kpi-icon kpi-green">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
            </div>
          </div>
          <div class="kpi-value"><%= txnCount %></div>
          <div class="kpi-change neutral">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Total transfers made
          </div>
        </div>

        <div class="kpi-card">
          <div class="kpi-top">
            <div class="kpi-label">Settlements</div>
            <div class="kpi-icon kpi-amber">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="7" width="20" height="14" rx="2"/><path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/></svg>
            </div>
          </div>
          <div class="kpi-value">&#8377;0</div>
          <div class="kpi-change neutral">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="5" y1="12" x2="19" y2="12"/></svg>
            Pending: &#8377;0
          </div>
        </div>

        <div class="kpi-card">
          <div class="kpi-top">
            <div class="kpi-label">Refunds</div>
            <div class="kpi-icon kpi-red">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="1 4 1 10 7 10"/><path d="M3.51 15a9 9 0 1 0 .49-3.35"/></svg>
            </div>
          </div>
          <div class="kpi-value">0</div>
          <div class="kpi-change up">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="20 6 9 17 4 12"/></svg>
            All clear
          </div>
        </div>
      </div>

      <!-- TWO-COLUMN: TRANSACTIONS + ACTIVITY -->
      <div class="two-col" id="overviewSection">

        <div class="card">
          <div class="card-header">
            <div>
              <div class="card-title">Recent Transactions</div>
              <div class="card-sub">Your last <%= Math.min(txnCount, 5) %> payment activities</div>
            </div>
            <a href="#" onclick="showSection('transactions'); return false;" class="link-btn">
              View all
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg>
            </a>
          </div>
          <table class="txn-table">
            <thead>
              <tr>
                <th>Transaction ID</th>
                <th>Recipient</th>
                <th>Amount</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody id="overviewTxnBody">
              <% if (txnList.isEmpty()) { %>
              <tr><td colspan="4" style="text-align:center;padding:32px;color:var(--gray-400);font-size:13px;">
                No transactions yet. <a href="#" onclick="showSection('transactions');return false;" style="color:var(--blue-600);font-weight:600;">Send Money</a> to get started.
              </td></tr>
              <% } else {
                int shown = 0;
                for (TxnRow t : txnList) {
                  if (shown >= 5) break;
                  String badgeClass = "Completed".equals(t.status) ? "badge-success" : "Failed".equals(t.status) ? "badge-failed" : "badge-pending";
                  String displayName = (t.recipientName != null && !t.recipientName.isEmpty()) ? t.recipientName : t.recipientRef;
              %>
              <tr>
                <td><span class="txn-id"><%= escFn(t.txnId) %></span></td>
                <td>
                  <div class="txn-desc"><%= escFn(displayName) %></div>
                  <div class="txn-method"><%= escFn(t.payMode) %> &middot; <%= escFn(t.recipientRef) %></div>
                </td>
                <td><span class="txn-amount">&#8377;<%= String.format("%,.2f", t.amount) %></span></td>
                <td><span class="badge <%= badgeClass %>"><%= escFn(t.status) %></span></td>
              </tr>
              <% shown++; } } %>
            </tbody>
          </table>
        </div>

        <div class="card">
          <div class="card-header">
            <div>
              <div class="card-title">Activity</div>
              <div class="card-sub">Latest system events</div>
            </div>
          </div>
          <div class="activity-list">
            <div class="activity-item">
              <div class="activity-dot dot-green"></div>
              <div>
                <div class="activity-text"><strong>Account activated</strong> &mdash; your dashboard is ready to use.</div>
                <div class="activity-time">Just now</div>
              </div>
            </div>
            <div class="activity-item">
              <div class="activity-dot dot-blue"></div>
              <div>
                <div class="activity-text"><strong>Payment Gateway</strong> &mdash; test mode is currently active.</div>
                <div class="activity-time">2 min ago</div>
              </div>
            </div>
            <div class="activity-item">
              <div class="activity-dot dot-amber"></div>
              <div>
                <div class="activity-text"><strong>KYC pending</strong> &mdash; complete KYC to enable live payments.</div>
                <div class="activity-time">5 min ago</div>
              </div>
            </div>
            <div class="activity-item">
              <div class="activity-dot dot-blue"></div>
              <div>
                <div class="activity-text"><strong>API Keys generated</strong> &mdash; test key pair is available under Settings.</div>
                <div class="activity-time">10 min ago</div>
              </div>
            </div>
            <div class="activity-item">
              <div class="activity-dot dot-gray"></div>
              <div>
                <div class="activity-text"><strong>Webhook endpoint</strong> &mdash; configure one to receive payment events.</div>
                <div class="activity-time">Today</div>
              </div>
            </div>
          </div>
        </div>

      </div>

      <!-- PRODUCTS SECTION -->
      <div class="section-head">
        <div class="section-title">Explore <span>Products</span></div>
        <a href="#" class="link-btn">
          See all solutions
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg>
        </a>
      </div>

      <div class="products-grid">
        <a href="#" class="product-card">
          <div class="product-icon-wrap pi-blue">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
          </div>
          <h3>Payment Links</h3>
          <p>Accept payments instantly &mdash; share links via email, WhatsApp, or social media without any code.</p>
          <div class="product-card-footer">
            <span class="product-link">Get started <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></span>
            <span class="product-link-ghost">Know more</span>
          </div>
        </a>

        <a href="#" class="product-card">
          <div class="product-icon-wrap pi-green">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/></svg>
          </div>
          <h3>Payment Pages</h3>
          <p>Build a fully branded, custom payment page without writing a single line of code.</p>
          <div class="product-card-footer">
            <span class="product-link">Create page <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></span>
            <span class="product-link-ghost">Know more</span>
          </div>
        </a>

        <a href="#" class="product-card">
          <div class="product-icon-wrap pi-teal">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="1" y="4" width="22" height="16" rx="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
          </div>
          <h3>Payment Gateway</h3>
          <p>Integrate our powerful checkout SDK into your website or mobile app to accept 100+ payment methods.</p>
          <div class="product-card-footer">
            <span class="product-link">Integrate now <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></span>
            <span class="product-link-ghost">API Docs</span>
          </div>
        </a>

        <a href="#" class="product-card">
          <div class="product-icon-wrap pi-rose">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
          </div>
          <h3>Subscriptions</h3>
          <p>Automate recurring billing and manage subscription plans for your SaaS or membership business.</p>
          <div class="product-card-footer">
            <span class="product-link">Setup plan <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></span>
            <span class="product-link-ghost">Know more</span>
          </div>
        </a>

        <a href="#" class="product-card">
          <div class="product-icon-wrap pi-amber">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
          </div>
          <h3>Smart Collect</h3>
          <p>Automate payment collections via Virtual Accounts, QR codes, and UPI payment addresses.</p>
          <div class="product-card-footer">
            <span class="product-link">Explore <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></span>
            <span class="product-link-ghost">Know more</span>
          </div>
        </a>

        <a href="#" class="product-card">
          <div class="product-icon-wrap pi-slate">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 3 21 3 21 8"/><line x1="4" y1="20" x2="21" y2="3"/><polyline points="21 16 21 21 16 21"/><line x1="15" y1="15" x2="21" y2="21"/></svg>
          </div>
          <h3>Instant Settlements</h3>
          <p>Get settled in minutes, not days. Access your funds immediately after a successful payment.</p>
          <div class="product-card-footer">
            <span class="product-link">Enable <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></span>
            <span class="product-link-ghost">Know more</span>
          </div>
        </a>
      </div>

      <!-- BOTTOM: ACCOUNT INFO + SUPPORT -->
      <div class="bottom-grid">

        <div class="card">
          <div class="card-header">
            <div>
              <div class="card-title">Account Information</div>
              <div class="card-sub">Your profile and plan details</div>
            </div>
            <a href="#" class="link-btn">Edit <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="9 18 15 12 9 6"/></svg></a>
          </div>
          <div class="info-list">
            <div class="info-row">
              <span class="info-key">Full Name</span>
              <span class="info-val"><%= escFn(loggedInUser) %></span>
            </div>
            <div class="info-row">
              <span class="info-key">Email / Mobile</span>
              <span class="info-val"><%= escFn(loggedInEmail) %></span>
            </div>
            <div class="info-row">
              <span class="info-key">Account Status</span>
              <span class="status-badge"><span class="status-dot"></span>Active</span>
            </div>
            <div class="info-row">
              <span class="info-key">Current Plan</span>
              <span class="plan-chip">Free</span>
            </div>
            <div class="info-row">
              <span class="info-key">Payment Mode</span>
              <span class="info-val">Test Mode</span>
            </div>
            <div class="info-row">
              <span class="info-key">Member Since</span>
              <span class="info-val">April 2026</span>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-header">
            <div>
              <div class="card-title">Help &amp; Resources</div>
              <div class="card-sub">Everything to get you started</div>
            </div>
          </div>
          <div class="support-body">
            <a href="#" class="support-item">
              <div class="support-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"/><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"/></svg>
              </div>
              <div>
                <div class="support-label">Documentation</div>
                <div class="support-sub">API reference and guides</div>
              </div>
              <span class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"/></svg></span>
            </a>
            <a href="#" class="support-item">
              <div class="support-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
              </div>
              <div>
                <div class="support-label">Support Chat</div>
                <div class="support-sub">Talk to our team 24/7</div>
              </div>
              <span class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"/></svg></span>
            </a>
            <a href="#" class="support-item">
              <div class="support-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="23 7 16 12 23 17 23 7"/><rect x="1" y="5" width="15" height="14" rx="2" ry="2"/></svg>
              </div>
              <div>
                <div class="support-label">Video Tutorials</div>
                <div class="support-sub">Step-by-step walkthroughs</div>
              </div>
              <span class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"/></svg></span>
            </a>
            <a href="#" class="support-item">
              <div class="support-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
              </div>
              <div>
                <div class="support-label">Knowledge Base</div>
                <div class="support-sub">FAQs and troubleshooting</div>
              </div>
              <span class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="9 18 15 12 9 6"/></svg></span>
            </a>
          </div>
        </div>

      </div>

    </main>

  <!-- ═══════════════════════════════════════════════════════
       TRANSACTIONS FULL SECTION (hidden by default)
       ═══════════════════════════════════════════════════════ -->
  <div id="transactionsSection" style="display:none;" class="content">

    <div class="txn-page-header">
      <div>
        <div class="txn-page-title">Transactions</div>
        <div class="txn-page-sub">All your payment transfers &mdash; <%= txnCount %> total &middot; &#8377;<%= String.format("%,.2f", totalSent) %> sent</div>
      </div>
      <button class="btn-send-money" onclick="openSendModal()">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg>
        Send Money
      </button>
    </div>

    <!-- Stats strip -->
    <div class="txn-stats-strip">
      <div class="txn-stat-card stat-blue">
        <div class="stat-label">Total Sent</div>
        <div class="stat-value">&#8377;<%= String.format("%,.0f", totalSent) %></div>
      </div>
      <div class="txn-stat-card stat-green">
        <div class="stat-label">Completed</div>
        <div class="stat-value"><%= completedCount %></div>
      </div>
      <div class="txn-stat-card stat-amber">
        <div class="stat-label">Pending</div>
        <div class="stat-value"><%= pendingCount %></div>
      </div>
      <div class="txn-stat-card stat-red">
        <div class="stat-label">Failed</div>
        <div class="stat-value"><%= failedCount %></div>
      </div>
    </div>

    <!-- Filter bar + table -->
    <div class="txn-full-table-wrap">
      <div class="txn-filter-bar">
        <div class="txn-filter-search">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
          <input type="text" placeholder="Search by ID, recipient, UPI ID..." id="txnSearchInput" oninput="filterTxns()"/>
        </div>
        <select class="txn-filter-select" id="txnStatusFilter" onchange="filterTxns()">
          <option value="">All Statuses</option>
          <option value="Completed">Completed</option>
          <option value="Pending">Pending</option>
          <option value="Failed">Failed</option>
        </select>
        <select class="txn-filter-select" id="txnModeFilter" onchange="filterTxns()">
          <option value="">All Methods</option>
          <option value="UPI">UPI</option>
          <option value="NEFT/IMPS">Bank Transfer</option>
        </select>
      </div>

      <table class="txn-table txn-table-full" id="fullTxnTable">
        <thead>
          <tr>
            <th>Transaction ID</th>
            <th>Recipient</th>
            <th>Method</th>
            <th>Note</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Date &amp; Time</th>
          </tr>
        </thead>
        <tbody id="fullTxnBody">
          <% if (txnList.isEmpty()) { %>
          <tr>
            <td colspan="7">
              <div class="txn-empty-state">
                <div class="txn-empty-icon">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                </div>
                <div class="txn-empty-title">No transactions yet</div>
                <div class="txn-empty-sub">Click <strong>Send Money</strong> to make your first transfer.</div>
              </div>
            </td>
          </tr>
          <% } else {
              for (TxnRow t : txnList) {
                String badgeClass = "Completed".equals(t.status) ? "badge-success" : "Failed".equals(t.status) ? "badge-failed" : "badge-pending";
                String displayName = (t.recipientName != null && !t.recipientName.isEmpty()) ? t.recipientName : t.recipientRef;
                String noteDisplay = (t.note != null && !t.note.isEmpty()) ? t.note : "\u2014";
          %>
          <tr>
            <td><span class="txn-id"><%= escFn(t.txnId) %></span></td>
            <td>
              <div class="txn-desc"><%= escFn(displayName) %></div>
              <div class="txn-recip"><%= escFn(t.recipientRef) %></div>
            </td>
            <td>
              <span class="txn-mode-chip mode-<%= "UPI".equals(t.payMode) ? "upi" : "bank" %>">
                <%= "UPI".equals(t.payMode) ? "UPI" : "NEFT/IMPS" %>
              </span>
              <% if (t.ifscCode != null && !t.ifscCode.isEmpty()) { %>
              <div class="txn-recip"><%= escFn(t.ifscCode) %></div>
              <% } %>
            </td>
            <td><span class="txn-note-text"><%= escFn(noteDisplay) %></span></td>
            <td><span class="txn-amount">&#8377;<%= String.format("%,.2f", t.amount) %></span></td>
            <td><span class="badge <%= badgeClass %>"><%= escFn(t.status) %></span></td>
            <td><span class="txn-date"><%= escFn(t.createdAt) %></span></td>
          </tr>
          <% } } %>
        </tbody>
      </table>

      <% if (!txnList.isEmpty()) { %>
      <div class="txn-table-footer">
        Showing <strong><%= txnCount %></strong> transaction<%= txnCount != 1 ? "s" : "" %>
      </div>
      <% } %>
    </div>
  </div>

  </div><!-- end .page-wrap -->

  <!-- ═══════════════════════════════════════════════════════
       SEND MONEY MODAL
       ═══════════════════════════════════════════════════════ -->
  <div class="modal-overlay" id="sendMoneyModal" onclick="handleOverlayClick(event)">
    <div class="modal" id="sendMoneyModalBox">

      <div class="modal-header">
        <div class="modal-header-left">
          <div class="modal-title">Send Money</div>
          <div class="modal-sub">Transfer funds to any bank account, UPI, or phone</div>
        </div>
        <button class="modal-close" onclick="closeSendModal()">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
        </button>
      </div>

      <div class="modal-body">

        <div class="pay-tabs">
          <button class="pay-tab active" onclick="switchTab('upi', this)">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5M2 12l10 5 10-5"/></svg>
            UPI / Phone
          </button>
          <button class="pay-tab" onclick="switchTab('bank', this)">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="1" y="4" width="22" height="16" rx="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
            Bank Account
          </button>
        </div>

        <div class="m-error" id="sendError">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="12" y1="8" x2="12" y2="12"/><line x1="12" y1="16" x2="12.01" y2="16"/></svg>
          <span id="sendErrorMsg">Something went wrong.</span>
        </div>

        <!-- ── UPI / PHONE TAB ── -->
        <div class="tab-panel active" id="tabUpi">
          <div class="m-form-group">
            <label class="m-label">UPI ID or Phone Number</label>
            <input type="text" class="m-input" id="upiId" placeholder="e.g. name@upi or 9876543210" oninput="clearError()"/>
          </div>
          <div class="m-form-group">
            <label class="m-label">Recipient Name (optional)</label>
            <input type="text" class="m-input" id="upiName" placeholder="e.g. Ravi Kumar" oninput="clearError()"/>
          </div>
          <div class="m-form-group">
            <label class="m-label">Amount (&#8377;)</label>
            <div class="m-input-wrap">
              <span class="m-prefix">&#8377;</span>
              <input type="number" class="m-input has-prefix" id="upiAmount" placeholder="0" min="1" max="500000" oninput="clearError()"/>
            </div>
            <div class="amount-limit">Maximum: &#8377;5,00,000 per transaction</div>
          </div>
          <div class="m-form-group">
            <label class="m-label">Note / Purpose (optional)</label>
            <textarea class="m-textarea" id="upiNote" placeholder="e.g. Rent, Invoice #123..."></textarea>
          </div>
        </div>

        <!-- ── BANK ACCOUNT TAB ── -->
        <div class="tab-panel" id="tabBank">
          <div class="m-form-group">
            <label class="m-label">Account Holder Name</label>
            <input type="text" class="m-input" id="bankName" placeholder="e.g. Priya Sharma" oninput="clearError()"/>
          </div>
          <div class="m-row">
            <div class="m-form-group">
              <label class="m-label">Account Number</label>
              <input type="text" class="m-input" id="bankAcc" placeholder="e.g. 012345678901" maxlength="20" oninput="clearError()"/>
            </div>
            <div class="m-form-group">
              <label class="m-label">IFSC Code</label>
              <input type="text" class="m-input" id="bankIfsc" placeholder="e.g. HDFC0001234" maxlength="11"
                style="text-transform:uppercase" oninput="this.value=this.value.toUpperCase(); clearError()"/>
            </div>
          </div>
          <div class="m-form-group">
            <label class="m-label">Amount (&#8377;)</label>
            <div class="m-input-wrap">
              <span class="m-prefix">&#8377;</span>
              <input type="number" class="m-input has-prefix" id="bankAmount" placeholder="0" min="1" max="500000" oninput="clearError()"/>
            </div>
            <div class="amount-limit">Maximum: &#8377;5,00,000 per transaction</div>
          </div>
          <div class="m-form-group">
            <label class="m-label">Note / Purpose (optional)</label>
            <textarea class="m-textarea" id="bankNote" placeholder="e.g. Rent, Invoice #123..."></textarea>
          </div>
        </div>

        <!-- Confirm summary -->
        <div class="pay-summary" id="paySummary">
          <div class="pay-summary-amt" id="summaryAmt">&#8377;0</div>
          <div class="pay-summary-row"><span class="pay-summary-key">To</span><span class="pay-summary-val" id="summaryTo">&mdash;</span></div>
          <div class="pay-summary-row"><span class="pay-summary-key">Via</span><span class="pay-summary-val" id="summaryVia">&mdash;</span></div>
          <div class="pay-summary-row"><span class="pay-summary-key">Note</span><span class="pay-summary-val" id="summaryNote">&mdash;</span></div>
          <div class="pay-summary-row" style="margin-top:8px; padding-top:8px; border-top:1px solid #bfdbfe;">
            <span class="pay-summary-key">Status after submit</span>
            <span class="pay-summary-val" style="color:#d97706;">Pending (Test Mode)</span>
          </div>
        </div>

        <!-- Success screen -->
        <div class="pay-success" id="paySuccess">
          <div class="success-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="20 6 9 17 4 12"/>
            </svg>
          </div>
          <div class="success-title">Payment Initiated!</div>
          <div class="success-sub">Your transfer has been recorded successfully.</div>
          <div class="success-txn" id="successTxnId">TXN ID: &mdash;</div>
          <br/>
          <button class="btn-done" onclick="closeSendModal()">Done</button>
        </div>

        <!-- Action button -->
        <button class="btn-pay" id="sendBtn" onclick="handleSend()">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" style="width:16px;height:16px">
            <line x1="22" y1="2" x2="11" y2="13"/>
            <polygon points="22 2 15 22 11 13 2 9 22 2"/>
          </svg>
          Review &amp; Send
        </button>

      </div>
    </div>
  </div>

  <script>
    /* ── Section switching ─────────────────────────────────── */
    function showSection(sec) {
      var mainContent = document.querySelector('main.content');
      var txnSection  = document.getElementById('transactionsSection');
      var navOverview = document.getElementById('navOverview');
      var navTxn      = document.getElementById('navTransactions');

      if (sec === 'transactions') {
        mainContent.style.display = 'none';
        txnSection.style.display = 'block';
        navOverview.classList.remove('active');
        navTxn.classList.add('active');
        document.querySelector('.topbar-title').textContent = 'Transactions';
      } else {
        txnSection.style.display = 'none';
        mainContent.style.removeProperty('display');
        navTxn.classList.remove('active');
        navOverview.classList.add('active');
        document.querySelector('.topbar-title').textContent = 'Dashboard';
      }
    }

    /* ── Modal open/close ──────────────────────────────────── */
    function openSendModal() {
      resetModal();
      document.getElementById('sendMoneyModal').classList.add('open');
      document.body.style.overflow = 'hidden';
    }

    function closeSendModal() {
      document.getElementById('sendMoneyModal').classList.remove('open');
      document.body.style.overflow = '';
      setTimeout(resetModal, 300);
    }

    function handleOverlayClick(e) {
      if (e.target === document.getElementById('sendMoneyModal')) closeSendModal();
    }

    function resetModal() {
      var firstTab = document.querySelector('.pay-tab');
      switchTab('upi', firstTab);
      ['upiId','upiName','upiAmount','upiNote','bankName','bankAcc','bankIfsc','bankAmount','bankNote'].forEach(function(id) {
        var el = document.getElementById(id);
        if (el) el.value = '';
      });
      document.getElementById('paySuccess').classList.remove('visible');
      document.getElementById('paySummary').classList.remove('visible');
      document.getElementById('sendError').classList.remove('visible');
      var btn = document.getElementById('sendBtn');
      btn.style.display = 'flex';
      btn.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" style="width:16px;height:16px"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg> Review &amp; Send';
      btn.disabled = false;
      sendStep = 'review';
    }

    /* ── Tab switching ─────────────────────────────────────── */
    var activeTab = 'upi';

    function switchTab(tab, btn) {
      activeTab = tab;
      document.querySelectorAll('.pay-tab').forEach(function(b) { b.classList.remove('active'); });
      if (btn) btn.classList.add('active');
      document.querySelectorAll('.tab-panel').forEach(function(p) { p.classList.remove('active'); });
      document.getElementById(tab === 'upi' ? 'tabUpi' : 'tabBank').classList.add('active');
      document.getElementById('paySummary').classList.remove('visible');
      var sbtn = document.getElementById('sendBtn');
      sbtn.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" style="width:16px;height:16px"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg> Review &amp; Send';
      sendStep = 'review';
      clearError();
    }

    /* ── Validation ────────────────────────────────────────── */
    function showError(msg) {
      document.getElementById('sendErrorMsg').textContent = msg;
      document.getElementById('sendError').classList.add('visible');
    }

    function clearError() {
      document.getElementById('sendError').classList.remove('visible');
    }

    function isValidUpi(v) {
      return /^[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}$/.test(v) || /^[6-9]\d{9}$/.test(v);
    }
    function isValidIfsc(v) {
      return /^[A-Z]{4}0[A-Z0-9]{6}$/.test(v);
    }

    /* ── Two-step send flow ────────────────────────────────── */
    var sendStep = 'review';

    function handleSend() {
      clearError();
      if (sendStep === 'review') {
        if (!validateForm()) return;
        showSummary();
        sendStep = 'confirm';
        document.getElementById('sendBtn').innerHTML =
          '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" style="width:16px;height:16px"><line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/></svg> Confirm &amp; Send';
      } else {
        submitPayment();
      }
    }

    function validateForm() {
      if (activeTab === 'upi') {
        var upiVal = document.getElementById('upiId').value.trim();
        var amt    = parseFloat(document.getElementById('upiAmount').value);
        if (!upiVal)             { showError('Please enter a UPI ID or phone number.'); return false; }
        if (!isValidUpi(upiVal)) { showError('Invalid UPI ID or phone number. Use name@upi or 10-digit mobile.'); return false; }
        if (!amt || amt <= 0)    { showError('Please enter an amount greater than \u20b90.'); return false; }
        if (amt > 500000)        { showError('Amount cannot exceed \u20b95,00,000 per transaction.'); return false; }
      } else {
        var name = document.getElementById('bankName').value.trim();
        var acc  = document.getElementById('bankAcc').value.trim();
        var ifsc = document.getElementById('bankIfsc').value.trim();
        var amt  = parseFloat(document.getElementById('bankAmount').value);
        if (!name)                  { showError('Please enter the account holder name.'); return false; }
        if (!acc || acc.length < 9) { showError('Please enter a valid account number (min 9 digits).'); return false; }
        if (!isValidIfsc(ifsc))     { showError('Invalid IFSC code. Format: XXXX0YYYYYY (e.g. HDFC0001234)'); return false; }
        if (!amt || amt <= 0)       { showError('Please enter an amount greater than \u20b90.'); return false; }
        if (amt > 500000)           { showError('Amount cannot exceed \u20b95,00,000 per transaction.'); return false; }
      }
      return true;
    }

    function showSummary() {
      var amt, to, via, note;
      if (activeTab === 'upi') {
        amt  = parseFloat(document.getElementById('upiAmount').value);
        var upiRecip = document.getElementById('upiName').value.trim();
        var upiId    = document.getElementById('upiId').value.trim();
        to   = upiRecip ? upiRecip + ' (' + upiId + ')' : upiId;
        via  = 'UPI / Phone';
        note = document.getElementById('upiNote').value.trim() || '\u2014';
      } else {
        amt  = parseFloat(document.getElementById('bankAmount').value);
        to   = document.getElementById('bankName').value.trim() + ' \u00b7 Acc ending ' + document.getElementById('bankAcc').value.trim().slice(-4);
        via  = 'Bank Transfer (NEFT/IMPS) \u00b7 IFSC: ' + document.getElementById('bankIfsc').value.trim();
        note = document.getElementById('bankNote').value.trim() || '\u2014';
      }
      document.getElementById('summaryAmt').textContent  = '\u20b9' + amt.toLocaleString('en-IN');
      document.getElementById('summaryTo').textContent   = to;
      document.getElementById('summaryVia').textContent  = via;
      document.getElementById('summaryNote').textContent = note;
      document.getElementById('paySummary').classList.add('visible');
    }

    /* ── Submit to ProcessPayment.jsp ──────────────────────── */
    function submitPayment() {
      var btn = document.getElementById('sendBtn');
      btn.disabled = true;
      btn.innerHTML = '<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:16px;height:16px;animation:spin 1s linear infinite"><path d="M12 2v4M12 18v4M4.93 4.93l2.83 2.83M16.24 16.24l2.83 2.83M2 12h4M18 12h4M4.93 19.07l2.83-2.83M16.24 7.76l2.83-2.83"/></svg> Processing...';

      var fd = new FormData();
      fd.append('payMode', activeTab);
      if (activeTab === 'upi') {
        fd.append('upiId',   document.getElementById('upiId').value.trim());
        fd.append('upiName', document.getElementById('upiName').value.trim());
        fd.append('amount',  document.getElementById('upiAmount').value);
        fd.append('note',    document.getElementById('upiNote').value.trim());
      } else {
        fd.append('bankName', document.getElementById('bankName').value.trim());
        fd.append('bankAcc',  document.getElementById('bankAcc').value.trim());
        fd.append('bankIfsc', document.getElementById('bankIfsc').value.trim());
        fd.append('amount',   document.getElementById('bankAmount').value);
        fd.append('note',     document.getElementById('bankNote').value.trim());
      }

      fetch('ProcessPayment.jsp', { method: 'POST', body: fd })
        .then(function(r) { return r.text(); })
        .then(function(resp) {
          showPaySuccess(resp);
        })
        .catch(function() {
          showPaySuccess('');
        });
    }

    function showPaySuccess(resp) {
      document.getElementById('paySummary').classList.remove('visible');
      document.getElementById('sendBtn').style.display = 'none';

      var txnMatch = resp.match(/TXN_ID:([A-Za-z0-9_]+)/);
      var txnId    = txnMatch ? txnMatch[1] : ('pay_' + Date.now().toString().slice(-6));

      document.getElementById('successTxnId').textContent = 'Transaction ID: ' + txnId;
      document.getElementById('paySuccess').classList.add('visible');

      addTransactionRow(txnId);

      var badge = document.getElementById('txnBadge');
      badge.textContent = parseInt(badge.textContent || '0') + 1;
    }

    function addTransactionRow(txnId) {
      var amt, to, recipRef, via, modeKey, note, ifsc;
      if (activeTab === 'upi') {
        amt      = parseFloat(document.getElementById('upiAmount').value);
        var upiName = document.getElementById('upiName').value.trim();
        recipRef = document.getElementById('upiId').value.trim();
        to       = upiName || recipRef;
        via      = 'UPI';
        modeKey  = 'upi';
        note     = document.getElementById('upiNote').value.trim() || '\u2014';
        ifsc     = '';
      } else {
        amt      = parseFloat(document.getElementById('bankAmount').value);
        to       = document.getElementById('bankName').value.trim();
        recipRef = document.getElementById('bankAcc').value.trim();
        via      = 'NEFT/IMPS';
        modeKey  = 'bank';
        note     = document.getElementById('bankNote').value.trim() || '\u2014';
        ifsc     = document.getElementById('bankIfsc').value.trim();
      }

      var now     = new Date();
      var months  = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
      var dd      = (now.getDate() < 10 ? '0' : '') + now.getDate();
      var dateStr = dd + ' ' + months[now.getMonth()] + ' ' + now.getFullYear();
      var hrs     = now.getHours(); var ampm = hrs >= 12 ? 'PM' : 'AM'; hrs = hrs % 12 || 12;
      var mins    = (now.getMinutes() < 10 ? '0' : '') + now.getMinutes();
      var dateTime = dateStr + ', ' + hrs + ':' + mins + ' ' + ampm;

      var fmtAmt = '\u20b9' + amt.toLocaleString('en-IN', {minimumFractionDigits:2, maximumFractionDigits:2});

      /* Full transactions table */
      var row = '<tr>' +
        '<td><span class="txn-id">' + txnId + '</span></td>' +
        '<td><div class="txn-desc">' + to + '</div><div class="txn-recip">' + recipRef + '</div></td>' +
        '<td><span class="txn-mode-chip mode-' + modeKey + '">' + via + '</span>' + (ifsc ? '<div class="txn-recip">' + ifsc + '</div>' : '') + '</td>' +
        '<td><span class="txn-note-text">' + note + '</span></td>' +
        '<td><span class="txn-amount">' + fmtAmt + '</span></td>' +
        '<td><span class="badge badge-success">Completed</span></td>' +
        '<td><span class="txn-date">' + dateTime + '</span></td>' +
        '</tr>';

      var tbody = document.getElementById('fullTxnBody');
      /* Remove empty-state row if present */
      var emptyRow = tbody.querySelector('.txn-empty-state');
      if (emptyRow) emptyRow.closest('tr').remove();
      tbody.insertAdjacentHTML('afterbegin', row);

      /* Update footer */
      var footer = document.querySelector('.txn-table-footer');
      if (footer) {
        var currentCount = tbody.querySelectorAll('tr').length;
        footer.innerHTML = 'Showing <strong>' + currentCount + '</strong> transaction' + (currentCount !== 1 ? 's' : '');
        footer.style.display = '';
      }

      /* Overview table */
      var row2 = '<tr>' +
        '<td><span class="txn-id">' + txnId + '</span></td>' +
        '<td><div class="txn-desc">' + to + '</div><div class="txn-method">' + via + ' \u00b7 ' + recipRef + '</div></td>' +
        '<td><span class="txn-amount">' + fmtAmt + '</span></td>' +
        '<td><span class="badge badge-success">Completed</span></td>' +
        '</tr>';
      var overviewTbody = document.getElementById('overviewTxnBody');
      if (overviewTbody) {
        var emptyOverview = overviewTbody.querySelector('td[colspan]');
        if (emptyOverview) emptyOverview.closest('tr').remove();
        overviewTbody.insertAdjacentHTML('afterbegin', row2);
      }

      /* Update stat cards */
      var completedVal = document.querySelector('.stat-green .stat-value');
      if (completedVal) completedVal.textContent = (parseInt(completedVal.textContent) || 0) + 1;
      var totalVal = document.querySelector('.stat-blue .stat-value');
      if (totalVal) {
        var cur = parseFloat(totalVal.textContent.replace(/[^\d.]/g, '')) || 0;
        totalVal.textContent = '\u20b9' + (cur + amt).toLocaleString('en-IN', {maximumFractionDigits:0});
      }
    }

    /* ── Filter/search transactions ────────────────────────── */
    function filterTxns() {
      var search = document.getElementById('txnSearchInput').value.toLowerCase();
      var status = document.getElementById('txnStatusFilter').value;
      var mode   = document.getElementById('txnModeFilter').value;
      var rows   = document.getElementById('fullTxnBody').querySelectorAll('tr');
      rows.forEach(function(row) {
        if (row.querySelector('.txn-empty-state')) return;
        var text  = row.textContent.toLowerCase();
        var badge = row.querySelector('.badge');
        var chip  = row.querySelector('.txn-mode-chip');
        var bText = badge ? badge.textContent.trim() : '';
        var mText = chip  ? chip.textContent.trim()  : '';
        var matchS = !search || text.includes(search);
        var matchF = !status || bText === status;
        var matchM = !mode   || mText === mode;
        row.style.display = (matchS && matchF && matchM) ? '' : 'none';
      });
    }

    /* spin animation for loader */
    var st = document.createElement('style');
    st.textContent = '@keyframes spin { to { transform: rotate(360deg); } }';
    document.head.appendChild(st);
  </script>

</body>
</html>
