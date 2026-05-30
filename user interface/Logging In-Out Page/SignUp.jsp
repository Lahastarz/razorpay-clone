<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String country = request.getParameter("country");
String password = request.getParameter("password");

if(firstName != null && email != null && password != null) {

    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("org.postgresql.Driver");

        con = DriverManager.getConnection(
            "jdbc:postgresql://localhost:5432/postgres",
            "postgres",
            "arnab05"
        );

        String query = "INSERT INTO users(first_name, last_name, email, mobile, country, password) VALUES (?, ?, ?, ?, ?, ?)";

        ps = con.prepareStatement(query);

        ps.setString(1, firstName);
        ps.setString(2, lastName);
        ps.setString(3, email);
        ps.setString(4, mobile);
        ps.setString(5, country);
        ps.setString(6, password);

        int i = ps.executeUpdate();

        if(i > 0){
%>
<script>
    alert("Signup Successful!");
    window.location="login.jsp";
</script>
<%
        } else {
%>
<script>
    alert("Signup Failed!");
</script>
<%
        }

    } catch(Exception e){
        out.println("Error: " + e.getMessage());
    } finally {
        if(ps != null) ps.close();
        if(con != null) con.close();
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Razorpay – Sign Up</title>
  <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700;900&family=Source+Sans+3:wght@400;600;700&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --blue: #2563eb;
      --blue-hover: #1d4ed8;
      --green: #07a67e;
      --dark: #1a1a2e;
      --text: #1a1a2e;
      --muted: #6b7280;
      --border: #d1d5db;
      --input-focus: #2563eb;
      --bg-right: #ffffff;
      --error: #ef4444;
    }

    body {
      font-family: 'Source Sans 3', sans-serif;
      min-height: 100vh;
      display: flex;
      background: #f0f9ff;
    }

    /* LEFT PANEL */
    .left {
      flex: 1;
      position: relative;
      overflow: hidden;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      padding: 40px 48px;
      min-height: 100vh;
    }

    .left-bg {
      position: absolute;
      inset: 0;
      background:
        linear-gradient(135deg,
          #b2f5ea 0%, #81e6d9 10%, #a0e4f1 22%,
          #bee3f8 35%, #c6f6d5 50%, #b2f5ea 65%,
          #90cdf4 80%, #a0e4f1 100%);
      z-index: 0;
    }

    .left-bg::before {
      content: '';
      position: absolute;
      inset: 0;
      background:
        repeating-linear-gradient(120deg, transparent 0px, rgba(255,255,255,0.25) 1px, transparent 2px, transparent 60px),
        repeating-linear-gradient(60deg, transparent 0px, rgba(255,255,255,0.15) 1px, transparent 2px, transparent 80px);
      z-index: 1;
    }

    .left-bg::after {
      content: '';
      position: absolute;
      inset: 0;
      background:
        radial-gradient(ellipse at 30% 40%, rgba(255,255,255,0.45) 0%, transparent 60%),
        radial-gradient(ellipse at 70% 70%, rgba(144,205,244,0.4) 0%, transparent 55%);
      z-index: 2;
    }

    .logo {
      position: absolute;
      top: 32px;
      left: 40px;
      z-index: 10;
      display: flex;
      align-items: center;
      gap: 6px;
      text-decoration: none;
    }

    .logo-text {
      font-family: 'Lato', sans-serif;
      font-size: 22px;
      font-weight: 700;
      color: #1a365d;
      letter-spacing: -0.5px;
    }

    .left-content {
      position: relative;
      z-index: 10;
    }

    .left-headline {
      font-family: 'Lato', sans-serif;
      font-size: 32px;
      font-weight: 900;
      color: #1a5c4a;
      line-height: 1.25;
      margin-bottom: 24px;
      max-width: 520px;
    }

    .left-features {
      display: flex;
      gap: 28px;
      flex-wrap: wrap;
    }

    .feature-item {
      display: flex;
      align-items: center;
      gap: 8px;
      font-size: 15px;
      font-weight: 600;
      color: #234e52;
    }

    .feature-item span.plus {
      font-size: 18px;
      font-weight: 900;
      color: #2c7a7b;
    }

    /* RIGHT PANEL */
    .right {
      width: 440px;
      min-width: 440px;
      background: var(--bg-right);
      display: flex;
      flex-direction: column;
      justify-content: center;
      padding: 40px 44px 32px;
      min-height: 100vh;
      box-shadow: -4px 0 24px rgba(0,0,0,0.06);
      overflow-y: auto;
    }

    .brand-icon {
      width: 52px;
      height: 52px;
      background: var(--blue);
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 20px;
    }

    .brand-icon svg {
      width: 28px;
      height: 28px;
      fill: white;
    }

    .welcome-text {
      font-size: 14px;
      color: var(--muted);
      margin-bottom: 6px;
    }

    .welcome-text strong { color: var(--text); }

    .form-title {
      font-family: 'Lato', sans-serif;
      font-size: 26px;
      font-weight: 900;
      color: var(--text);
      line-height: 1.25;
      margin-bottom: 24px;
    }

    .form-row { display: flex; gap: 12px; }

    .form-group {
      margin-bottom: 14px;
      flex: 1;
    }

    .form-group label {
      display: block;
      font-size: 13px;
      font-weight: 600;
      color: #374151;
      margin-bottom: 5px;
    }

    .form-group label .req {
      color: var(--error);
      margin-left: 2px;
    }

    .input-wrap { position: relative; }

    .input-wrap input,
    .input-wrap select {
      width: 100%;
      padding: 10px 14px;
      border: 1.5px solid var(--border);
      border-radius: 6px;
      font-size: 14px;
      font-family: 'Source Sans 3', sans-serif;
      color: var(--text);
      background: #fff;
      outline: none;
      transition: border-color 0.2s, box-shadow 0.2s;
      appearance: none;
    }

    .input-wrap input:focus,
    .input-wrap select:focus {
      border-color: var(--input-focus);
      box-shadow: 0 0 0 3px rgba(37,99,235,0.12);
    }

    .input-wrap input.error,
    .input-wrap select.error {
      border-color: var(--error);
    }

    .input-wrap .eye-btn {
      position: absolute;
      right: 12px;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      cursor: pointer;
      padding: 0;
      color: var(--muted);
      display: flex;
      align-items: center;
    }

    .input-wrap input[type="password"],
    .input-wrap input[type="text"].pw-field {
      padding-right: 40px;
    }

    .flag-select {
      display: flex;
      align-items: center;
      border: 1.5px solid var(--border);
      border-radius: 6px;
      overflow: hidden;
      transition: border-color 0.2s, box-shadow 0.2s;
    }

    .flag-select:focus-within {
      border-color: var(--input-focus);
      box-shadow: 0 0 0 3px rgba(37,99,235,0.12);
    }

    .flag-label {
      padding: 10px 10px 10px 12px;
      font-size: 14px;
      color: var(--muted);
      border-right: 1.5px solid var(--border);
      background: #f9fafb;
      white-space: nowrap;
      display: flex;
      align-items: center;
      gap: 6px;
      font-weight: 600;
    }

    .flag-select input {
      border: none !important;
      box-shadow: none !important;
      border-radius: 0 !important;
      padding-left: 12px !important;
      flex: 1;
    }

    .flag-select input:focus {
      border: none !important;
      box-shadow: none !important;
    }

    .error-msg {
      font-size: 12px;
      color: var(--error);
      margin-top: 4px;
      display: none;
    }

    .error-msg.visible { display: block; }

    /* Password strength */
    .pw-strength { margin-top: 6px; display: none; }
    .pw-strength.visible { display: block; }

    .pw-bars { display: flex; gap: 4px; margin-bottom: 4px; }

    .pw-bar {
      height: 3px;
      flex: 1;
      border-radius: 2px;
      background: #e5e7eb;
      transition: background 0.3s;
    }

    .pw-bar.weak   { background: #ef4444; }
    .pw-bar.medium { background: #f59e0b; }
    .pw-bar.strong { background: #10b981; }

    .pw-label { font-size: 11px; color: var(--muted); }

    /* Country select */
    .country-select-wrap { position: relative; }
    .country-select-wrap select { padding-left: 40px; }
    .country-flag {
      position: absolute;
      left: 12px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 18px;
      pointer-events: none;
    }
    .country-select-wrap::after {
      content: '';
      position: absolute;
      right: 14px;
      top: 50%;
      transform: translateY(-50%);
      width: 0; height: 0;
      border-left: 5px solid transparent;
      border-right: 5px solid transparent;
      border-top: 5px solid #6b7280;
      pointer-events: none;
    }

    /* Buttons */
    .btn-continue {
      width: 100%;
      padding: 12px;
      background: var(--blue);
      color: white;
      font-size: 15px;
      font-weight: 700;
      font-family: 'Source Sans 3', sans-serif;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      margin-top: 6px;
      transition: background 0.2s, transform 0.1s;
      letter-spacing: 0.2px;
    }

    .btn-continue:hover  { background: var(--blue-hover); }
    .btn-continue:active { transform: scale(0.99); }

    .divider {
      display: flex;
      align-items: center;
      gap: 12px;
      margin: 16px 0;
    }

    .divider::before, .divider::after {
      content: '';
      flex: 1;
      height: 1px;
      background: var(--border);
    }

    .divider span { font-size: 13px; color: var(--muted); }

    .btn-google {
      width: 100%;
      padding: 10px;
      border: 1.5px solid var(--border);
      border-radius: 6px;
      background: white;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      font-size: 14px;
      font-weight: 600;
      font-family: 'Source Sans 3', sans-serif;
      color: var(--text);
      transition: background 0.2s, border-color 0.2s;
    }

    .btn-google:hover {
      background: #f9fafb;
      border-color: #9ca3af;
    }

    .google-icon { width: 18px; height: 18px; }

    .terms {
      font-size: 12px;
      color: var(--muted);
      text-align: center;
      margin-top: 12px;
      line-height: 1.6;
    }

    .terms a { color: var(--blue); text-decoration: none; }
    .terms a:hover { text-decoration: underline; }

    .partner-box {
      margin-top: 20px;
      padding: 14px 16px;
      background: #f9fafb;
      border-radius: 8px;
      border: 1px solid #e5e7eb;
    }

    .partner-box p {
      font-size: 13px;
      color: var(--text);
      font-weight: 600;
      margin-bottom: 4px;
    }

    .partner-box a {
      font-size: 13px;
      color: var(--blue);
      text-decoration: none;
      font-weight: 600;
    }

    .partner-box a:hover { text-decoration: underline; }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(16px); }
      to   { opacity: 1; transform: translateY(0); }
    }

    .right > * { animation: fadeUp 0.4s ease both; }

    @media (max-width: 860px) {
      .left { display: none; }
      .right { width: 100%; min-width: unset; }
    }
  </style>
</head>
<body>

  <!-- LEFT PANEL -->
  <div class="left">
    <div class="left-bg"></div>

    <a class="logo" href="#">
      <svg width="28" height="28" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
        <rect width="40" height="40" rx="8" fill="#2563eb"/>
        <path d="M12 10h10l8 20H20L12 10z" fill="white" opacity="0.9"/>
        <path d="M20 10h8l-4 10-4-10z" fill="white"/>
      </svg>
      <span class="logo-text">Razorpay</span>
    </a>

    <div class="left-content">
      <h1 class="left-headline">Join 8 Million Businesses that Trust<br/>Razorpay to Supercharge their Business</h1>
      <div class="left-features">
        <div class="feature-item"><span class="plus">+</span> 100+ Payment Methods</div>
        <div class="feature-item"><span class="plus">+</span> Easy Integration</div>
        <div class="feature-item"><span class="plus">+</span> Powerful Dashboard</div>
      </div>
    </div>
  </div>

  <!-- RIGHT PANEL -->
  <div class="right">

    <div class="brand-icon">
      <svg viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M6 6h14l14 28H20L6 6z" fill="white" opacity="0.9"/>
        <path d="M20 6h14L27 20 20 6z" fill="white"/>
      </svg>
    </div>

    <p class="welcome-text">Welcome to <strong>Razorpay</strong></p>
    <h2 class="form-title">Create your account</h2>

    <!-- ✅ FIX 1: Single angle brackets on form tag -->
    <form id="signupForm" method="post" action="SignUp.jsp">

      <!-- First & Last Name -->
      <div class="form-row">
        <div class="form-group">
          <label>First Name <span class="req">*</span></label>
          <div class="input-wrap">
            <!-- ✅ FIX 2: Added name="firstName" so JSP can read it -->
            <input type="text" id="firstName" name="firstName" placeholder="John" autocomplete="given-name"/>
          </div>
          <div class="error-msg" id="firstNameErr">Please enter your first name.</div>
        </div>
        <div class="form-group">
          <label>Last Name <span class="req">*</span></label>
          <div class="input-wrap">
            <!-- ✅ FIX 2: Added name="lastName" -->
            <input type="text" id="lastName" name="lastName" placeholder="Doe" autocomplete="family-name"/>
          </div>
          <div class="error-msg" id="lastNameErr">Please enter your last name.</div>
        </div>
      </div>

      <!-- Mobile -->
      <div class="form-group">
        <label>Mobile Number <span class="req">*</span></label>
        <div class="flag-select">
          <div class="flag-label">🇮🇳 +91</div>
          <!-- ✅ FIX 2: Added name="mobile" -->
          <input type="tel" id="mobile" name="mobile" placeholder="Enter mobile number" autocomplete="tel" maxlength="10"/>
        </div>
        <div class="error-msg" id="mobileErr">Please enter a valid 10-digit mobile number.</div>
      </div>

      <!-- Email -->
      <div class="form-group">
        <label>Email Address <span class="req">*</span></label>
        <div class="input-wrap">
          <!-- ✅ FIX 2: Added name="email" -->
          <input type="email" id="email" name="email" placeholder="john@company.com" autocomplete="email"/>
        </div>
        <div class="error-msg" id="emailErr">Please enter a valid email address.</div>
      </div>

      <!-- Country -->
      <div class="form-group">
        <label>Where is your company registered? <span class="req">*</span></label>
        <div class="input-wrap country-select-wrap">
          <span class="country-flag" id="countryFlag">🇮🇳</span>
          <!-- ✅ FIX 2: Added name="country" -->
          <select id="country" name="country">
            <option value="IN" selected>India</option>
            <option value="US">United States</option>
            <option value="GB">United Kingdom</option>
            <option value="AU">Australia</option>
            <option value="SG">Singapore</option>
            <option value="AE">UAE</option>
            <option value="MY">Malaysia</option>
            <option value="BD">Bangladesh</option>
            <option value="NP">Nepal</option>
          </select>
        </div>
      </div>

      <!-- Password -->
      <div class="form-group">
        <label>Create Password <span class="req">*</span></label>
        <div class="input-wrap">
          <!-- ✅ FIX 2: Added name="password" -->
          <input type="password" id="password" name="password" placeholder="Min. 8 characters" autocomplete="new-password" class="pw-field"/>
          <button type="button" class="eye-btn" id="eyeBtn1" aria-label="Toggle password">
            <svg id="eyeIcon1" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
              <circle cx="12" cy="12" r="3"/>
            </svg>
          </button>
        </div>
        <div class="pw-strength" id="pwStrength">
          <div class="pw-bars">
            <div class="pw-bar" id="bar1"></div>
            <div class="pw-bar" id="bar2"></div>
            <div class="pw-bar" id="bar3"></div>
          </div>
          <div class="pw-label" id="pwLabel">Weak</div>
        </div>
        <div class="error-msg" id="passwordErr">Password must be at least 8 characters.</div>
      </div>

      <!-- Confirm Password (client-side only, not sent to server) -->
      <div class="form-group">
        <label>Confirm Password <span class="req">*</span></label>
        <div class="input-wrap">
          <!-- No name attribute — confirm password is validation only, not stored -->
          <input type="password" id="confirmPassword" placeholder="Re-enter your password" autocomplete="new-password" class="pw-field"/>
          <button type="button" class="eye-btn" id="eyeBtn2" aria-label="Toggle confirm password">
            <svg id="eyeIcon2" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
              <circle cx="12" cy="12" r="3"/>
            </svg>
          </button>
        </div>
        <div class="error-msg" id="confirmPasswordErr">Passwords do not match.</div>
      </div>

      <button type="submit" class="btn-continue">Continue</button>
    </form>

    <div class="divider"><span>or</span></div>

    <button class="btn-google" type="button">
      <svg class="google-icon" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
        <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
        <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
        <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
        <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
      </svg>
      Continue with Google
    </button>

    <p class="terms">
      By continuing you agree to our <a href="#">privacy policy</a> and <a href="#">terms of use</a>
    </p>

    <div class="partner-box">
      <p>Helping Clients with Razorpay Solutions?</p>
      <a href="#">Become Razorpay Partner →</a>
    </div>
  </div>

  <script>
    // Eye toggle
    function togglePw(inputId, iconId) {
      var input = document.getElementById(inputId);
      var icon  = document.getElementById(iconId);
      if (input.type === 'password') {
        input.type = 'text';
        icon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';
      } else {
        input.type = 'password';
        icon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
      }
    }

    document.getElementById('eyeBtn1').addEventListener('click', function() { togglePw('password', 'eyeIcon1'); });
    document.getElementById('eyeBtn2').addEventListener('click', function() { togglePw('confirmPassword', 'eyeIcon2'); });

    // Password strength meter
    document.getElementById('password').addEventListener('input', function() {
      var val      = this.value;
      var strength = document.getElementById('pwStrength');
      var bar1     = document.getElementById('bar1');
      var bar2     = document.getElementById('bar2');
      var bar3     = document.getElementById('bar3');
      var label    = document.getElementById('pwLabel');

      if (!val) { strength.classList.remove('visible'); return; }
      strength.classList.add('visible');

      var score = 0;
      if (val.length >= 8) score++;
      if (/[A-Z]/.test(val) && /[a-z]/.test(val)) score++;
      if (/[0-9]/.test(val) && /[^A-Za-z0-9]/.test(val)) score++;

      bar1.className = 'pw-bar';
      bar2.className = 'pw-bar';
      bar3.className = 'pw-bar';

      if (score === 1) {
        bar1.classList.add('weak');
        label.textContent  = 'Weak';
        label.style.color  = '#ef4444';
      } else if (score === 2) {
        bar1.classList.add('medium');
        bar2.classList.add('medium');
        label.textContent  = 'Medium';
        label.style.color  = '#f59e0b';
      } else if (score === 3) {
        bar1.classList.add('strong');
        bar2.classList.add('strong');
        bar3.classList.add('strong');
        label.textContent  = 'Strong';
        label.style.color  = '#10b981';
      }
    });

    // Country flag update
    var flagMap = { IN:'🇮🇳', US:'🇺🇸', GB:'🇬🇧', AU:'🇦🇺', SG:'🇸🇬', AE:'🇦🇪', MY:'🇲🇾', BD:'🇧🇩', NP:'🇳🇵' };
    document.getElementById('country').addEventListener('change', function() {
      document.getElementById('countryFlag').textContent = flagMap[this.value] || '🌐';
    });

    // Mobile: digits only
    document.getElementById('mobile').addEventListener('input', function() {
      this.value = this.value.replace(/\D/g, '').slice(0, 10);
    });

    // Validation helpers
    function showErr(id, errId, msg) {
      var el  = document.getElementById(id);
      var err = document.getElementById(errId);
      if (el) el.classList.add('error');
      err.textContent = msg;
      err.classList.add('visible');
      return false;
    }

    function clearErr(id, errId) {
      var el = document.getElementById(id);
      if (el) el.classList.remove('error');
      document.getElementById(errId).classList.remove('visible');
    }

    // Live clear on input
    var errMap = {
      firstName:       'firstNameErr',
      lastName:        'lastNameErr',
      mobile:          'mobileErr',
      email:           'emailErr',
      password:        'passwordErr',
      confirmPassword: 'confirmPasswordErr'
    };
    Object.keys(errMap).forEach(function(id) {
      var el = document.getElementById(id);
      if (el) el.addEventListener('input', function() { clearErr(id, errMap[id]); });
    });

    // ✅ FIX 3: Validate first — only call e.preventDefault() if invalid.
    //           If valid, let the form POST naturally to the JSP.
    document.getElementById('signupForm').addEventListener('submit', function(e) {
      var firstName       = document.getElementById('firstName').value.trim();
      var lastName        = document.getElementById('lastName').value.trim();
      var mobile          = document.getElementById('mobile').value.trim();
      var email           = document.getElementById('email').value.trim();
      var password        = document.getElementById('password').value;
      var confirmPassword = document.getElementById('confirmPassword').value;

      var valid = true;

      if (!firstName)                               { valid = showErr('firstName',       'firstNameErr',       'Please enter your first name.'); }
      if (!lastName)                                { valid = showErr('lastName',        'lastNameErr',        'Please enter your last name.'); }
      if (!/^\d{10}$/.test(mobile))                 { valid = showErr('mobile',          'mobileErr',          'Please enter a valid 10-digit mobile number.'); }
      if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){ valid = showErr('email',          'emailErr',           'Please enter a valid email address.'); }
      if (password.length < 8)                      { valid = showErr('password',        'passwordErr',        'Password must be at least 8 characters.'); }
      if (password !== confirmPassword)             { valid = showErr('confirmPassword',  'confirmPasswordErr', 'Passwords do not match.'); }

      // Only block submission if validation fails
      if (!valid) {
        e.preventDefault();
      }
      // If valid === true, form submits normally to JSP — no preventDefault()
    });
  </script>
</body>
</html>
