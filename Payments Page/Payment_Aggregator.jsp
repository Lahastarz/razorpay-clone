<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Razorpay Payment Aggregator</title>
  <link rel="stylesheet" href="style.css" />
  <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700;900&family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet" />
<style>/* ===================== RESET & BASE ===================== */
*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

:root {
  --blue: #2563eb;
  --dark-blue: #1a237e;
  --royal-blue: #3b5bdb;
  --blue-bg: #0a2463;
  --text-dark: #1a2340;
  --text-mid: #3d4966;
  --text-light: #6b7280;
  --green-accent: #22c55e;
  --teal: #06b6d4;
  --white: #ffffff;
  --light-bg: #f5f7ff;
  --border: #e2e8f0;
  --font-main: 'Lato', 'Open Sans', sans-serif;
}

body {
  font-family: var(--font-main);
  color: var(--text-dark);
  background: var(--white);
  overflow-x: hidden;
}

a {
  text-decoration: none;
  color: inherit;
}

ul {
  list-style: none;
}

/* ===================== NAVBAR ===================== */
/* .navbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 40px;
  height: 60px;
  background: #fff;
  box-shadow: 0 1px 6px rgba(0,0,0,0.08);
  position: sticky;
  top: 0;
  z-index: 100;
}

.nav-left {
  display: flex;
  align-items: center;
  gap: 32px;
}

.logo {
  display: flex;
  align-items: center;
  gap: 8px;
}

.logo-text {
  font-size: 20px;
  font-weight: 900;
  color: var(--blue);
  letter-spacing: -0.5px;
}

.nav-links {
  display: flex;
  gap: 24px;
}

.nav-links li a {
  font-size: 13.5px;
  color: #3d4966;
  font-weight: 600;
  transition: color 0.2s;
}

.nav-links li a:hover {
  color: var(--blue);
}

.nav-right {
  display: flex;
  align-items: center;
  gap: 16px;
}

.country-selector {
  display: flex;
  align-items: center;
  gap: 4px;
  font-size: 18px;
  cursor: pointer;
}

.country-selector .arrow {
  font-size: 10px;
  color: #999;
}

.btn-login {
  border: 1.5px solid var(--blue);
  color: var(--blue);
  padding: 7px 20px;
  border-radius: 4px;
  font-size: 13.5px;
  font-weight: 700;
  transition: all 0.2s;
}

.btn-login:hover {
  background: var(--blue);
  color: #fff;
}

.btn-signup {
  background: var(--blue);
  color: #fff;
  padding: 8px 22px;
  border-radius: 4px;
  font-size: 13.5px;
  font-weight: 700;
  transition: background 0.2s;
}

.btn-signup:hover {
  background: #1d4ed8;
} */
.navbar {
  position: sticky;
  top: 0;
  z-index: 1000;
  background: #ffffff;
  border-bottom: 1px solid #e5e7eb;
  transition: box-shadow 0.3s;
}

.nav-container {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 24px;
  height: 66px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
}

.nav-logo img {
  height: 34px;
  object-fit: contain;
}

/* ===========================
   NAV LINKS
=========================== */
.nav-links {
  display: flex;
  align-items: center;
  height: 66px;
}

.nav-item {
  position: static;
  height: 100%;
  display: flex;
  align-items: center;
}

.nav-link {
  padding: 8px 11px;
  font-size: 14px;
  font-weight: 500;
  color: #374151;
  white-space: nowrap;
  cursor: pointer;
  display: flex;
  align-items: center;
  height: 100%;
  border-bottom: 2.5px solid transparent;
  transition: color 0.15s;
}

.nav-link:hover {
  color: #2563eb;
}

.nav-link.active-link {
  color: #2563eb;
  border-bottom: 2.5px solid #2563eb;
}

/* ===========================
   DROPDOWN BASE
=========================== */
.dropdown {
  display: none;
  position: fixed;
  top: 66px;
  left: 0;
  right: 0;
  background: #ffffff;
  border-top: 1px solid #e5e7eb;
  border-bottom: 1px solid #e5e7eb;
  box-shadow: 0 12px 40px rgba(0, 0, 0, 0.10);
  z-index: 999;
  animation: fadeSlideDown 0.18s ease;
}

@keyframes fadeSlideDown {
  from {
    opacity: 0;
    transform: translateY(-6px);
  }

  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.nav-item.has-dropdown:hover .dropdown {
  display: block;
}

/* ===========================
   SIMPLE DROPDOWN
=========================== */
.dropdown-simple {
  position: absolute;
  top: 66px;
  left: auto;
  right: auto;
  width: auto;
  min-width: 220px;
  border-radius: 0 0 10px 10px;
  padding: 12px 0;
}

.simple-link {
  display: block;
  padding: 12px 28px;
  font-size: 15px;
  font-weight: 400;
  color: #374151;
  transition: color 0.15s, background 0.15s;
}

.simple-link:hover {
  color: #2563eb;
  background: #f8faff;
}

/* ===========================
   MEGA DROPDOWN
=========================== */
.mega-col-wrap {
  max-width: 1280px;
  margin: 0 auto;
  display: flex;
  padding-top: 28px;
}

.mega-col {
  flex: 1;
  padding: 0 20px 28px 20px;
  border-right: 1px solid #f1f5f9;
}

.mega-col:first-child {
  padding-left: 32px;
}

.mega-col:last-child {
  border-right: none;
  padding-right: 32px;
}

.col-heading {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.8px;
  color: #9ca3af;
  text-transform: uppercase;
  margin-bottom: 14px;
}

.mega-item {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  padding: 9px 8px;
  border-radius: 8px;
  margin-bottom: 2px;
  transition: background 0.15s;
  cursor: pointer;
}

.mega-item:hover {
  background: #f4f8ff;
}

.mega-icon {
  width: 36px;
  height: 36px;
  min-width: 36px;
  background: #2563eb;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 14px;
  color: white;
  font-weight: 700;
}

.mega-icon-x {
  font-size: 15px;
  font-weight: 900;
}

.mega-text {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.mega-title {
  font-size: 14px;
  font-weight: 600;
  color: #111827;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 5px;
  line-height: 1.3;
}

.mega-desc {
  font-size: 12px;
  color: #6b7280;
  line-height: 1.4;
}

.tag-new {
  background: #10b981;
  color: white;
  font-size: 10px;
  font-weight: 700;
  padding: 2px 6px;
  border-radius: 4px;
  letter-spacing: 0.2px;
  white-space: nowrap;
}

.mega-footer {
  background: #f9fafb;
  border-top: 1px solid #f1f5f9;
  padding: 12px 32px;
  font-size: 11px;
  color: #9ca3af;
  text-align: center;
  border-radius: 0 0 0 0;
}

/* ===========================
   NAV ACTIONS
=========================== */
.nav-actions {
  display: flex;
  align-items: center;
  gap: 10px;
  flex-shrink: 0;
}

.btn-login {
  background: transparent;
  border: 1.5px solid #2563eb;
  color: #2563eb;
  padding: 8px 18px;
  border-radius: 7px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  font-family: 'DM Sans', sans-serif;
  transition: all 0.2s;
  white-space: nowrap;
}

.btn-login:hover {
  background: #2563eb;
  color: white;
}

.btn-signup {
  background: #2563eb;
  color: white;
  border: none;
  padding: 9px 20px;
  border-radius: 7px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  font-family: 'DM Sans', sans-serif;
  transition: background 0.2s;
  white-space: nowrap;
}

.btn-signup:hover {
  background: #1d4ed8;
}

.hamburger {
  display: none;
  flex-direction: column;
  gap: 5px;
  cursor: pointer;
  padding: 4px;
}

.hamburger span {
  width: 22px;
  height: 2px;
  background: #0f172a;
  border-radius: 2px;
  transition: all 0.3s;
}

/* ===================== HERO ===================== */
.hero {
  display: flex;
  align-items: center;
  min-height: calc(100vh - 60px);
  padding: 60px 80px 60px 80px;
  background: linear-gradient(135deg, #fff 55%, #1a3ad4 55%);
  position: relative;
  overflow: hidden;
}

.hero-left {
  flex: 1;
  max-width: 560px;
  z-index: 2;
}

.hero-left h1 {
  font-size: 38px;
  font-weight: 900;
  color: var(--text-dark);
  line-height: 1.22;
  margin-bottom: 16px;
}

.hero-left h1 .blue {
  color: var(--blue);
}

.green-line {
  width: 36px;
  height: 4px;
  background: var(--green-accent);
  border-radius: 2px;
  margin: 18px 0 22px;
}

.green-line.center {
  margin: 18px auto 30px;
}

.hero-left p {
  font-size: 15px;
  color: var(--text-mid);
  line-height: 1.7;
  max-width: 440px;
  margin-bottom: 28px;
}

.brand-logos {
  display: flex;
  align-items: center;
  gap: 24px;
  margin-bottom: 32px;
  flex-wrap: wrap;
}

.brand {
  font-size: 15px;
  font-weight: 700;
  color: #333;
  opacity: 0.85;
}

.brand.goibibo {
  color: #e85d04;
  font-size: 18px;
}

.brand.grofers {
  color: #ff6f00;
  font-size: 13px;
}

.hero-btns {
  display: flex;
  gap: 16px;
  flex-wrap: wrap;
}

.btn-primary {
  display: inline-block;
  background: var(--blue);
  color: #fff;
  padding: 12px 28px;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 700;
  transition: background 0.2s;
}

.btn-primary:hover {
  background: #1d4ed8;
}

.btn-outline {
  display: inline-block;
  border: 1.5px solid #333;
  color: #333;
  padding: 12px 24px;
  border-radius: 4px;
  font-size: 14px;
  font-weight: 600;
  transition: all 0.2s;
}

.btn-outline:hover {
  background: #f3f4f6;
}

/* Hero Illustration */
.hero-right {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  z-index: 2;
}

.hero-illustration {
  position: relative;
}

.desk-base {
  background: #e8ecf4;
  width: 360px;
  height: 220px;
  border-radius: 8px;
  position: relative;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  box-shadow: 0 20px 60px rgba(0, 0, 50, 0.18);
  transform: perspective(900px) rotateX(10deg) rotateY(-12deg);
}

.monitor {
  position: absolute;
  top: -140px;
  left: 50px;
  width: 200px;
  height: 170px;
  background: #1e293b;
  border-radius: 10px 10px 4px 4px;
  box-shadow: 0 10px 40px rgba(0, 0, 80, 0.35);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 14px;
}

.monitor-screen {
  background: #243b55;
  width: 100%;
  height: 100%;
  border-radius: 6px;
  padding: 12px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.screen-bar {
  height: 14px;
  border-radius: 3px;
  background: var(--teal);
  width: 80%;
}

.screen-bar.short {
  width: 55%;
}

.pay-btn {
  margin-top: auto;
  background: #e63946;
  color: #fff;
  font-size: 11px;
  font-weight: 900;
  letter-spacing: 1.5px;
  padding: 5px 14px;
  border-radius: 3px;
  align-self: flex-end;
  box-shadow: 0 2px 8px rgba(230, 57, 70, 0.4);
}

.tablet {
  position: absolute;
  bottom: 20px;
  left: 10px;
  width: 110px;
  height: 80px;
  background: #1e293b;
  border-radius: 6px;
  padding: 8px;
  box-shadow: 0 6px 20px rgba(0, 0, 80, 0.25);
}

.tablet-screen {
  background: #e0f2fe;
  width: 100%;
  height: 100%;
  border-radius: 4px;
}

.desk-legs {
  position: absolute;
  bottom: -48px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 12px;
}

.leg {
  width: 16px;
  height: 52px;
  background: var(--blue);
  border-radius: 0 0 4px 4px;
  opacity: 0.85;
}

/* ===================== FEATURES ===================== */
.features {
  display: flex;
  align-items: flex-start;
  padding: 90px 80px;
  gap: 60px;
  background: #fff;
}

.features-left {
  flex: 1;
  max-width: 560px;
}

.features-left h2 {
  font-size: 30px;
  font-weight: 900;
  color: var(--text-dark);
  line-height: 1.25;
}

.feature-item {
  margin-bottom: 28px;
}

.feature-item h3 {
  font-size: 15px;
  font-weight: 800;
  color: var(--text-dark);
  margin-bottom: 8px;
}

.feature-item p {
  font-size: 14px;
  color: var(--text-mid);
  line-height: 1.7;
}

.features-right {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

/* Stack Illustration */
.stack-illustration {
  position: relative;
  width: 280px;
  height: 380px;
}

.stack-layer {
  position: absolute;
  left: 50%;
  transform: translateX(-50%);
  border-radius: 4px;
  box-shadow: 0 6px 30px rgba(0, 0, 100, 0.2);
}

.layer1 {
  width: 200px;
  height: 80px;
  background: linear-gradient(135deg, #06b6d4, #0ea5e9);
  top: 20px;
  opacity: 0.85;
}

.layer2 {
  width: 200px;
  height: 130px;
  background: #fff;
  border: 1px solid var(--border);
  top: 100px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.layer3 {
  width: 220px;
  height: 200px;
  background: linear-gradient(150deg, #1a237e, #2563eb);
  top: 180px;
}

.stack-label {
  position: absolute;
  right: 20px;
  top: 200px;
  font-size: 11px;
  font-weight: 900;
  letter-spacing: 2px;
  color: rgba(255, 255, 255, 0.5);
  writing-mode: vertical-rl;
}

/* ===================== DASHBOARD SECTION ===================== */
.dashboard-section {
  display: flex;
  align-items: flex-start;
  padding: 80px 80px;
  gap: 60px;
  background: var(--white);
}

.dashboard-left {
  flex: 1;
  max-width: 500px;
}

.dashboard-left h2 {
  font-size: 30px;
  font-weight: 900;
  color: var(--text-dark);
  line-height: 1.25;
  margin-bottom: 4px;
}

.dashboard-left>p {
  font-size: 14px;
  color: var(--text-mid);
  line-height: 1.7;
  margin-bottom: 28px;
}

/* Dashboard Mockup */
.dashboard-right {
  flex: 1.2;
  display: flex;
  justify-content: center;
}

.dashboard-mockup {
  display: flex;
  width: 100%;
  max-width: 620px;
  border-radius: 10px;
  box-shadow: 0 12px 50px rgba(0, 0, 80, 0.14);
  overflow: hidden;
  border: 1px solid var(--border);
  background: #fff;
}

.db-sidebar {
  width: 140px;
  background: #1e2a3b;
  color: #a0b0c8;
  padding: 16px 0;
  flex-shrink: 0;
}

.db-logo {
  font-size: 12px;
  font-weight: 800;
  color: #fff;
  padding: 0 14px 16px;
}

.db-sidebar ul li {
  padding: 7px 14px;
  font-size: 11px;
  cursor: pointer;
  transition: background 0.15s;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.db-sidebar ul li:hover,
.db-sidebar ul li.active {
  background: rgba(255, 255, 255, 0.08);
  color: #fff;
}

.badge {
  background: var(--green-accent);
  color: #fff;
  font-size: 8px;
  padding: 2px 5px;
  border-radius: 3px;
  margin-left: 4px;
  font-weight: 700;
}

.db-main {
  flex: 1;
  padding: 14px 16px;
  overflow: hidden;
}

.db-topbar {
  display: flex;
  justify-content: space-between;
  font-size: 10px;
  color: var(--text-light);
  margin-bottom: 12px;
  border-bottom: 1px solid var(--border);
  padding-bottom: 8px;
}

.db-stats {
  display: flex;
  gap: 10px;
  margin-bottom: 12px;
}

.stat-card {
  flex: 1;
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 8px 10px;
  min-width: 0;
}

.stat-label {
  font-size: 9px;
  color: var(--text-light);
  margin-bottom: 4px;
}

.stat-val {
  font-size: 14px;
  font-weight: 800;
  color: var(--text-dark);
}

.db-chart-area {
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 10px;
  margin-bottom: 10px;
}

.db-chart-controls {
  display: flex;
  gap: 8px;
  font-size: 9px;
  margin-bottom: 6px;
  justify-content: flex-end;
  color: var(--text-light);
}

.db-chart-controls .active-tab {
  color: var(--blue);
  font-weight: 700;
}

.db-insights {
  border: 1px solid var(--border);
  border-radius: 4px;
  padding: 10px;
}

.insights-title {
  font-size: 10px;
  font-weight: 700;
  margin-bottom: 4px;
}

.insights-label {
  font-size: 9px;
  color: var(--text-light);
  margin-bottom: 8px;
}

.insights-bars {
  display: flex;
  gap: 4px;
}

.ins-bar {
  flex: 1;
  padding: 6px 8px;
  border-radius: 3px;
  font-size: 9px;
  color: #fff;
  font-weight: 600;
  line-height: 1.5;
}

.ins-bar.blue {
  background: var(--blue);
}

.ins-bar.indigo {
  background: #4f46e5;
}

/* ===================== INTEGRATION SECTION ===================== */
.integration-section {
  display: flex;
  align-items: flex-start;
  padding: 80px 80px;
  gap: 60px;
  background: var(--light-bg);
}

.integration-left {
  flex: 1;
  max-width: 440px;
}

.integration-left h2 {
  font-size: 28px;
  font-weight: 900;
  color: var(--text-dark);
  margin-bottom: 4px;
}

.integration-left p {
  font-size: 14px;
  color: var(--text-mid);
  line-height: 1.7;
  margin-bottom: 18px;
}

.integration-left blockquote {
  font-size: 13.5px;
  color: var(--text-mid);
  line-height: 1.7;
  font-style: italic;
  margin-bottom: 10px;
  border-left: none;
}

.quote-author {
  font-size: 12.5px;
  color: var(--text-dark);
  margin-bottom: 24px;
}

.int-btns {
  display: flex;
  align-items: center;
  gap: 20px;
  flex-wrap: wrap;
}

.btn-link {
  font-size: 14px;
  color: var(--blue);
  font-weight: 600;
  transition: text-decoration 0.2s;
}

.btn-link:hover {
  text-decoration: underline;
}

.integration-right {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.platform-box {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 6px;
  overflow: hidden;
}

.platform-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 14px 18px;
  font-size: 13.5px;
  font-weight: 700;
  color: var(--text-dark);
  border-bottom: 1px solid var(--border);
}

.know-more {
  font-size: 12px;
  color: var(--blue);
  font-weight: 600;
}

.platform-icons {
  display: flex;
  gap: 0;
  padding: 16px 18px;
  flex-wrap: wrap;
  gap: 12px;
}

.picon {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 6px;
}

.picon span {
  font-size: 10px;
  color: var(--text-mid);
}

.picon-img {
  width: 44px;
  height: 44px;
  border-radius: 8px;
  background: #f1f5f9;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 11px;
  font-weight: 800;
  color: #fff;
}

.android {
  background: #3ddc84;
}

.php {
  background: #787cb4;
  font-size: 16px;
  color: #fff;
  font-weight: 900;
}

.python {
  background: #3776ab;
}

.ruby {
  background: #cc342d;
}

.java {
  background: #f89820;
}

.shopify {
  background: #96bf48;
}

.magento {
  background: #f26322;
}

.woo {
  background: #7f54b3;
}

.cscart {
  background: #e74c3c;
}

.presta {
  background: #df0067;
}

.wix {
  background: #f5f5f5;
}

.picon-img.android::after {
  content: "🤖";
  font-size: 20px;
}

.picon-img.php::after {
  content: "PHP";
}

.picon-img.python::after {
  content: "🐍";
  font-size: 20px;
}

.picon-img.ruby::after {
  content: "💎";
  font-size: 18px;
}

.picon-img.java::after {
  content: "☕";
  font-size: 20px;
}

.picon-img.shopify::after {
  content: "S";
  font-size: 20px;
}

.picon-img.magento::after {
  content: "M";
  font-size: 20px;
}

.picon-img.woo::after {
  content: "W";
  font-size: 20px;
}

.picon-img.cscart::after {
  content: "CS";
}

.picon-img.presta::after {
  content: "P";
  font-size: 18px;
}

/* ===================== OFFERS SECTION ===================== */
.offers-section {
  display: flex;
  align-items: flex-start;
  padding: 80px 80px;
  gap: 60px;
  background: #fff;
}

.offers-left {
  flex: 1;
}

.offers-mockup {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.offer-pill {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 12px 16px;
  font-size: 12px;
  color: var(--text-dark);
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.07);
}

.offer-pill ul {
  margin-top: 6px;
  padding-left: 12px;
  list-style: disc;
  font-size: 11px;
  color: var(--text-mid);
}

.no-cost {
  background: #3b82f6;
  color: #fff;
  font-size: 9px;
  padding: 2px 6px;
  border-radius: 3px;
  margin-left: 6px;
  font-weight: 700;
}

.offer-card {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 10px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  max-width: 340px;
}

.offer-card-header {
  display: flex;
  align-items: center;
  gap: 10px;
  padding: 14px 16px;
  background: #1a3ad4;
  color: #fff;
}

.offer-logo {
  width: 32px;
  height: 32px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
}

.offer-company {
  font-size: 13px;
  font-weight: 700;
}

.offer-id {
  font-size: 10px;
  opacity: 0.75;
}

.offer-amount {
  margin-left: auto;
  font-size: 16px;
  font-weight: 900;
}

.offer-card-body {
  padding: 12px 16px;
  font-size: 11px;
  color: var(--text-dark);
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.offer-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 8px;
}

.offer-row-label {
  font-size: 9px;
  color: var(--text-light);
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-top: 4px;
}

.pay-now {
  background: var(--blue);
  color: #fff;
  border: none;
  padding: 4px 10px;
  border-radius: 3px;
  font-size: 10px;
  font-weight: 700;
  cursor: pointer;
}

.offer-footer {
  border-top: 1px solid var(--border);
  padding-top: 8px;
  margin-top: 4px;
  font-size: 10px;
  color: var(--text-mid);
  display: flex;
  justify-content: space-between;
}

.select-offer {
  color: var(--blue);
  font-weight: 700;
  cursor: pointer;
}

.offer-tag-row {
  display: flex;
  flex-direction: column;
  gap: 6px;
  font-size: 12px;
}

.offer-tag-pill {
  background: #f0f9ff;
  border: 1px solid #bae6fd;
  border-radius: 6px;
  padding: 8px 12px;
  color: var(--text-dark);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.offer-applied {
  font-size: 11px;
  color: #16a34a;
  display: flex;
  gap: 8px;
  align-items: center;
}

.offer-applied a {
  color: var(--blue);
  font-weight: 700;
}

/* Offers Right */
.offers-right {
  flex: 1;
  max-width: 500px;
}

.offers-right h2 {
  font-size: 28px;
  font-weight: 900;
  color: var(--text-dark);
  margin-bottom: 4px;
}

.offers-right>p {
  font-size: 14px;
  color: var(--text-mid);
  margin-bottom: 16px;
  line-height: 1.7;
}

.offers-list {
  margin-bottom: 16px;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.offers-list li {
  font-size: 13.5px;
  color: var(--text-mid);
  display: flex;
  align-items: center;
  gap: 8px;
}

.pro-tip {
  background: #f0fdf4;
  border: 1px solid #86efac;
  border-radius: 6px;
  padding: 14px 16px;
  margin: 20px 0 24px;
}

.pro-badge {
  background: #22c55e;
  color: #fff;
  font-size: 10px;
  font-weight: 900;
  padding: 3px 8px;
  border-radius: 3px;
  display: inline-block;
  margin-bottom: 6px;
}

.pro-tip p {
  font-size: 13px;
  color: var(--text-dark);
}

/* ===================== FAQ ===================== */
.faq-section {
  padding: 80px 180px;
  background: #fff;
  text-align: center;
}

.faq-section h2 {
  font-size: 30px;
  font-weight: 900;
  color: var(--text-dark);
}

.faq-list {
  text-align: left;
  max-width: 680px;
  margin: 0 auto;
}

.faq-item {
  border-bottom: 1px solid var(--border);
}

.faq-q {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 18px 4px;
  font-size: 14px;
  font-weight: 600;
  color: var(--text-dark);
  cursor: pointer;
  transition: color 0.2s;
  user-select: none;
}

.faq-q:hover {
  color: var(--blue);
}

.faq-arrow {
  font-size: 12px;
  color: var(--text-light);
  transition: transform 0.3s;
  flex-shrink: 0;
}

.faq-q.open .faq-arrow {
  transform: rotate(180deg);
}

.faq-a {
  display: none;
  padding: 0 4px 18px;
  font-size: 13.5px;
  color: var(--text-mid);
  line-height: 1.7;
}

.faq-a.visible {
  display: block;
}

/* ===================== PRICING ===================== */
.pricing-section {
  padding: 80px 80px;
  background: var(--light-bg);
  text-align: center;
}

.pricing-section h2 {
  font-size: 30px;
  font-weight: 900;
  color: var(--text-dark);
}

.pricing-subtitle {
  font-size: 14px;
  color: var(--text-mid);
  max-width: 540px;
  margin: 0 auto 40px;
  line-height: 1.7;
}

.pricing-cards {
  display: flex;
  gap: 24px;
  justify-content: center;
  flex-wrap: wrap;
}

.pricing-card {
  background: #fff;
  border: 1px solid var(--border);
  border-radius: 8px;
  padding: 28px 32px;
  text-align: left;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
}

.pricing-card.standard {
  flex: 0 0 480px;
}

.pricing-card.enterprise {
  flex: 0 0 260px;
  background: #f5f7ff;
}

.pricing-card h3 {
  font-size: 20px;
  font-weight: 900;
  color: var(--text-dark);
  margin-bottom: 10px;
}

.plan-line {
  width: 36px;
  height: 3px;
  background: var(--blue);
  border-radius: 2px;
  margin-bottom: 18px;
}

.plan-rate {
  font-size: 48px;
  font-weight: 900;
  color: var(--text-dark);
}

.plan-label {
  font-size: 14px;
  font-weight: 700;
  color: var(--text-dark);
  margin-bottom: 4px;
}

.plan-desc {
  font-size: 13px;
  color: var(--text-mid);
  margin-bottom: 12px;
}

.plan-note {
  font-size: 11px;
  color: var(--text-light);
  margin-bottom: 20px;
  line-height: 1.6;
}

.plan-fees {
  display: flex;
  gap: 32px;
  margin-bottom: 24px;
}

.fee-label {
  font-size: 12px;
  font-weight: 700;
  color: var(--text-dark);
}

.fee-val {
  font-size: 16px;
  font-weight: 900;
  color: var(--text-dark);
  margin: 2px 0;
}

.fee-note {
  font-size: 11px;
  color: var(--text-light);
}

.btn-get-started {
  background: var(--blue);
  color: #fff;
  border: none;
  padding: 12px 24px;
  border-radius: 4px;
  font-size: 13.5px;
  font-weight: 800;
  letter-spacing: 0.5px;
  cursor: pointer;
  transition: background 0.2s;
}

.btn-get-started:hover {
  background: #1d4ed8;
}

.pricing-card.enterprise p {
  font-size: 13.5px;
  color: var(--text-mid);
  line-height: 1.7;
  margin-bottom: 12px;
}

.signup-link {
  color: var(--blue);
  font-weight: 700;
  font-size: 14px;
  display: inline-block;
  margin-bottom: 14px;
}

.pricing-card.enterprise hr {
  border: none;
  border-top: 1px solid var(--border);
  margin: 14px 0;
}

/* ===================== FOOTER ===================== */
/* .footer {
  background: #1a2340;
  padding: 32px 80px;
}

.footer-inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 16px;
}

.footer-logo {
  display: flex;
  align-items: center;
  gap: 8px;
}

.footer .logo-text {
  color: #fff;
}

.footer p {
  font-size: 12px;
  color: rgba(255,255,255,0.5);
} */
.footer {
  background: #f5f7fa;
  padding: 60px 40px;
  font-family: Arial, sans-serif;
}

.footer-container {
  max-width: 1200px;
  margin: auto;
}

/* GRID */
.footer-grid {
  display: grid;
  grid-template-columns: 2fr repeat(4, 1fr);
  gap: 50px;
}

/* ABOUT SECTION */
.footer-about {
  color: #6b7280;
  font-size: 14px;
  line-height: 1.6;
}

.footer-about p {
  margin-bottom: 15px;
}

.logo {
  font-size: 22px;
  font-weight: bold;
  color: #111827;
  margin-bottom: 15px;
}

.disclaimer {
  font-size: 12px;
  color: #9ca3af;
}

/* HEADINGS */
.footer-col h4 {
  font-size: 12px;
  font-weight: 700;
  color: #6b7280;
  margin: 20px 0 10px;
}

/* LINKS */
.footer-col ul {
  list-style: none;
  padding: 0;
}

.footer-col ul li {
  font-size: 14px;
  color: #2563eb;
  margin-bottom: 8px;
  cursor: pointer;
}

.footer-col ul li:hover {
  text-decoration: underline;
}

/* NEW TAG */
.new-badge {
  background: #d1fae5;
  color: #065f46;
  font-size: 10px;
  padding: 2px 6px;
  border-radius: 10px;
  margin-left: 6px;
}

/* SOCIAL */
.social-icons {
  display: flex;
  gap: 10px;
  margin: 10px 0;
}

.social-icons span {
  font-size: 18px;
  cursor: pointer;
}

/* ADDRESS */
.address {
  font-size: 13px;
  color: #6b7280;
  line-height: 1.5;
}

/* FOOTER BOTTOM */
.footer-bottom {
  margin-top: 40px;
  font-size: 13px;
  color: #6b7280;
}

/* RESPONSIVE */
@media (max-width: 1024px) {
  .footer-grid {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 600px) {
  .footer-grid {
    grid-template-columns: 1fr;
  }
}



/* ===================== RESPONSIVE ===================== */
@media (max-width: 1024px) {
  .hero {
    padding: 40px 40px;
    background: linear-gradient(180deg, #fff 55%, #1a3ad4 55%);
    flex-direction: column;
  }

  .features,
  .dashboard-section,
  .integration-section,
  .offers-section {
    flex-direction: column;
    padding: 60px 40px;
  }

  .faq-section {
    padding: 60px 40px;
  }

  .pricing-section {
    padding: 60px 40px;
  }

  .navbar {
    padding: 0 20px;
  }

  .nav-links {
    display: none;
  }

  .footer {
    padding: 32px 40px;
  }
}

@media (max-width: 600px) {
  .hero-left h1 {
    font-size: 26px;
  }

  .pricing-card.standard {
    flex: 0 0 100%;
  }

  .pricing-card.enterprise {
    flex: 0 0 100%;
  }
}</style>
</head>
<body>

  <!-- NAVBAR -->
  <!-- <nav class="navbar">
    <div class="nav-left">
      <a href="#" class="logo">
        <svg width="24" height="24" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M20 0L37 10V30L20 40L3 30V10L20 0Z" fill="#2563eb"/>
          <path d="M14 12h8l4 8-4 8h-8l4-8-4-8z" fill="white"/>
        </svg>
        <span class="logo-text">Razorpay</span>
      </a>
      <ul class="nav-links">
        <li><a href="#">Agentic Stack</a></li>
        <li><a href="#">Payments</a></li>
        <li><a href="#">Banking+</a></li>
        <li><a href="#">Payroll</a></li>
        <li><a href="#">Engage</a></li>
        <li><a href="#">Partners</a></li>
        <li><a href="#">Resources</a></li>
        <li><a href="#">Pricing</a></li>
      </ul>
    </div>
    <div class="nav-right">
      <div class="country-selector">
        <span>🇮🇳</span>
        <span class="arrow">&#9660;</span>
      </div>
      <a href="#" class="btn-login">Login</a>
      <a href="#" class="btn-signup">Sign Up &rarr;</a>
    </div>
  </nav> -->

      <header class="navbar" id="navbar">
        <nav class="nav-container">

            <!-- Logo -->
            <div class="nav-logo">
                <img src="razorpay_img.png" alt="Razorpay Logo">
            </div>

            <!-- Nav Links with Dropdowns -->
            <ul class="nav-links" id="nav-links">

                <!-- AGENTIC STACK -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Agentic Stack</a>
                    <div class="dropdown dropdown-simple">
                        <a href="#" class="simple-link">Agentic Payments</a>
                        <a href="#" class="simple-link">Agent Studio</a>
                        <a href="#" class="simple-link">Agentic Business Banking</a>
                    </div>
                </li>

                <!-- PAYMENTS -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Payments</a>
                    <div class="dropdown dropdown-mega">
                        <div class="mega-col-wrap">

                            <div class="mega-col">
                                <p class="col-heading">ACCEPT PAYMENTS ONLINE</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9646;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Aggregator</span>
                                        <span class="mega-desc">Accepting payments made easy for businesses</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9646;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Gateway</span>
                                        <span class="mega-desc">Payments on your Website &amp; App</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128279;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Links</span>
                                        <span class="mega-desc">Create &amp; send links to collect money</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128196;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Pages</span>
                                        <span class="mega-desc">Get paid with personalized page</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9707;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">QR Codes</span>
                                        <span class="mega-desc">Multi-feature QR for your business</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9654;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">UPI Payments <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Discover the complete UPI stack</span>
                                    </div>
                                </a>
                            </div>

                            <div class="mega-col">
                                <p class="col-heading">&nbsp;</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9889;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Magic Checkout <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Improve Order Conversions &amp; Reduce RTOs</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#8635;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Subscriptions</span>
                                        <span class="mega-desc">Collect recurring subscription payments</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9889;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Instant Settlement</span>
                                        <span class="mega-desc">Customer payments settled faster</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9881;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Optimizer</span>
                                        <span class="mega-desc">Manage multiple payment gateways</span>
                                    </div>
                                </a>
                                <p class="col-heading" style="margin-top:20px;">ACCEPT PAYMENTS OFFLINE</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128241;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Razorpay POS</span>
                                        <span class="mega-desc">Accept Payments In-Store</span>
                                    </div>
                                </a>
                            </div>

                            <div class="mega-col">
                                <p class="col-heading">ACCEPT INTERNATIONAL PAYMENTS</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#127760;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">International Payments</span>
                                        <span class="mega-desc">Accept payments from across the globe</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9992;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">International Bank Transfers</span>
                                        <span class="mega-desc">Accept USD, GBP, EUR payments in your account</span>
                                    </div>
                                </a>
                                <p class="col-heading" style="margin-top:20px;">BUILT FOR GLOBAL BUSINESSES</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#127760;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Accept Payments from India <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Seamless INR collections via UPI &amp; cards</span>
                                    </div>
                                </a>
                                <p class="col-heading" style="margin-top:20px;">ALL-IN-ONE PAYMENTS</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9881;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Omnichannel Payments <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">One Payment Platform for All Channels</span>
                                    </div>
                                </a>
                            </div>

                        </div>
                        <div class="mega-footer">
                            Payment aggregation services provided by Razorpay Payments Private Limited, an RBI Authorised Payment Aggregator
                        </div>
                    </div>
                </li>

                <!-- BANKING+ -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Banking+</a>
                    <div class="dropdown dropdown-mega">
                        <div class="mega-col-wrap">

                            <div class="mega-col">
                                <p class="col-heading">BUSINESS BANKING PLUS</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon mega-icon-x">X</div>
                                    <div class="mega-text">
                                        <span class="mega-title">RazorpayX</span>
                                        <span class="mega-desc">Business Banking Supercharged for disruptors</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#8635;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Vendor Payments <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Integrated Accounts Payable Automation</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9654;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payouts</span>
                                        <span class="mega-desc">24&times;7, Instant &amp; Automated Payouts</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128279;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payout Links</span>
                                        <span class="mega-desc">Send money without recipient account details</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128196;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Corporate Cards <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Streamline your business expenses</span>
                                    </div>
                                </a>
                            </div>

                            <div class="mega-col">
                                <p class="col-heading">&nbsp;</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#127970;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Current Account</span>
                                        <span class="mega-desc">Supercharged for businesses</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128196;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Escrow+ Account <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Escrow account for digital-first businesses</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9881;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Forex/FDI Transfers <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Expert-led service to bring foreign currency</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9989;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Bank Account Verification <span class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Instantly verify Bank Account, UPI ID or IFSC</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#37;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Tax Payments</span>
                                        <span class="mega-desc">Pay your business taxes in under 30 seconds</span>
                                    </div>
                                </a>
                            </div>

                            <div class="mega-col">
                                <p class="col-heading">&nbsp;</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9646;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Lending Tech Stack</span>
                                        <span class="mega-desc">Fully compliant, 10-second disbursals</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128188;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Free Tools</span>
                                        <span class="mega-desc">Essential Business Tools</span>
                                    </div>
                                </a>
                                <p class="col-heading" style="margin-top:20px;">START YOUR BUSINESS</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#128200;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Company Registration</span>
                                        <span class="mega-desc">Simplify your business incorporation journey</span>
                                    </div>
                                </a>
                            </div>

                        </div>
                        <div class="mega-footer">
                            Business Banking+ is operated under RZPX Limited where the banking services are provided by scheduled commercial banks. Digital Lending is operated under Razorpay Tech Solutions Private Limited, a Lending Service Provider to Regulated Entities authorised by RBI.
                        </div>
                    </div>
                </li>

                <!-- PAYROLL -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Payroll</a>
                    <div class="dropdown dropdown-simple">
                        <a href="#" class="simple-link">Payroll Software</a>
                        <a href="#" class="simple-link">Payslip Generation</a>
                        <a href="#" class="simple-link">Tax Compliance</a>
                    </div>
                </li>

                <!-- ENGAGE -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Engage</a>
                    <div class="dropdown dropdown-simple">
                        <a href="#" class="simple-link">Magic Checkout</a>
                        <a href="#" class="simple-link">Offers &amp; Coupons</a>
                        <a href="#" class="simple-link">Loyalty Rewards</a>
                    </div>
                </li>

                <!-- PARTNERS -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Partners</a>
                    <div class="dropdown dropdown-simple">
                        <a href="#" class="simple-link">Become a Partner</a>
                        <a href="#" class="simple-link">Agency Partners</a>
                        <a href="#" class="simple-link">Technology Partners</a>
                    </div>
                </li>

                <!-- RESOURCES -->
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Resources</a>
                    <div class="dropdown dropdown-simple">
                        <a href="#" class="simple-link">Blog</a>
                        <a href="#" class="simple-link">Documentation</a>
                        <a href="#" class="simple-link">Razorpay Learn</a>
                        <a href="#" class="simple-link">Support</a>
                    </div>
                </li>

                <!-- PRICING -->
                <li class="nav-item">
                    <a href="#" class="nav-link">Pricing</a>
                </li>

            </ul>

            <!-- Right Side Buttons
            <div class="nav-actions">
                <button class="btn-login">Login</button>
                <button class="btn-signup">Sign Up &rarr;</button>
            </div> -->

            <!-- Hamburger -->
            <div class="hamburger" id="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>

        </nav>
    </header>

  <!-- HERO SECTION -->
  <section class="hero">
    <div class="hero-left">
      <h1>Supercharge your<br>business with Razorpay<br><span class="blue">Payment Aggregator</span></h1>
      <div class="green-line"></div>
      <p>With the easiest integration, completely online onboarding, feature filled checkout and best in class performance, quickly go live with Razorpay and experience the future of payments.</p>
      <div class="brand-logos">
        <span class="brand bookmyshow"><b>book<span style="color:#e63946">my</span>show</b></span>
        <span class="brand goibibo">goibibo</span>
        <span class="brand grofers"><b>G GROFERS</b></span>
      </div>
      <div class="hero-btns">
        <a href="#" class="btn-primary">Sign Up &rarr;</a>
        <a href="#" class="btn-outline">View Documentation</a>
      </div>
    </div>
    <div class="hero-right">
      <div class="hero-illustration">
        <div class="desk-base">
          <div class="monitor">
            <div class="monitor-screen">
              <div class="screen-content">
                <div class="screen-bar teal"></div>
                <div class="screen-bar teal short"></div>
                <div class="pay-btn">PAY</div>
              </div>
            </div>
          </div>
          <div class="tablet">
            <div class="tablet-screen"></div>
          </div>
          <div class="desk-legs">
            <div class="leg"></div>
            <div class="leg"></div>
            <div class="leg"></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- FEATURES SECTION -->
  <section class="features">
    <div class="features-left">
      <h2>A System Designed to<br>Handle End to End Payments</h2>
      <div class="green-line"></div>
      <div class="feature-item">
        <h3>Accept All Payment Modes</h3>
        <p>With Domestic and International Credit &amp; Debit cards, EMIs (Credit/Debit Cards &amp; Cardless), PayLater, Netbanking from 58 banks, UPI and 8 mobile wallets, Razorpay provides the most extensive set of payment methods.</p>
      </div>
      <div class="feature-item">
        <h3>Checkout and Global Card Saving</h3>
        <p>An easy to integrate Checkout with cards saved across businesses so that your customers can pay seamlessly everywhere.</p>
      </div>
      <div class="feature-item">
        <h3>Powerful Dashboard</h3>
        <p>Get reports and detailed statistics on payments, settlements, refunds and much more for you to take better business decisions.</p>
      </div>
      <div class="feature-item">
        <h3>Built for Developers</h3>
        <p>Robust, clean, developer friendly APIs, plugins and libraries for all major languages and platforms that let you focus on building great products.</p>
      </div>
      <div class="feature-item">
        <h3>Robust Security</h3>
        <p>PCI DSS Level 1 compliant along with frequent third party security audits and vulnerability assessments.</p>
      </div>
    </div>
    <!-- <div class="features-right">
      <div class="stack-illustration">
        <div class="stack-layer layer1"></div>
        <div class="stack-layer layer2"></div>
        <div class="stack-layer layer3"></div>
        <div class="stack-label">SECURE</div>
      </div>
    </div> -->
    <!-- RIGHT IMAGE -->
        <div class="image">
            <img src="payment_image.png" alt="Payment Illustration">
        </div>
  </section>

  <!-- DASHBOARD SECTION -->
  <section class="dashboard-section">
    <div class="dashboard-left">
      <h2>A Powerful dashboard to give<br>you full control</h2>
      <div class="green-line"></div>
      <p>Access and manage your payments, refunds, transfers, subscriptions, invoices, customer identifiers, API keys, webhooks, account and everything else.</p>
      <div class="feature-item">
        <h3>See Key Statistics</h3>
        <p>Get access to real-time data and insights to take informed business decisions. View important stats and generate customizable settlement and reconciliation reports.</p>
      </div>
      <div class="feature-item">
        <h3>Easy to Use</h3>
        <p>We understand that when it comes to managing payments, speed and ease of use is what matters at the end of the day. We've spent endless hours to make it a great experience for you.</p>
      </div>
      <a href="#" class="btn-primary">Sign Up &rarr;</a>
    </div>
    <div class="dashboard-right">
      <div class="dashboard-mockup">
        <div class="db-sidebar">
          <div class="db-logo">&#8680; Razorpay</div>
          <ul>
            <li class="active">Home</li>
            <li>Transactions</li>
            <li>Settlements</li>
            <li>Invoices</li>
            <li>Payment Links</li>
            <li>Route <span class="badge">New</span></li>
            <li>Subscriptions <span class="badge">New</span></li>
            <li>Smart Collect <span class="badge">New</span></li>
            <li>Customers</li>
            <li>Reports</li>
            <li>My Account</li>
            <li>Settings</li>
          </ul>
        </div>
        <div class="db-main">
          <div class="db-topbar">
            <span class="db-daterange">Past 7 days &nbsp; 12 Jul 2017 → 28 Jul 2017</span>
            <span class="db-balance">Balan...</span>
          </div>
          <div class="db-stats">
            <div class="stat-card">
              <div class="stat-label">Payment Volume</div>
              <div class="stat-val">₹73.42 L</div>
              <div class="stat-sparkline">
                <svg viewBox="0 0 80 30" width="80" height="30"><polyline points="0,25 20,10 40,20 60,5 80,15" fill="none" stroke="#3b82f6" stroke-width="2"/></svg>
              </div>
            </div>
            <div class="stat-card">
              <div class="stat-label">Number of Payments</div>
              <div class="stat-val">15,760</div>
            </div>
            <div class="stat-card">
              <div class="stat-label">Refunds in total</div>
              <div class="stat-val">129</div>
            </div>
          </div>
          <div class="db-chart-area">
            <div class="db-chart-controls">
              <span class="active-tab">Daily</span>
              <span>Weekly</span>
              <span>Monthly</span>
            </div>
            <svg viewBox="0 0 320 80" width="100%" height="80">
              <polyline points="0,70 40,30 80,55 120,10 160,45 200,20 240,60 280,25 320,40" fill="none" stroke="#3b82f6" stroke-width="2"/>
            </svg>
          </div>
          <div class="db-insights">
            <div class="insights-title">Payment Insights</div>
            <div class="insights-label">Showing: All Payment Methods</div>
            <div class="insights-bars">
              <div class="ins-bar blue">₹33,04,629 (45.2%)<br><small>All Cards</small></div>
              <div class="ins-bar indigo">₹22,03,852 (29.8%)<br><small>Net-Banking</small></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- INTEGRATION SECTION -->
  <section class="integration-section">
    <div class="integration-left">
      <h2>The Easiest Integration Ever</h2>
      <div class="green-line"></div>
      <p>Integrating payments with Razorpay is as simple as it can get with well documented SDKs, RESTful APIs and plugins for all major platforms and languages.</p>
      <blockquote>
        Integrating Razorpay was a breeze and we must have spent about 30 minutes doing it. Unquestionably the only Indian payment aggregator truly designed and built for developers.
      </blockquote>
      <p class="quote-author"><strong>Kailash Nadh, Head of Technology, Zerodha</strong></p>
      <div class="int-btns">
        <a href="#" class="btn-primary">Sign Up Now &rarr;</a>
        <a href="#" class="btn-link">Know More</a>
      </div>
    </div>
    <div class="integration-right">
      <div class="platform-box">
        <div class="platform-header">
          Simple Integration on all platforms
          <a href="#" class="know-more">Know More &rarr;</a>
        </div>
        <div class="platform-icons">
          <div class="picon">
            <div class="picon-img android"></div>
            <span>Android</span>
          </div>
          <div class="picon">
            <div class="picon-img php"></div>
            <span>PHP</span>
          </div>
          <div class="picon">
            <div class="picon-img python"></div>
            <span>Python</span>
          </div>
          <div class="picon">
            <div class="picon-img ruby"></div>
            <span>Ruby</span>
          </div>
          <div class="picon">
            <div class="picon-img java"></div>
            <span>Java</span>
          </div>
        </div>
      </div>
      <div class="platform-box">
        <div class="platform-header">
          One Click eCommerce Plugins
          <a href="#" class="know-more">Know More &rarr;</a>
        </div>
        <div class="platform-icons">
          <div class="picon">
            <div class="picon-img shopify"></div>
            <span>Shopify</span>
          </div>
          <div class="picon">
            <div class="picon-img magento"></div>
            <span>Magento</span>
          </div>
          <div class="picon">
            <div class="picon-img woo"></div>
            <span>Woocommerce</span>
          </div>
          <div class="picon">
            <div class="picon-img cscart"></div>
            <span>CS Cart</span>
          </div>
          <div class="picon">
            <div class="picon-img presta"></div>
            <span>PrestaShop</span>
          </div>
        </div>
        <div class="platform-icons" style="margin-top:12px">
          <div class="picon">
            <div class="picon-img wix" style="font-size:22px;font-weight:900;color:#000;display:flex;align-items:center;justify-content:center;">Wix</div>
            <span>Wix</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- OFFERS SECTION -->
  <section class="offers-section">
    <div class="offers-left">
      <div class="offers-mockup">
        <div class="offer-pill">
          <span class="offer-tag">EMI on HDFC Debit Cards <span class="no-cost">No Cost EMI</span></span>
          <ul>
            <li>Zero effective interest with No Cost EMI, Pay only the product price.</li>
            <li>Valid only once per user.</li>
          </ul>
        </div>
        <div class="offer-card">
          <div class="offer-card-header">
            <div class="offer-logo"></div>
            <div>
              <div class="offer-company">Acme Corp</div>
              <div class="offer-id">order: ChkBaUiHUl5r</div>
            </div>
            <div class="offer-amount">₹ 10000</div>
          </div>
          <div class="offer-card-body">
            <div class="offer-row"><span>📱 9985626859</span> <span>ashok.kumar@</span></div>
            <div class="offer-row-label">PREFERRED PAYMENT METHODS</div>
            <div class="offer-row"><span>💳 HDFC Credit Card - 2745</span> <button class="pay-now">Pay</button></div>
            <div class="offer-row"><span>👤 ashok.kumar@bikini</span></div>
            <div class="offer-row-label">ALL PAYMENT METHODS</div>
            <div class="offer-row">💳 Card <small>Mastercard, Visa, Rupay, Maestro, Ame...</small></div>
            <div class="offer-row">📋 EMI <small>Card, Cardless/EMI and more</small></div>
            <div class="offer-footer">🟢 3 Offers Available &nbsp; <span class="select-offer">Select Offer ▲</span></div>
          </div>
        </div>
        <div class="offer-tag-row">
          <div class="offer-tag-pill">Flat ₹100 off on UPI payment</div>
          <div class="offer-tag-pill">10% off on all SBI debit cards <input type="checkbox" checked /></div>
          <div class="offer-applied">✅ Offer Applied. You save ₹100 <a href="#">Change ▲</a></div>
        </div>
      </div>
    </div>
    <div class="offers-right">
      <h2>Run Offers at the Click of a Button</h2>
      <div class="green-line"></div>
      <p>Run all your promotional offers via the Razorpay dashboard.</p>
      <ul class="offers-list">
        <li>✔ Create offers at the click of a button</li>
        <li>✔ Define the number of users who can avail offers</li>
        <li>✔ Run offers for specific banks, card networks and wallets</li>
      </ul>
      <p>Razorpay customers have seen a 35% increase in sales through offers.</p>
      <div class="pro-tip">
        <span class="pro-badge">⚡ PRO TIP</span>
        <p>Use Razorpay Offers to run 'No Cost EMI' schemes for your customers.</p>
      </div>
      <div class="int-btns">
        <a href="#" class="btn-primary">Sign Up Now &rarr;</a>
        <a href="#" class="btn-link">Know More</a>
      </div>
    </div>
  </section>

  <!-- FAQ SECTION -->
  <section class="faq-section">
    <h2>Frequently Asked Questions</h2>
    <div class="green-line center"></div>
    <div class="faq-list">
      <div class="faq-item">
        <div class="faq-q" onclick="toggleFaq(this)">What is a Payment Aggregator? <span class="faq-arrow">&#9660;</span></div>
        <div class="faq-a">A payment aggregator is a service provider that allows merchants to accept payments online without having to set up their own merchant account with a bank.</div>
      </div>
      <div class="faq-item">
        <div class="faq-q" onclick="toggleFaq(this)">How is a payment aggregator different from an online/digital wallet? <span class="faq-arrow">&#9660;</span></div>
        <div class="faq-a">A payment aggregator processes transactions for merchants, while a digital wallet stores funds for consumers. Aggregators focus on B2B merchant services whereas wallets are consumer-facing.</div>
      </div>
      <div class="faq-item">
        <div class="faq-q" onclick="toggleFaq(this)">What payment modes are supported by Razorpay <span class="faq-arrow">&#9660;</span></div>
        <div class="faq-a">Razorpay supports Credit/Debit cards, Net Banking (58+ banks), UPI, 8 mobile wallets, EMIs, and PayLater options.</div>
      </div>
      <div class="faq-item">
        <div class="faq-q" onclick="toggleFaq(this)">What platforms does Razorpay payment aggregator support? <span class="faq-arrow">&#9660;</span></div>
        <div class="faq-a">Razorpay supports Android, iOS, PHP, Python, Ruby, Java, and major eCommerce platforms like Shopify, Magento, WooCommerce, and more.</div>
      </div>
      <div class="faq-item">
        <div class="faq-q" onclick="toggleFaq(this)">What documents are required for setting up a Razorpay account? <span class="faq-arrow">&#9660;</span></div>
        <div class="faq-a">You'll need your business PAN card, proof of business address, bank account details, and proof of identity for the business owner.</div>
      </div>
    </div>
    <div style="text-align:center;margin-top:32px;">
      <a href="#" class="btn-primary">Sign Up Now &rarr;</a>
    </div>
  </section>

  <!-- PRICING SECTION -->
  <section class="pricing-section">
    <h2>Simple pricing, no hidden charges</h2>
    <div class="green-line center"></div>
    <p class="pricing-subtitle">With no setup or maintenance fees and one of the lowest transaction charges in the industry, pay only when you get paid!</p>
    <div class="pricing-cards">
      <div class="pricing-card standard">
        <h3>Standard Plan</h3>
        <div class="plan-line"></div>
        <div class="plan-rate">2%*</div>
        <div class="plan-label">Razorpay platform fee</div>
        <div class="plan-desc">Get access to Flash Checkout, Dashboard, Reports &amp; much more</div>
        <p class="plan-note">*GST applicable. Instruments like Diners and Amex Cards, International Cards, EMI (Credit Card, Debit Card &amp; Cardless) &amp; Corporate (Business) Credit Cards will be charged at 3%</p>
        <div class="plan-fees">
          <div>
            <div class="fee-label">One-Time Setup Fee</div>
            <div class="fee-val">₹ 0.00</div>
            <div class="fee-note">No setup fee</div>
          </div>
          <div>
            <div class="fee-label">Annual Maintenance Fee</div>
            <div class="fee-val">₹ 0.00</div>
            <div class="fee-note">No maintenance fee</div>
          </div>
        </div>
        <button class="btn-get-started">GET STARTED</button>
      </div>
      <div class="pricing-card enterprise">
        <h3>Enterprise Plan</h3>
        <div class="plan-line"></div>
        <p>Large number of monthly payments on your platform? Sign up now to get started.</p>
        <a href="#" class="signup-link">Sign Up &rarr;</a>
        <hr />
        <p>Explore how you can drive more value for your business with Payment Aggregator with its smart features.</p>
      </div>
    </div>
  </section>

  <!-- FOOTER -->
  <!-- <footer class="footer">
    <div class="footer-inner">
      <div class="footer-logo">
        <svg width="20" height="20" viewBox="0 0 40 40" fill="none"><path d="M20 0L37 10V30L20 40L3 30V10L20 0Z" fill="#2563eb"/><path d="M14 12h8l4 8-4 8h-8l4-8-4-8z" fill="white"/></svg>
        <span class="logo-text">Razorpay</span>
      </div>
      <p>&copy; 2024 Razorpay Software Private Limited. All Rights Reserved.</p>
    </div>
  </footer> -->
  <footer class="footer">
  <div class="footer-container">

    <div class="footer-grid">
         <!-- NEW COLUMN: RAZORPAY DESCRIPTION -->
   <!-- COLUMN 1: ABOUT -->
      <div class="footer-col footer-about">
        <h2 class="logo">Razorpay</h2>

        <p>
          Razorpay is the only payments solution in India that allows businesses
          to accept, process and disburse payments with its product suite.
          It gives you access to all payment modes including credit card,
          debit card, netbanking, UPI and popular wallets.
        </p>

        <p>
          RazorpayX supercharges your business banking experience,
          bringing effectiveness, efficiency, and excellence to all financial processes.
        </p>

        <p class="disclaimer">
          Disclaimer: RazorpayX powered current account is provided by partner banks.
          Razorpay is not a bank and does not hold a banking license.
        </p>
      </div>
      <!-- COLUMN 1 -->
      <div class="footer-col">
        <h4>ACCEPT PAYMENTS</h4>
        <ul>
          <li>Payment Aggregator</li>
          <li>Payment Gateway</li>
          <li>Payment Pages</li>
          <li>Payment Links</li>
          <li>Razorpay POS <span class="new-badge">NEW</span></li>
          <li>QR Codes</li>
          <li>Subscriptions</li>
          <li>Smart Collect</li>
          <li>Optimizer</li>
          <li>Instant Settlements</li>
        </ul>

        <h4>PAYROLL</h4>
        <ul>
          <li>RazorpayX Payroll</li>
        </ul>

        <h4>BECOME A PARTNER</h4>
        <ul>
          <li>Refer and Earn</li>
          <li>Onboarding APIs</li>
        </ul>

        <h4>MORE</h4>
        <ul>
          <li>Route</li>
          <li>Invoices</li>
          <li>Freelancer Payments</li>
          <li>International Payments</li>
          <li>Flash Checkout</li>
          <li>UPI</li>
          <li>ePOS</li>
        </ul>
      </div>

      <!-- COLUMN 2 -->
      <div class="footer-col">
        <h4>BANKING PLUS</h4>
        <ul>
          <li>RazorpayX</li>
          <li>Source to pay</li>
          <li>Current Accounts</li>
          <li>Payouts</li>
          <li>Payout Links</li>
          <li>Corporate Credit Card</li>
        </ul>

        <h4>DEVELOPERS</h4>
        <ul>
          <li>Docs</li>
          <li>Integrations</li>
          <li>API Reference</li>
        </ul>
      </div>

      <!-- COLUMN 3 -->
      <div class="footer-col">
        <h4>RESOURCES</h4>
        <ul>
          <li>Blog</li>
          <li>Learn</li>
          <li>Customer Stories</li>
          <li>Events</li>
          <li>Chargeback Guide</li>
          <li>Settlement Guide</li>
        </ul>

        <h4>SOLUTIONS</h4>
        <ul>
          <li>Education</li>
          <li>E-commerce</li>
          <li>SaaS</li>
          <li>BFSI</li>
        </ul>
      </div>

      <!-- COLUMN 4 -->
      <div class="footer-col">
        <h4>COMPANY</h4>
        <ul>
          <li>About Us</li>
          <li>Careers</li>
          <li>Website Terms</li>
          <li>Terms of Use</li>
          <li>Privacy Policy</li>
          <li>Grievance Redressal</li>
          <li>Responsible Disclosure</li>
          <li>Partners</li>
          <li>White papers</li>
          <li>Corporate Information</li>
        </ul>

        <h4>HELP & SUPPORT</h4>
        <ul>
          <li>Support</li>
          <li>Knowledge base</li>
        </ul>

        <h4>FIND US ONLINE</h4>
        <div class="social-icons">
          <span>📘</span>
          <span>𝕏</span>
          <span>📸</span>
          <span>💼</span>
        </div>

        <h4>REGD. OFFICE ADDRESS</h4>
        <p class="address">
          Razorpay Software Limited,<br>
          Bengaluru, Karnataka, India
        </p>
      </div>

    </div>

    <div class="footer-bottom">
      <p>© Razorpay 2025 All Rights Reserved</p>
    </div>

  </div>
</footer>

  <script>
//===================== FAQ TOGGLE =====================
  function toggleFaq(el) {
    const answer = el.nextElementSibling;
    const isOpen = el.classList.contains('open');

    // Close all
    document.querySelectorAll('.faq-q').forEach(q => q.classList.remove('open'));
    document.querySelectorAll('.faq-a').forEach(a => a.classList.remove('visible'));

    // Open clicked if it was closed
    if (!isOpen) {
      el.classList.add('open');
      answer.classList.add('visible');
    }
  }

  // ===================== NAVBAR SCROLL SHADOW =====================
  window.addEventListener('scroll', () => {
    const nav = document.querySelector('.navbar');
    if (window.scrollY > 10) {
      nav.style.boxShadow = '0 2px 16px rgba(0,0,80,0.13)';
    } else {
      nav.style.boxShadow = '0 1px 6px rgba(0,0,0,0.08)';
    }
  });

  // ===================== BRAND LOGO TICKER =====================
  // Auto-scroll brand logos on hero section
  (function () {
    const brands = document.querySelector('.brand-logos');
    if (!brands) return;
    let pos = 0;
    // subtle pulse effect on brand logos
    brands.querySelectorAll('.brand').forEach((b, i) => {
      b.style.transition = 'opacity 0.4s';
      b.style.animationDelay = `${i * 0.2}s`;
    });
  })();

  // ===================== SMOOTH SCROLL FOR ANCHOR LINKS =====================
  document.querySelectorAll('a[href="#"]').forEach(link => {
    link.addEventListener('click', e => {
      e.preventDefault();
    });
  });

  // ===================== ANIMATE ON SCROLL =====================
  const observerOptions = {
    threshold: 0.12,
    rootMargin: '0px 0px -40px 0px'
  };

  const animatedEls = document.querySelectorAll(
    '.feature-item, .stat-card, .platform-box, .pricing-card, .faq-item, .dashboard-mockup, .offers-mockup'
  );

  animatedEls.forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(28px)';
    el.style.transition = 'opacity 0.55s ease, transform 0.55s ease';
  });

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, idx) => {
      if (entry.isIntersecting) {
        const el = entry.target;
        // Stagger if siblings in same parent
        const siblings = [...el.parentNode.children].filter(c =>
          c.style && c.style.opacity === '0'
        );
        const myIdx = siblings.indexOf(el);
        setTimeout(() => {
          el.style.opacity = '1';
          el.style.transform = 'translateY(0)';
        }, myIdx * 80);
        observer.unobserve(el);
      }
    });
  }, observerOptions);

  animatedEls.forEach(el => observer.observe(el));

  // ===================== HERO ILLUSTRATION FLOAT =====================
  const monitor = document.querySelector('.monitor');
  if (monitor) {
    let t = 0;
    function floatMonitor() {
      t += 0.018;
      const y = Math.sin(t) * 6;
      monitor.style.transform = `translateY(${y}px)`;
      requestAnimationFrame(floatMonitor);
    }
    floatMonitor();
  }

  // ===================== SIGN UP BUTTON RIPPLE =====================
  document.querySelectorAll('.btn-primary, .btn-get-started').forEach(btn => {
    btn.addEventListener('click', function (e) {
      const ripple = document.createElement('span');
      ripple.style.cssText = `
        position: absolute;
        border-radius: 50%;
        background: rgba(255,255,255,0.35);
        transform: scale(0);
        animation: ripple-anim 0.55s linear;
        pointer-events: none;
        width: 80px;
        height: 80px;
        left: ${e.offsetX - 40}px;
        top: ${e.offsetY - 40}px;
      `;
      this.style.position = 'relative';
      this.style.overflow = 'hidden';
      this.appendChild(ripple);
      setTimeout(() => ripple.remove(), 600);
    });
  });

  // Inject ripple keyframe
  const style = document.createElement('style');
  style.textContent = `
    @keyframes ripple-anim {
      to { transform: scale(4); opacity: 0; }
    }
  `;
  document.head.appendChild(style);

  // ===================== STAT COUNTER ANIMATION =====================
  function animateCounter(el, target, prefix = '', suffix = '') {
    const isFloat = target % 1 !== 0;
    const duration = 1400;
    const start = performance.now();

    function update(now) {
      const progress = Math.min((now - start) / duration, 1);
      const ease = 1 - Math.pow(1 - progress, 3);
      const current = ease * target;
      el.textContent = prefix + (isFloat ? current.toFixed(2) : Math.floor(current).toLocaleString('en-IN')) + suffix;
      if (progress < 1) requestAnimationFrame(update);
    }

    requestAnimationFrame(update);
  }

  const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const vals = entry.target.querySelectorAll('.stat-val');
        vals.forEach(v => {
          const txt = v.textContent.trim();
          if (txt === '₹73.42 L') animateCounter(v, 73.42, '₹', ' L');
          else if (txt === '15,760') animateCounter(v, 15760);
          else if (txt === '129') animateCounter(v, 129);
        });
        statsObserver.unobserve(entry.target);
      }
    });
  }, { threshold: 0.5 });

  const dbStats = document.querySelector('.db-stats');
  if (dbStats) statsObserver.observe(dbStats);

  </script>
</body>
</html>
