<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
/* ============================================================
   BACKEND AUTHENTICATION
   Handles BOTH plain-text AND BCrypt hashed passwords.
   ============================================================ */

String loginError = null;

String emailPhone = request.getParameter("emailPhone");
String password   = request.getParameter("password");

if (emailPhone != null && password != null
        && !emailPhone.trim().isEmpty() && !password.isEmpty()) {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");

        con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/postgres",
            "postgres",
            "arnab05"
        );

        /* Fetch the stored password for this email OR mobile */
        String query =
            "SELECT first_name, password FROM users " +
            "WHERE email = ? OR mobile = ?";

        ps = con.prepareStatement(query);
        ps.setString(1, emailPhone.trim());
        ps.setString(2, emailPhone.trim());

        rs = ps.executeQuery();

        if (rs.next()) {
            String firstName   = rs.getString("first_name");
            String storedPw    = rs.getString("password");

            boolean matched = false;

            /* ── Try BCrypt first (hashes start with $2a$ or $2b$) ── */
            if (storedPw != null && storedPw.startsWith("$2")) {
                try {
                    Class<?> bcrypt = Class.forName("org.mindrot.jbcrypt.BCrypt");
                    java.lang.reflect.Method checkPw =
                        bcrypt.getMethod("checkpw", String.class, String.class);
                    matched = (Boolean) checkPw.invoke(null, password, storedPw);
                } catch (ClassNotFoundException cnfe) {
                    /* BCrypt library not present — fall back to plain compare */
                    matched = password.equals(storedPw);
                }
            } else {
                /* Plain-text password stored in DB */
                matched = password.equals(storedPw);
            }

            if (matched) {
                /* ✅ Valid — store in session and redirect */
                session.setAttribute("loggedInUser", firstName);
                session.setAttribute("loggedInEmail", emailPhone.trim());
                response.sendRedirect("dashboard1.jsp");
                return;
            } else {
                loginError = "Incorrect password. Please try again.";
            }
        } else {
            loginError = "No account found with that email or phone number.";
        }

    } catch (Exception e) {
        loginError = "Server error: " + e.getMessage();
    } finally {
        if (rs  != null) try { rs.close();  } catch(Exception ex) {}
        if (ps  != null) try { ps.close();  } catch(Exception ex) {}
        if (con != null) try { con.close(); } catch(Exception ex) {}
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Razorpay - Login</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      height: 100vh;
      display: flex;
      overflow: hidden;
    }

    /* LEFT PANEL */
    .left-panel {
      flex: 1;
      position: relative;
      background: linear-gradient(135deg,
        #e0f7fa 0%, #b2ebf2 15%, #c8f5e6 30%,
        #e0f2f1 45%, #b2dfdb 60%, #e8f5e9 75%,
        #e0f7fa 90%, #f1f8e9 100%);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      padding: 36px 40px;
    }

    .left-panel::before {
      content: '';
      position: absolute;
      top: -20%; left: -10%;
      width: 80%; height: 130%;
      background: linear-gradient(115deg,
        transparent 30%, rgba(255,255,255,0.55) 48%,
        rgba(255,255,255,0.12) 52%, transparent 70%);
      transform: rotate(-10deg);
      pointer-events: none;
    }

    .left-panel::after {
      content: '';
      position: absolute;
      top: 10%; left: 30%;
      width: 60%; height: 100%;
      background: linear-gradient(120deg,
        transparent 30%, rgba(255,255,255,0.3) 47%,
        rgba(255,255,255,0.08) 52%, transparent 68%);
      transform: rotate(-8deg);
      pointer-events: none;
    }

    .left-logo {
      position: relative; z-index: 1;
      display: flex; align-items: center; gap: 8px;
      text-decoration: none;
    }
    .left-logo-text {
      font-size: 22px; font-weight: 700;
      color: #2d5be3; letter-spacing: -0.3px;
    }

    .left-content {
      position: relative; z-index: 1;
      margin-top: auto; padding-bottom: 60px;
    }
    .left-heading {
      font-size: 36px; font-weight: 700;
      color: #1a7a4a; line-height: 1.25;
      max-width: 520px; margin-bottom: 28px;
    }
    .left-features { display: flex; flex-wrap: wrap; gap: 20px 32px; }
    .feature-item {
      display: flex; align-items: center; gap: 8px;
      color: #1a7a4a; font-size: 15px; font-weight: 500;
    }
    .feature-plus { font-size: 18px; font-weight: 700; line-height: 1; }

    /* RIGHT PANEL */
    .right-panel {
      width: 460px; min-width: 420px;
      background: #fff;
      display: flex; flex-direction: column;
      padding: 48px 44px 40px;
      overflow-y: auto;
      border-left: 1px solid #f0f0f0;
    }

    .rp-icon {
      width: 56px; height: 56px;
      background: #3b82f6; border-radius: 12px;
      display: flex; align-items: center; justify-content: center;
      margin-bottom: 20px;
    }
    .rp-icon svg { width: 30px; height: 30px; fill: #fff; }

    .welcome-text { font-size: 14px; color: #6b7280; margin-bottom: 8px; }
    .welcome-text strong { color: #111827; font-weight: 600; }

    .main-heading {
      font-size: 28px; font-weight: 700;
      color: #111827; line-height: 1.25;
      margin-bottom: 28px;
    }

    /* ERROR BANNER */
    .alert-error {
      padding: 12px 16px;
      border-radius: 6px;
      font-size: 13.5px;
      font-weight: 500;
      margin-bottom: 18px;
      display: flex;
      align-items: flex-start;
      gap: 10px;
      line-height: 1.5;
      background: #fef2f2;
      border: 1.5px solid #fecaca;
      color: #b91c1c;
    }
    .alert-error svg { flex-shrink: 0; margin-top: 1px; }

    /* FORM */
    .form-group { margin-bottom: 16px; position: relative; }

    .form-label {
      display: block; font-size: 13px;
      font-weight: 500; color: #374151; margin-bottom: 6px;
    }

    .form-input {
      width: 100%;
      padding: 12px 14px;
      border: 1.5px solid #d1d5db;
      border-radius: 6px;
      font-size: 15px; color: #111827;
      outline: none;
      transition: border-color 0.15s, box-shadow 0.15s;
      background: #fff;
    }
    .form-input::placeholder { color: #9ca3af; font-size: 14px; }
    .form-input:focus {
      border-color: #3b82f6;
      box-shadow: 0 0 0 3px rgba(59,130,246,0.12);
    }
    .form-input.error {
      border-color: #ef4444;
      box-shadow: 0 0 0 3px rgba(239,68,68,0.1);
    }

    .password-wrapper { position: relative; }
    .password-toggle {
      position: absolute; right: 12px; top: 50%;
      transform: translateY(-50%);
      background: none; border: none; cursor: pointer;
      color: #6b7280; padding: 4px;
      display: flex; align-items: center; justify-content: center;
      transition: color 0.15s;
    }
    .password-toggle:hover { color: #374151; }
    .password-toggle svg { width: 18px; height: 18px; }
    .form-input.has-toggle { padding-right: 44px; }

    .forgot-link {
      display: block; text-align: right;
      font-size: 13px; color: #3b82f6;
      text-decoration: none; margin-top: 6px; font-weight: 500;
    }
    .forgot-link:hover { text-decoration: underline; }

    .field-error-msg {
      font-size: 12px; color: #ef4444;
      margin-top: 5px; display: none;
    }
    .field-error-msg.visible { display: block; }

    /* BUTTONS */
    .btn-continue {
      width: 100%; padding: 13px;
      background: #3b82f6; color: #fff;
      border: none; border-radius: 6px;
      font-size: 15px; font-weight: 600;
      cursor: pointer; margin-top: 8px;
      transition: background 0.15s, transform 0.1s;
      letter-spacing: 0.2px;
    }
    .btn-continue:hover  { background: #2563eb; }
    .btn-continue:active { transform: scale(0.99); }
    .btn-continue:disabled { background: #93c5fd; cursor: not-allowed; }

    /* DIVIDER */
    .divider { display: flex; align-items: center; gap: 12px; margin: 20px 0; }
    .divider-line { flex: 1; height: 1px; background: #e5e7eb; }
    .divider-text { font-size: 13px; color: #9ca3af; }

    /* GOOGLE BUTTON */
    .btn-google {
      width: 100%; padding: 12px;
      background: #fff; color: #374151;
      border: 1.5px solid #e5e7eb; border-radius: 6px;
      font-size: 14px; font-weight: 500; cursor: pointer;
      display: flex; align-items: center; justify-content: center; gap: 10px;
      transition: background 0.15s, border-color 0.15s;
    }
    .btn-google:hover { background: #f9fafb; border-color: #d1d5db; }
    .google-icon { width: 18px; height: 18px; }

    /* POLICY */
    .policy-text {
      margin-top: 20px; font-size: 12.5px;
      color: #9ca3af; text-align: center; line-height: 1.6;
    }
    .policy-text a { color: #3b82f6; text-decoration: none; }
    .policy-text a:hover { text-decoration: underline; }

    /* SIGNUP LINK */
    .signup-link-row {
      margin-top: 16px; text-align: center;
      font-size: 13px; color: #6b7280;
    }
    .signup-link-row a {
      color: #3b82f6; font-weight: 600; text-decoration: none;
    }
    .signup-link-row a:hover { text-decoration: underline; }

    /* PARTNER CARD */
    .partner-card {
      margin-top: 24px; padding: 16px 18px;
      border: 1.5px solid #e5e7eb; border-radius: 8px;
      background: #f9fafb;
    }
    .partner-card-title {
      font-size: 13.5px; color: #374151;
      font-weight: 500; margin-bottom: 4px;
    }
    .partner-card-link {
      font-size: 13.5px; color: #3b82f6;
      text-decoration: none; font-weight: 500;
    }
    .partner-card-link:hover { text-decoration: underline; }

    @keyframes fadeSlideIn {
      from { opacity: 0; transform: translateY(8px); }
      to   { opacity: 1; transform: translateY(0); }
    }
    .right-panel > * { animation: fadeSlideIn 0.25s ease forwards; }

    @media (max-width: 768px) {
      .left-panel  { display: none; }
      .right-panel { width: 100%; min-width: unset; padding: 40px 28px; }
    }
  </style>
</head>
<body>

  <!-- Left Panel -->
  <div class="left-panel">
    <a href="HomePage.jsp" class="left-logo">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
        <polygon points="14,2 6,14 11,14 10,22 18,10 13,10" fill="#2d5be3"/>
      </svg>
      <span class="left-logo-text">Razorpay</span>
    </a>
    <div class="left-content">
      <h1 class="left-heading">Join 8 Million Businesses that Trust Razorpay to Supercharge their Business</h1>
      <div class="left-features">
        <div class="feature-item"><span class="feature-plus">+</span><span>100+ Payment Methods</span></div>
        <div class="feature-item"><span class="feature-plus">+</span><span>Easy Integration</span></div>
        <div class="feature-item"><span class="feature-plus">+</span><span>Powerful Dashboard</span></div>
      </div>
    </div>
  </div>

  <!-- Right Panel -->
  <div class="right-panel">

    <div class="rp-icon">
      <svg viewBox="0 0 24 24">
        <polygon points="14,2 6,14 11,14 10,22 18,10 13,10"/>
      </svg>
    </div>

    <p class="welcome-text">Welcome to <strong>Razorpay</strong></p>
    <h2 class="main-heading">Sign In to your<br>Razorpay Account</h2>

    <%-- Server-side error banner --%>
    <% if (loginError != null) { %>
    <div class="alert-error">
      <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
           stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <circle cx="12" cy="12" r="10"/>
        <line x1="12" y1="8"  x2="12"    y2="12"/>
        <line x1="12" y1="16" x2="12.01" y2="16"/>
      </svg>
      <%= loginError %>
    </div>
    <% } %>

    <%-- POST form — submits back to Login.jsp (same file name, exact case) --%>
    <form id="loginForm" method="post" action="Login.jsp">

      <div class="form-group">
        <label class="form-label" for="emailPhone">Mobile / E-mail Address</label>
        <input
          type="text"
          id="emailPhone"
          name="emailPhone"
          class="form-input <%= (loginError != null) ? "error" : "" %>"
          placeholder="Enter your email or phone number"
          autocomplete="email"
          value="<%= (emailPhone != null) ? emailPhone.trim() : "" %>"
        />
        <span class="field-error-msg" id="emailPhoneError">
          Please enter a valid email or 10-digit phone number.
        </span>
      </div>

      <div class="form-group">
        <label class="form-label" for="password">Password</label>
        <div class="password-wrapper">
          <input
            type="password"
            id="password"
            name="password"
            class="form-input has-toggle <%= (loginError != null) ? "error" : "" %>"
            placeholder="Enter your password"
            autocomplete="current-password"
          />
          <button type="button" class="password-toggle"
                  onclick="togglePassword()" tabindex="-1"
                  aria-label="Toggle password visibility">
            <svg id="eyeIcon" viewBox="0 0 24 24" fill="none"
                 stroke="currentColor" stroke-width="2"
                 stroke-linecap="round" stroke-linejoin="round">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
              <circle cx="12" cy="12" r="3"/>
            </svg>
          </button>
        </div>
        <span class="field-error-msg" id="passwordError">
          Password must be at least 6 characters.
        </span>
        <a href="#" class="forgot-link">Forgot password?</a>
      </div>

      <button type="submit" class="btn-continue" id="loginBtn">Login</button>
    </form>

    <div class="divider">
      <div class="divider-line"></div>
      <span class="divider-text">or</span>
      <div class="divider-line"></div>
    </div>

    <button class="btn-google" type="button"
            onclick="alert('Google sign-in is not available in this demo.')">
      <svg class="google-icon" viewBox="0 0 24 24">
        <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
        <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
        <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l3.66-2.84z" fill="#FBBC05"/>
        <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
      </svg>
      Continue with Google
    </button>

    <p class="policy-text">
      By continuing you agree to our <a href="#">privacy policy</a> and<br>
      <a href="#">terms of use</a>
    </p>

    <p class="signup-link-row">
      Don't have an account? <a href="SignUp.jsp">Sign up for free</a>
    </p>

    <div class="partner-card">
      <p class="partner-card-title">Helping Clients with Razorpay Solutions?</p>
      <a href="#" class="partner-card-link">Become Razorpay Partner &rarr;</a>
    </div>

  </div>

  <script>
    var EYE_OPEN   = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
    var EYE_CLOSED = '<line x1="17.94" y1="17.94" x2="6.06" y2="6.06"/><path d="M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><path d="M1 1l22 22"/><path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94"/>';

    var pwVisible = false;

    function isEmail(v) { return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v); }
    function isPhone(v) { return /^[6-9]\d{9}$/.test(v); }

    function togglePassword() {
      pwVisible = !pwVisible;
      var input = document.getElementById('password');
      var icon  = document.getElementById('eyeIcon');
      input.type     = pwVisible ? 'text' : 'password';
      icon.innerHTML = pwVisible ? EYE_CLOSED : EYE_OPEN;
    }

    /* Client-side validation — only blocks submit if fields are empty/invalid */
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      var emailVal   = document.getElementById('emailPhone').value.trim();
      var pwdVal     = document.getElementById('password').value;
      var emailInput = document.getElementById('emailPhone');
      var pwdInput   = document.getElementById('password');
      var emailErr   = document.getElementById('emailPhoneError');
      var pwdErr     = document.getElementById('passwordError');
      var valid = true;

      if (!emailVal || (!isEmail(emailVal) && !isPhone(emailVal))) {
        emailInput.classList.add('error');
        emailErr.classList.add('visible');
        valid = false;
      } else {
        emailInput.classList.remove('error');
        emailErr.classList.remove('visible');
      }

      if (pwdVal.length < 6) {
        pwdInput.classList.add('error');
        pwdErr.classList.add('visible');
        valid = false;
      } else {
        pwdInput.classList.remove('error');
        pwdErr.classList.remove('visible');
      }

      if (!valid) {
        e.preventDefault();
        return;
      }

      /* Valid → show loading state, let form POST to server */
      var btn = document.getElementById('loginBtn');
      btn.textContent = 'Logging in...';
      btn.disabled = true;
    });

    /* Enter key triggers submit */
    document.getElementById('password').addEventListener('keydown', function(e) {
      if (e.key === 'Enter') {
        document.getElementById('loginForm').dispatchEvent(
          new Event('submit', { cancelable: true, bubbles: true })
        );
      }
    });

    /* Clear error highlight on typing */
    document.getElementById('emailPhone').addEventListener('input', function() {
      this.classList.remove('error');
      document.getElementById('emailPhoneError').classList.remove('visible');
    });
    document.getElementById('password').addEventListener('input', function() {
      this.classList.remove('error');
      document.getElementById('passwordError').classList.remove('visible');
    });
  </script>
</body>
</html>
