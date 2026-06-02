<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Razorpay – Best Payment Gateway in India</title>
  <style>
/* ===== VARIABLES ===== */
:root {
  --blue: #3395FF;
  --blue-dark: #1A6FD4;
  --green: #00C48C;
  --dark: #0D1117;
  --dark-navy: #0C1A2B;
  --mid-navy: #112240;
  --teal: #006D77;
  --teal-dark: #004E56;
  --text-dark: #1A1A2E;
  --text-body: #3D4852;
  --text-muted: #8795A1;
  --bg-light: #F0F4F8;
  --bg-white: #FFFFFF;
  --card-border: #E2E8F0;
  --radius: 12px;
  --shadow: 0 4px 24px rgba(0,0,0,0.08);
  --shadow-lg: 0 16px 48px rgba(0,0,0,0.14);
  font-family: 'DM Sans', sans-serif;
}

*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
html { scroll-behavior: smooth; }

body {
  color: var(--text-dark);
  background: var(--bg-white);
  line-height: 1.6;
  overflow-x: hidden;
}

a { text-decoration: none; color: inherit; }
img { max-width: 100%; }
ul { list-style: none; }

/* ===== BUTTONS ===== */
.btn-signup {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: var(--blue);
  color: #fff;
  padding: 10px 22px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 14px;
  transition: background 0.2s, transform 0.15s;
  border: none;
  cursor: pointer;
}
.btn-signup:hover { background: var(--blue-dark); transform: translateY(-1px); }

.btn-login {
  color: var(--text-dark);
  font-weight: 500;
  font-size: 14px;
  padding: 10px 18px;
  border: 1.5px solid #CBD5E0;
  border-radius: 6px;
  transition: border-color 0.2s;
}
.btn-login:hover { border-color: var(--blue); color: var(--blue); }

.btn-outline {
  display: inline-flex;
  align-items: center;
  background: #fff;
  color: var(--text-dark);
  padding: 10px 22px;
  border-radius: 6px;
  font-weight: 600;
  font-size: 14px;
  border: 1.5px solid #CBD5E0;
  transition: border-color 0.2s;
}
.btn-outline:hover { border-color: var(--blue); color: var(--blue); }

.btn-icon {
  background: none;
  border: none;
  cursor: pointer;
  color: var(--text-body);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 6px;
}

/* ===== NAVBAR ===== */
/* .navbar {
  position: sticky;
  top: 0;
  z-index: 100;
  background: rgba(255,255,255,0.97);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid #EEF2F7;
  box-shadow: 0 2px 8px rgba(0,0,0,0.04);
}
.nav-inner {
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 32px;
  height: 62px;
  display: flex;
  align-items: center;
  gap: 28px;
}
.nav-logo {
  display: flex;
  align-items: center;
  gap: 8px;
  font-weight: 700;
  font-size: 20px;
  color: var(--dark);
  flex-shrink: 0;
}
.logo-text { letter-spacing: -0.5px; }

.nav-links {
  display: flex;
  align-items: center;
  gap: 6px;
  flex: 1;
}
.nav-links a {
  font-size: 13.5px;
  font-weight: 500;
  color: var(--text-body);
  padding: 6px 10px;
  border-radius: 6px;
  transition: color 0.2s, background 0.2s;
}
.nav-links a:hover { color: var(--blue); background: rgba(51,149,255,0.06); }

.nav-actions {
  display: flex;
  align-items: center;
  gap: 10px;
  flex-shrink: 0;
}
.nav-flag {
  display: flex;
  align-items: center;
  gap: 4px;
  font-size: 13px;
  cursor: pointer;
  padding: 4px 8px;
  border: 1px solid #E2E8F0;
  border-radius: 6px;
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

/* ===== HERO ===== */
.hero {
  max-width: 1280px;
  margin: 0 auto;
  padding: 72px 32px 40px;
  display: flex;
  align-items: center;
  gap: 60px;
  min-height: 560px;
  position: relative;
}

.hero-content { flex: 0 0 520px; }

.hero-badge {
  color: var(--blue);
  font-weight: 600;
  font-size: 13.5px;
  margin-bottom: 16px;
  letter-spacing: 0.01em;
}
.hero-title {
  font-size: clamp(34px, 4vw, 46px);
  font-weight: 800;
  line-height: 1.18;
  color: var(--text-dark);
  margin-bottom: 20px;
  letter-spacing: -1px;
}
.hero-blue { color: var(--blue); }

.hero-desc {
  font-size: 15px;
  color: var(--text-body);
  line-height: 1.7;
  margin-bottom: 32px;
  max-width: 480px;
}
.hero-cta { display: flex; gap: 14px; align-items: center; }

/* Hero Visual */
.hero-visual {
  flex: 1;
  position: relative;
  min-height: 420px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.hero-bg-shape {
  position: absolute;
  right: -60px;
  top: -40px;
  width: 480px;
  height: 460px;
  background: linear-gradient(135deg, #3395FF 0%, #1a6fd4 60%, #0d4a9e 100%);
  clip-path: polygon(40% 0%, 100% 0%, 100% 100%, 10% 100%);
  border-radius: 4px;
  z-index: 0;
  opacity: 0.92;
}
.hero-img-wrap {
  position: relative;
  z-index: 1;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  width: 100%;
  height: 420px;
}
.hero-person-placeholder {
  width: 260px;
  height: 400px;
  background: linear-gradient(180deg, #c8d8f0 0%, #a8c0e8 100%);
  border-radius: 120px 120px 0 0;
  position: absolute;
  left: 50%;
  transform: translateX(-60%);
  bottom: 0;
  opacity: 0.25;
}

/* Payment Card */
.payment-card {
  position: absolute;
  right: 0;
  top: 40px;
  width: 240px;
  background: #fff;
  border-radius: 14px;
  box-shadow: var(--shadow-lg);
  overflow: hidden;
  animation: float 4s ease-in-out infinite;
}
@keyframes float {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-8px); }
}
.payment-card-header {
  background: #A8F0C6;
  color: var(--dark);
  font-weight: 700;
  font-size: 14px;
  padding: 12px 16px;
}
.payment-card-body { padding: 14px 16px; }

.product-row {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 12px;
}
.product-name { font-size: 12px; color: var(--text-muted); display: block; }
.product-price { font-size: 16px; font-weight: 700; color: var(--text-dark); }
.tshirt-icon { font-size: 28px; }

.method-label {
  font-size: 11px;
  font-weight: 600;
  color: var(--text-body);
  margin-bottom: 8px;
}
.method-group { margin-bottom: 6px; }
.method-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 6px 0;
  border-bottom: 1px solid #F0F4F8;
  font-size: 12px;
  color: var(--text-body);
}
.method-sub-row {
  display: flex;
  gap: 12px;
  padding: 4px 8px;
  font-size: 11px;
  color: var(--text-body);
}
.method-icon { font-size: 12px; font-weight: 600; }
.upi-icon { color: var(--blue); }
.dot { display: inline-block; width: 10px; height: 10px; border-radius: 50%; margin-right: 4px; }
.dot.pe { background: #6739B7; }
.dot.pt { background: #00BAF2; }
.dot.cu { background: #1C1C1C; }
.chevron { color: var(--text-muted); }

/* ===== MARQUEE ===== */
.marquee-wrap {
  background: var(--bg-white);
  border-top: 1px solid #EEF2F7;
  border-bottom: 1px solid #EEF2F7;
  overflow: hidden;
  padding: 16px 0;
}
.marquee-track {
  display: flex;
  gap: 48px;
  white-space: nowrap;
  animation: marquee 25s linear infinite;
}
.marquee-track span {
  font-size: 15px;
  font-weight: 700;
  color: #A0AEC0;
  letter-spacing: 0.02em;
  flex-shrink: 0;
}
@keyframes marquee {
  0% { transform: translateX(0); }
  100% { transform: translateX(-33.333%); }
}

/* ===== NO-CODE ===== */
.nocode-section {
  background: linear-gradient(135deg, var(--teal-dark) 0%, var(--teal) 100%);
  padding: 70px 32px;
}
.nocode-inner { max-width: 1000px; margin: 0 auto; }
.nocode-heading {
  color: #fff;
  font-size: clamp(26px, 3vw, 36px);
  font-weight: 700;
  text-align: center;
  margin-bottom: 40px;
  line-height: 1.3;
}
.green-text { color: var(--green); }

.nocode-cards {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}
.nocode-card {
  background: rgba(255,255,255,0.08);
  border: 1px solid rgba(255,255,255,0.15);
  border-radius: var(--radius);
  padding: 28px 24px;
  color: #fff;
  transition: background 0.2s, transform 0.2s;
}
.nocode-card:hover {
  background: rgba(255,255,255,0.14);
  transform: translateY(-4px);
}
.nc-label {
  font-size: 12px;
  font-weight: 600;
  color: rgba(255,255,255,0.65);
  margin-bottom: 10px;
  letter-spacing: 0.04em;
}
.nc-title {
  font-size: 16px;
  font-weight: 600;
  line-height: 1.5;
  margin-bottom: 20px;
}
.nc-link {
  font-size: 13px;
  font-weight: 600;
  color: var(--green);
  transition: opacity 0.2s;
}
.nc-link:hover { opacity: 0.8; }

/* ===== DASHBOARD ===== */
.dashboard-section {
  padding: 90px 32px;
  background: var(--bg-white);
}
.dashboard-inner {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  gap: 64px;
  align-items: flex-start;
}
.dashboard-text { flex: 0 0 320px; }
.dashboard-text h2 {
  font-size: clamp(26px, 3vw, 36px);
  font-weight: 700;
  line-height: 1.3;
  margin-bottom: 20px;
  color: var(--text-dark);
}
.blue-text { color: var(--blue); }
.dashboard-text p {
  font-size: 14px;
  color: var(--text-body);
  line-height: 1.7;
  margin-bottom: 28px;
}

/* Browser Preview */
.dashboard-preview {
  flex: 1;
  border-radius: 14px;
  overflow: hidden;
  box-shadow: var(--shadow-lg);
  border: 1px solid #E2E8F0;
}
.browser-bar {
  background: #F7FAFC;
  border-bottom: 1px solid #E2E8F0;
  padding: 10px 16px;
  display: flex;
  align-items: center;
  gap: 8px;
}
.browser-bar .dot { width: 10px; height: 10px; border-radius: 50%; }
.browser-bar .dot.red { background: #FC5F5A; }
.browser-bar .dot.yellow { background: #FDBC40; }
.browser-bar .dot.green { background: #34C749; }
.browser-url {
  flex: 1;
  background: #EEF2F7;
  border-radius: 6px;
  padding: 4px 12px;
  font-size: 11px;
  color: var(--text-muted);
  margin-left: 8px;
}
.dashboard-ui {
  display: flex;
  background: #fff;
  min-height: 320px;
}

/* Sidebar */
.dash-sidebar {
  width: 170px;
  border-right: 1px solid #EEF2F7;
  padding: 16px 0;
  background: #FAFBFD;
  flex-shrink: 0;
}
.dash-logo-sm {
  font-size: 12px;
  font-weight: 700;
  color: var(--blue);
  padding: 0 14px 14px;
  border-bottom: 1px solid #EEF2F7;
  margin-bottom: 8px;
}
.dash-menu li {
  padding: 7px 14px;
  font-size: 11.5px;
  color: var(--text-body);
  cursor: pointer;
  transition: background 0.15s, color 0.15s;
  border-radius: 0 20px 20px 0;
  margin-right: 8px;
}
.dash-menu li:hover { background: rgba(51,149,255,0.08); color: var(--blue); }
.dash-menu li.active { background: rgba(51,149,255,0.12); color: var(--blue); font-weight: 600; }
.dash-menu .section-title {
  font-size: 9px;
  letter-spacing: 0.08em;
  color: #A0AEC0;
  font-weight: 700;
  padding: 12px 14px 4px;
  cursor: default;
  background: none;
}
.dash-menu .section-title:hover { background: none; color: #A0AEC0; }

/* Main Panel */
.dash-main { flex: 1; padding: 16px 20px; }
.dash-tabs {
  display: flex;
  gap: 4px;
  margin-bottom: 16px;
  border-bottom: 1px solid #EEF2F7;
  padding-bottom: 12px;
}
.tab {
  font-size: 12px;
  padding: 5px 12px;
  border-radius: 20px;
  cursor: pointer;
  color: var(--text-body);
  font-weight: 500;
  transition: background 0.15s, color 0.15s;
}
.tab:hover { background: #F0F4F8; }
.tab.active { background: var(--blue); color: #fff; font-weight: 600; }

.dash-title { font-size: 14px; font-weight: 700; margin-bottom: 12px; color: var(--text-dark); }

.dash-stats { display: flex; gap: 12px; margin-bottom: 16px; }
.stat-card {
  flex: 1;
  background: #F9FBFD;
  border: 1px solid #EEF2F7;
  border-radius: 8px;
  padding: 10px 12px;
}
.stat-label { font-size: 10px; color: var(--text-muted); display: block; margin-bottom: 4px; }
.stat-val { font-size: 13px; font-weight: 700; color: var(--text-dark); display: block; }
.stat-val .up { font-size: 10px; color: #38A169; font-weight: 600; }
.stat-sub { font-size: 9.5px; color: var(--text-muted); display: block; margin-top: 3px; }

.dash-chart { border-radius: 8px; overflow: hidden; }
.chart-svg { width: 100%; height: 80px; display: block; }

/* ===== FEATURES ===== */
.features-section {
  background: var(--bg-light);
  padding: 90px 32px;
  text-align: center;
}
.features-title {
  font-size: clamp(28px, 3.5vw, 42px);
  font-weight: 800;
  margin-bottom: 14px;
  letter-spacing: -0.5px;
}
.features-sub {
  font-size: 15px;
  color: var(--text-body);
  margin-bottom: 56px;
  max-width: 560px;
  margin-left: auto;
  margin-right: auto;
}
.features-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 22px;
  max-width: 1100px;
  margin: 0 auto;
}
.feature-card {
  background: #fff;
  border-radius: var(--radius);
  padding: 36px 28px;
  text-align: center;
  box-shadow: 0 2px 12px rgba(0,0,0,0.05);
  transition: transform 0.25s, box-shadow 0.25s;
}
.feature-card:hover {
  transform: translateY(-6px);
  box-shadow: var(--shadow-lg);
}
.feat-icon {
  font-size: 26px;
  width: 52px;
  height: 52px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 12px;
  margin: 0 auto 20px;
}
.blue-icon { background: rgba(51,149,255,0.12); }
.feature-card h3 {
  font-size: 16px;
  font-weight: 700;
  margin-bottom: 12px;
  color: var(--text-dark);
}
.feature-card p {
  font-size: 13.5px;
  color: var(--text-body);
  line-height: 1.65;
}

/* ===== DEV SECTION ===== */
.dev-section {
  background: var(--dark-navy);
  color: #fff;
  padding-bottom: 80px;
}
.lang-ticker {
  background: rgba(255,255,255,0.05);
  overflow: hidden;
  padding: 12px 0;
  border-bottom: 1px solid rgba(255,255,255,0.08);
}
.ticker-track {
  display: flex;
  gap: 32px;
  white-space: nowrap;
  animation: marquee 20s linear infinite;
}
.ticker-track span {
  font-size: 11px;
  font-weight: 700;
  letter-spacing: 0.12em;
  color: rgba(255,255,255,0.5);
  flex-shrink: 0;
}
.dot-green { color: var(--green); font-size: 9px; }

.dev-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 70px 32px 0;
  display: flex;
  gap: 70px;
  align-items: flex-start;
}
.dev-text { flex: 0 0 440px; }
.dev-text h2 {
  font-size: clamp(28px, 3.5vw, 42px);
  font-weight: 800;
  line-height: 1.2;
  margin-bottom: 40px;
  letter-spacing: -0.5px;
}
.dev-links { display: flex; flex-direction: column; gap: 28px; margin-bottom: 40px; }
.dev-link-item { display: flex; gap: 14px; align-items: flex-start; }
.dev-link-icon { font-size: 18px; margin-top: 2px; flex-shrink: 0; }
.dev-link-title { font-size: 15px; font-weight: 700; margin-bottom: 4px; }
.dev-link-desc { font-size: 13px; color: rgba(255,255,255,0.55); line-height: 1.5; margin-bottom: 8px; }
.dev-docs-link { font-size: 13px; color: #fff; font-weight: 600; border-bottom: 1px solid rgba(255,255,255,0.3); padding-bottom: 1px; transition: border-color 0.2s; }
.dev-docs-link:hover { border-color: var(--green); color: var(--green); }

.try-it h3 {
  font-size: 28px;
  font-weight: 800;
  line-height: 1.3;
  color: #fff;
}
.try-it span { color: var(--green); }

/* Code Editor */
.code-editor {
  flex: 1;
  background: #0D1B2A;
  border-radius: 14px;
  overflow: hidden;
  border: 1px solid rgba(255,255,255,0.1);
  box-shadow: 0 24px 64px rgba(0,0,0,0.4);
}
.editor-bar {
  background: #112240;
  padding: 12px 18px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  border-bottom: 1px solid rgba(255,255,255,0.08);
}
.editor-tab {
  font-size: 13px;
  font-weight: 600;
  color: #fff;
  display: flex;
  align-items: center;
  gap: 10px;
}
.change-lang {
  font-size: 11px;
  color: rgba(255,255,255,0.4);
  font-weight: 400;
  cursor: pointer;
}
.editor-actions { display: flex; gap: 10px; align-items: center; }
.e-btn {
  width: 18px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;
  font-size: 12px;
  color: rgba(255,255,255,0.5);
  cursor: pointer;
}
.e-btn.red-dot { background: #FC5F5A; border-radius: 50%; width: 12px; height: 12px; }

.code-block {
  padding: 24px 20px;
  font-family: 'DM Mono', monospace;
  font-size: 12.5px;
  line-height: 1.9;
  color: #CDD9E5;
  overflow-x: auto;
  white-space: pre;
}
.line-num { color: rgba(255,255,255,0.2); user-select: none; margin-right: 16px; }
.kw { color: #79C0FF; }
.str { color: #A5D6FF; }
.key { color: #FFA657; }
.num { color: #79C0FF; }
.bool { color: #FF7B72; }

/* ===== INDUSTRIES ===== */
.industries-section {
  padding: 80px 32px 60px;
  background: #fff;
  text-align: center;
}
.ind-heading {
  font-size: clamp(26px, 3vw, 38px);
  font-weight: 800;
  margin-bottom: 40px;
  letter-spacing: -0.5px;
}
.ind-slider {
  max-width: 1000px;
  margin: 0 auto;
  position: relative;
  display: flex;
  align-items: center;
  gap: 16px;
}
.ind-cards-wrap {
  display: flex;
  gap: 16px;
  flex: 1;
  overflow: hidden;
}
.ind-card {
  flex: 0 0 220px;
  border-radius: 16px;
  overflow: hidden;
  position: relative;
  height: 300px;
  cursor: pointer;
  transition: flex 0.4s ease;
}
.ind-card.active { flex: 0 0 420px; }

.ind-card-img {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  position: absolute;
  top: 0; left: 0;
}
.fashion-bg { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.d2c-bg { background: linear-gradient(135deg, #f6d365 0%, #fda085 100%); }
.edu-bg { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }

.ind-card-label {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px;
  background: linear-gradient(to top, rgba(0,0,0,0.7), transparent);
  color: #fff;
  display: flex;
  align-items: flex-end;
  gap: 10px;
  font-weight: 600;
  font-size: 14px;
}
.ind-icon { font-size: 20px; }

.ind-card-detail {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 20px;
  background: #fff;
  border-radius: 12px 12px 0 0;
  box-shadow: 0 -4px 20px rgba(0,0,0,0.12);
}
.ind-detail-header {
  display: flex;
  align-items: center;
  gap: 10px;
  font-weight: 700;
  font-size: 15px;
  margin-bottom: 10px;
  color: var(--text-dark);
}
.ind-card-detail p {
  font-size: 13px;
  color: var(--text-body);
  margin-bottom: 12px;
  line-height: 1.5;
}
.ind-tags-row { display: flex; flex-wrap: wrap; gap: 8px; align-items: center; }
.ind-rec {
  font-size: 10px;
  font-weight: 600;
  color: var(--text-muted);
  letter-spacing: 0.04em;
}
.ind-tag {
  font-size: 11px;
  background: #EEF2F7;
  color: var(--text-body);
  padding: 3px 10px;
  border-radius: 20px;
  font-weight: 500;
}

.slider-btn {
  background: #fff;
  border: 1.5px solid #E2E8F0;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  font-size: 20px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--text-body);
  transition: border-color 0.2s, color 0.2s, box-shadow 0.2s;
  flex-shrink: 0;
  line-height: 1;
}
.slider-btn:hover {
  border-color: var(--blue);
  color: var(--blue);
  box-shadow: 0 2px 8px rgba(51,149,255,0.2);
}
.slider-btn.sm { width: 32px; height: 32px; font-size: 18px; }

/* ===== TESTIMONIALS ===== */
.testimonials-section {
  background: var(--bg-light);
  padding: 80px 32px;
}
.test-layout {
  max-width: 1100px;
  margin: 0 auto;
  display: flex;
  gap: 60px;
  align-items: flex-start;
}
.test-heading { flex: 0 0 240px; }
.test-heading h2 {
  font-size: clamp(26px, 3vw, 36px);
  font-weight: 800;
  line-height: 1.3;
  margin-bottom: 24px;
  letter-spacing: -0.5px;
}
.test-nav { display: flex; gap: 10px; }

.test-cards {
  flex: 1;
  display: flex;
  gap: 20px;
  overflow: hidden;
}
.test-card {
  flex: 0 0 calc(50% - 10px);
  background: #fff;
  border-radius: var(--radius);
  padding: 28px 24px;
  box-shadow: var(--shadow);
  transition: transform 0.25s, box-shadow 0.25s;
}
.test-card:hover { transform: translateY(-4px); box-shadow: var(--shadow-lg); }
.test-logo {
  font-size: 18px;
  font-weight: 900;
  color: var(--text-dark);
  margin-bottom: 16px;
  font-style: italic;
}
.test-card p {
  font-size: 13.5px;
  color: var(--text-body);
  line-height: 1.7;
  margin-bottom: 20px;
}
.test-author strong { display: block; font-size: 13px; color: var(--text-dark); margin-bottom: 2px; }
.test-author span { font-size: 12px; color: var(--text-muted); }

/* ===== FOOTER ===== */
.site-footer {
  background: var(--text-dark);
  color: rgba(255,255,255,0.7);
  padding: 60px 32px 0;
}
.footer-inner {
  max-width: 1200px;
  margin: 0 auto;
  display: flex;
  gap: 80px;
  padding-bottom: 48px;
  border-bottom: 1px solid rgba(255,255,255,0.08);
}
.footer-brand { flex: 0 0 260px; }
.footer-logo {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 20px;
  font-weight: 800;
  color: #fff;
  margin-bottom: 14px;
}
.footer-brand p { font-size: 13.5px; line-height: 1.6; }
.footer-links { display: flex; gap: 60px; flex: 1; }
.footer-col { display: flex; flex-direction: column; gap: 10px; }
.footer-col h4 { color: #fff; font-size: 14px; font-weight: 700; margin-bottom: 4px; }
.footer-col a { font-size: 13.5px; transition: color 0.2s; }
.footer-col a:hover { color: #fff; }
.footer-bottom {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px 0;
  font-size: 12.5px;
  color: rgba(255,255,255,0.4);
}

/* ===== RESPONSIVE ===== */
@media (max-width: 1024px) {
  .features-grid { grid-template-columns: repeat(2, 1fr); }
  .nocode-cards { grid-template-columns: repeat(2, 1fr); }
  .dashboard-inner { flex-direction: column; }
  .dev-inner { flex-direction: column; }
  .hero { flex-direction: column; padding-top: 48px; }
  .hero-content { flex: none; }
  .hero-visual { min-height: 300px; width: 100%; }
}

@media (max-width: 768px) {
  .nav-links { display: none; }
  .features-grid { grid-template-columns: 1fr; }
  .nocode-cards { grid-template-columns: 1fr; }
  .test-layout { flex-direction: column; }
  .test-cards { flex-direction: column; }
  .test-card { flex: none; }
  .footer-inner { flex-direction: column; gap: 40px; }
  .footer-links { flex-wrap: wrap; gap: 32px; }
  .hero-bg-shape { display: none; }
  .ind-card { flex: 0 0 200px; }
  .ind-card.active { flex: 0 0 280px; }
}

/* ===== ANIMATIONS ===== */
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(30px); }
  to { opacity: 1; transform: translateY(0); }
}
.hero-content { animation: fadeUp 0.7s ease both; }
.hero-visual { animation: fadeUp 0.7s 0.2s ease both; }
.nocode-card { animation: fadeUp 0.5s ease both; }
.nocode-card:nth-child(2) { animation-delay: 0.1s; }
.nocode-card:nth-child(3) { animation-delay: 0.2s; }
.feature-card { animation: fadeUp 0.5s ease both; }
.feature-card:nth-child(2) { animation-delay: 0.05s; }
.feature-card:nth-child(3) { animation-delay: 0.1s; }
.feature-card:nth-child(4) { animation-delay: 0.15s; }
.feature-card:nth-child(5) { animation-delay: 0.2s; }
.feature-card:nth-child(6) { animation-delay: 0.25s; }

</style>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=DM+Mono:wght@400;500&display=swap" rel="stylesheet" />
</head>
<body>

  <!-- ===== NAVBAR ===== -->
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

            <!-- Right Side Buttons -->
            <div class="nav-actions">
                <button class="btn-login">Login</button>
                <button class="btn-signup">Sign Up &rarr;</button>
            </div>

            <!-- Hamburger -->
            <div class="hamburger" id="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>

        </nav>
    </header>


  <!-- ===== HERO ===== -->
  <section class="hero">
    <div class="hero-content">
      <p class="hero-badge">| Best Payment Gateway in India</p>
      <h1 class="hero-title">Accept Payments<br>Online with Razorpay<br><span class="hero-blue">Payment Gateway</span></h1>
      <p class="hero-desc">Power your business with the most trusted <strong>online payment gateway in India</strong>, used by millions of businesses. With the easiest integration, highest success rates, and unmatched experience, Razorpay makes payments effortless for your customers.</p>
      <div class="hero-cta">
        <a href="#" class="btn-signup">Sign Up →</a>
        <a href="#" class="btn-outline">View Documentation</a>
      </div>
    </div>
    <div class="hero-visual">
      <div class="hero-bg-shape"></div>
      <div class="hero-img-wrap">
        <div class="hero-person-placeholder"></div>
        <div class="payment-card">
          <div class="payment-card-header">Payment Gateway</div>
          <div class="payment-card-body">
            <div class="product-row">
              <div class="product-info">
                <span class="product-name">Neon T-shirt</span>
                <span class="product-price">₹ 599</span>
              </div>
              <div class="product-img">
                <div class="tshirt-icon">👕</div>
              </div>
            </div>
            <p class="method-label">Select Payment Method</p>
            <div class="method-group">
              <div class="method-item">
                <span class="method-icon upi-icon">UPI</span>
                <svg class="chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
              </div>
              <div class="method-sub-row">
                <span class="sub-method"><span class="dot pe"></span> PhonePe</span>
                <span class="sub-method"><span class="dot pt"></span> PayTM</span>
              </div>
              <div class="method-sub-row">
                <span class="sub-method"><span class="dot cu"></span> CRED UPI</span>
                <span class="sub-method">••• Apps &amp; UPI ID</span>
              </div>
            </div>
            <div class="method-item">
              <span class="method-icon">💳 Cards</span>
              <svg class="chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
            </div>
            <div class="method-item">
              <span class="method-icon">🏦 Netbanking</span>
              <svg class="chevron" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="6 9 12 15 18 9"/></svg>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ===== LOGO MARQUEE ===== -->
  <div class="marquee-wrap">
    <div class="marquee-track">
      <span>ZOHO</span><span>Zomato</span><span>Aditya Birla Capital</span><span>Airtel</span><span>IRCTC</span><span>BookMyShow</span><span>Goibibo</span>
      <span>ZOHO</span><span>Zomato</span><span>Aditya Birla Capital</span><span>Airtel</span><span>IRCTC</span><span>BookMyShow</span><span>Goibibo</span>
      <span>ZOHO</span><span>Zomato</span><span>Aditya Birla Capital</span><span>Airtel</span><span>IRCTC</span><span>BookMyShow</span><span>Goibibo</span>
    </div>
  </div>

  <!-- ===== NO-CODE SECTION ===== -->
  <section class="nocode-section">
    <div class="nocode-inner">
      <h2 class="nocode-heading">Accept payments online with our<br><span class="green-text">No-Code solutions</span></h2>
      <div class="nocode-cards">
        <div class="nocode-card">
          <p class="nc-label">Payment Links</p>
          <p class="nc-title">Accept payments instantly: Share links via email, text, or social.</p>
          <a href="#" class="nc-link">Know More →</a>
        </div>
        <div class="nocode-card">
          <p class="nc-label">Payment Pages</p>
          <p class="nc-title">Accept payments without coding on a custom-branded store</p>
          <a href="#" class="nc-link">Know More →</a>
        </div>
        <div class="nocode-card">
          <p class="nc-label">Payment Buttons</p>
          <p class="nc-title">Effortlessly add a Pay Now button without any coding knowledge</p>
          <a href="#" class="nc-link">Know More →</a>
        </div>
      </div>
    </div>
  </section>

  <!-- ===== DASHBOARD SECTION ===== -->
  <section class="dashboard-section">
    <div class="dashboard-inner">
      <div class="dashboard-text">
        <h2>Your entire payment<br>universe, <span class="blue-text">in one dashboard</span></h2>
        <p>Access and manage your payments, refunds, transfers, subscriptions, invoices, customer identifiers, API keys, webhooks, and more with Razorpay's powerful all-in-one dashboard, designed to help you make your payment gateway work smarter.</p>
        <a href="#" class="btn-signup">Sign Up →</a>
      </div>
      <div class="dashboard-preview">
        <div class="browser-bar">
          <span class="dot red"></span><span class="dot yellow"></span><span class="dot green"></span>
          <div class="browser-url">https://dashboard.razorpay.com</div>
        </div>
        <div class="dashboard-ui">
          <div class="dash-sidebar">
            <div class="dash-logo-sm">⚡ Razorpay</div>
            <ul class="dash-menu">
              <li class="active">🏠 Home</li>
              <li>↔ Transactions</li>
              <li>💰 Settlements</li>
              <li>📊 Reports</li>
              <li class="section-title">PRODUCTS</li>
              <li>🔗 Payment Links</li>
              <li>✨ Magic Checkout</li>
              <li>📄 Payment Pages</li>
              <li class="section-title">RECURRING</li>
              <li>📑 Invoices</li>
              <li>💎 Affordability</li>
              <li>🔀 Route</li>
            </ul>
          </div>
          <div class="dash-main">
            <div class="dash-tabs">
              <span class="tab active">Payments</span>
              <span class="tab">Banking+</span>
              <span class="tab">Payroll</span>
              <span class="tab">More</span>
            </div>
            <h3 class="dash-title">Payments overview</h3>
            <div class="dash-stats">
              <div class="stat-card">
                <span class="stat-label">Collected amount ⓘ</span>
                <span class="stat-val">₹ 39,000.00 <span class="up">▲ +16%</span></span>
                <span class="stat-sub">₹5800 above than previous week</span>
              </div>
              <div class="stat-card">
                <span class="stat-label">Refunds ⓘ</span>
                <span class="stat-val">₹ 10,000.00 <span class="up">▲ +14%</span></span>
                <span class="stat-sub">₹5600 above than previous week</span>
              </div>
              <div class="stat-card">
                <span class="stat-label">Disputes ⓘ</span>
                <span class="stat-val">₹ 10,000.00 <span class="up">▲ +16%</span></span>
                <span class="stat-sub">₹5500 above than previous week</span>
              </div>
            </div>
            <div class="dash-chart">
              <svg viewBox="0 0 400 100" xmlns="http://www.w3.org/2000/svg" class="chart-svg">
                <defs>
                  <linearGradient id="chartGrad" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stop-color="#3395FF" stop-opacity="0.4"/>
                    <stop offset="100%" stop-color="#3395FF" stop-opacity="0.02"/>
                  </linearGradient>
                </defs>
                <path d="M0,80 C30,75 60,60 90,55 C120,50 150,65 180,50 C210,35 240,45 270,40 C300,35 330,25 360,20 L400,15 L400,100 L0,100 Z" fill="url(#chartGrad)"/>
                <path d="M0,80 C30,75 60,60 90,55 C120,50 150,65 180,50 C210,35 240,45 270,40 C300,35 330,25 360,20 L400,15" fill="none" stroke="#3395FF" stroke-width="2"/>
                <circle cx="200" cy="48" r="4" fill="#3395FF"/>
                <rect x="155" y="20" width="100" height="28" rx="4" fill="#1a2236"/>
                <text x="165" y="30" fill="#fff" font-size="7">Collected amount</text>
                <text x="165" y="42" fill="#3395FF" font-size="8" font-weight="bold">₹5652 · ₹4800</text>
              </svg>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ===== FEATURES ===== -->
  <section class="features-section">
    <h2 class="features-title"><span class="blue-text">Payments</span> that just work!</h2>
    <p class="features-sub">Our payment gateway is engineered with features that ensure every transaction goes through effortlessly.</p>
    <div class="features-grid">
      <div class="feature-card">
        <div class="feat-icon blue-icon">📈</div>
        <h3>India's Highest success rate</h3>
        <p>Intelligent payment infrastructure that delivers the unmatched success rates across all payment methods.</p>
      </div>
      <div class="feature-card">
        <div class="feat-icon blue-icon">💳</div>
        <h3>Largest Method Coverage</h3>
        <p>With support for 100+ payment methods, Razorpay remains the most versatile online payment gateway in India.</p>
      </div>
      <div class="feature-card">
        <div class="feat-icon blue-icon">🔧</div>
        <h3>Developer-friendly APIs</h3>
        <p>Clean, well-documented, &amp; developer-friendly APIs that let you integrate payments effortlessly across any platform.</p>
      </div>
      <div class="feature-card">
        <div class="feat-icon blue-icon">🛡️</div>
        <h3>Enterprise-grade Security</h3>
        <p>PCI DSS Level 1 compliance, continuous monitoring, and advanced encryption keep your transactions and customer data uncompromised.</p>
      </div>
      <div class="feature-card">
        <div class="feat-icon blue-icon">🏠</div>
        <h3>All-in-one Dashboard</h3>
        <p>Track payments, refunds, settlements, and analytics, all from a single, intuitive dashboard. Get real-time insights for smarter business decisions.</p>
      </div>
      <div class="feature-card">
        <div class="feat-icon blue-icon">📊</div>
        <h3>Conversion-Optimized Checkout</h3>
        <p>High-performance checkout built to minimize customer friction and optimize conversion success across every transaction.</p>
      </div>
    </div>
  </section>

  <!-- ===== DEV SECTION ===== -->
  <section class="dev-section">
    <div class="lang-ticker">
      <div class="ticker-track">
        <span>JAVA <span class="dot-green">●</span></span>
        <span>PYTHON <span class="dot-green">●</span></span>
        <span>PHP <span class="dot-green">●</span></span>
        <span>NODE.JS <span class="dot-green">●</span></span>
        <span>CURL <span class="dot-green">●</span></span>
        <span>JAVA <span class="dot-green">●</span></span>
        <span>PYTHON <span class="dot-green">●</span></span>
        <span>PHP <span class="dot-green">●</span></span>
        <span>NODE.JS <span class="dot-green">●</span></span>
        <span>CURL <span class="dot-green">●</span></span>
        <span>JAVA <span class="dot-green">●</span></span>
        <span>PYTHON <span class="dot-green">●</span></span>
        <span>PHP <span class="dot-green">●</span></span>
        <span>NODE.JS <span class="dot-green">●</span></span>
        <span>CURL <span class="dot-green">●</span></span>
      </div>
    </div>
    <div class="dev-inner">
      <div class="dev-text">
        <h2>Ready-to-Launch <span class="green-text">Payment<br>Gateway Stack</span></h2>
        <div class="dev-links">
          <div class="dev-link-item">
            <span class="dev-link-icon">⬡</span>
            <div>
              <p class="dev-link-title">Integration Stack</p>
              <p class="dev-link-desc">Find all popular platform SDKs, plugin, server integrations in our integration stack.</p>
              <a href="#" class="dev-docs-link">View Docs →</a>
            </div>
          </div>
          <div class="dev-link-item">
            <span class="dev-link-icon">🔗</span>
            <div>
              <p class="dev-link-title">API Reference</p>
              <p class="dev-link-desc">Comprehensive documentation to build powerful payment solutions.</p>
              <a href="#" class="dev-docs-link">View Docs →</a>
            </div>
          </div>
          <div class="dev-link-item">
            <span class="dev-link-icon">🪝</span>
            <div>
              <p class="dev-link-title">Webhooks</p>
              <p class="dev-link-desc">Receive real-time notifications for all payment related transactions and events.</p>
              <a href="#" class="dev-docs-link">View Docs →</a>
            </div>
          </div>
        </div>
        <div class="try-it">
          <h3>Try it out<br>for yourself <span>↘</span></h3>
        </div>
      </div>
      <div class="code-editor">
        <div class="editor-bar">
          <div class="editor-tab">Curl <span class="change-lang">change language ›</span></div>
          <div class="editor-actions">
            <span class="e-btn copy">⧉</span>
            <span class="e-btn red-dot"></span>
            <span class="e-btn expand">⤢</span>
          </div>
        </div>
        <pre class="code-block"><code><span class="line-num">1</span>  <span class="kw">curl</span> -X POST https://api.razorpay.com/v1/orders
<span class="line-num">2</span>  -u <span class="str">[YOUR_KEY_ID]:[YOUR_KEY_SECRET]</span>
<span class="line-num">3</span>  -H <span class="str">'content-type:application/json'</span>
<span class="line-num">4</span>  -d <span class="str">'{</span>
<span class="line-num">5</span>      <span class="key">"amount"</span>: <span class="num">500</span>,
<span class="line-num">6</span>      <span class="key">"currency"</span>: <span class="str">"INR"</span>,
<span class="line-num">7</span>      <span class="key">"receipt"</span>: <span class="str">"qwsaq1"</span>,
<span class="line-num">8</span>      <span class="key">"partial_payment"</span>: <span class="bool">true</span>,
<span class="line-num">9</span>      <span class="key">"first_payment_min_amount"</span>: <span class="num">230</span>
<span class="line-num">10</span> <span class="str">}'</span></code></pre>
      </div>
    </div>
  </section>

  <!-- ===== INDUSTRIES ===== -->
  <section class="industries-section">
    <h2 class="ind-heading">Engineered to power <span class="blue-text">every industry</span></h2>
    <div class="ind-slider" id="indSlider">
      <button class="slider-btn prev" id="indPrev">&#8249;</button>
      <div class="ind-cards-wrap" id="indCards">
        <div class="ind-card">
          <div class="ind-card-img fashion-bg"></div>
          <div class="ind-card-label">
            <span class="ind-icon">🔒</span>
            <span>Fashion and<br>Lifestyle</span>
          </div>
        </div>
        <div class="ind-card">
          <div class="ind-card-img d2c-bg"></div>
          <div class="ind-card-label">
            <span class="ind-icon">🖥</span>
            <span>D2C (Direct-to-<br>Consumer)</span>
          </div>
        </div>
        <div class="ind-card active">
          <div class="ind-card-img edu-bg"></div>
          <div class="ind-card-detail">
            <div class="ind-detail-header">
              <span class="ind-icon">🎓</span>
              <span>Education</span>
            </div>
            <p>Manage seamless fee collection with automated reminders &amp; easy online payment options.</p>
            <div class="ind-tags-row">
              <span class="ind-rec">Recommended</span>
              <span class="ind-tag">Payment Gateway</span>
              <span class="ind-tag">Payment Pages</span>
              <span class="ind-tag">Subscriptions</span>
            </div>
          </div>
        </div>
      </div>
      <button class="slider-btn next" id="indNext">&#8250;</button>
    </div>
  </section>

  <!-- ===== TESTIMONIALS ===== -->
  <section class="testimonials-section">
    <div class="test-layout">
      <div class="test-heading">
        <h2>Hear it from<br>those who've<br><span class="blue-text">built with us</span></h2>
        <div class="test-nav">
          <button class="slider-btn sm" id="testPrev">&#8249;</button>
          <button class="slider-btn sm" id="testNext">&#8250;</button>
        </div>
      </div>
      <div class="test-cards" id="testCards">
        <div class="test-card">
          <div class="test-logo">Tally</div>
          <p>At Tally, simplicity, flexibility, reliability, and speed are core to everything we do. With Razorpay's Core PG and Payment Links, we've enabled effortless multi-channel payments and backend ops across TallyPrime for faster, trusted service.</p>
          <div class="test-author">
            <strong>Tejas Goenka</strong>
            <span>Founder, Tally</span>
          </div>
        </div>
        <div class="test-card">
          <div class="test-logo">whole<br>The.Truth</div>
          <p>At The Whole Truth, Razorpay has been our preferred payments partner since day zero. Super fast, efficient and oh-so-good-looking – the Razorpay payment experience is top notch and it makes our life so much easier. Founder's bestie indeed!</p>
          <div class="test-author">
            <strong>Shashank Mehta</strong>
            <span>Founder, Whole Truth Foods</span>
          </div>
        </div>
        <div class="test-card">
          <div class="test-logo">BookMyShow</div>
          <p>Razorpay has been an instrumental partner in our payments journey. Their high success rates and seamless checkout experience have significantly improved our conversion metrics across all our platforms.</p>
          <div class="test-author">
            <strong>Rajesh Balpande</strong>
            <span>CTO, BookMyShow</span>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ===== FOOTER ===== -->
  <footer class="site-footer">
    <div class="footer-inner">
      <div class="footer-brand">
        <div class="footer-logo">
          <svg width="24" height="24" viewBox="0 0 28 28" fill="none"><path d="M14 0L28 14L14 28L0 14L14 0Z" fill="#3395FF"/><path d="M14 6L22 14L14 22L6 14L14 6Z" fill="#fff"/></svg>
          Razorpay
        </div>
        <p>Power your business with India's leading payment gateway.</p>
      </div>
      <div class="footer-links">
        <div class="footer-col">
          <h4>Products</h4>
          <a href="#">Payment Gateway</a>
          <a href="#">Payment Links</a>
          <a href="#">Payment Pages</a>
          <a href="#">Subscriptions</a>
        </div>
        <div class="footer-col">
          <h4>Resources</h4>
          <a href="#">Documentation</a>
          <a href="#">API Reference</a>
          <a href="#">Integration Stack</a>
          <a href="#">Blog</a>
        </div>
        <div class="footer-col">
          <h4>Company</h4>
          <a href="#">About Us</a>
          <a href="#">Careers</a>
          <a href="#">Press</a>
          <a href="#">Contact</a>
        </div>
      </div>
    </div>
    <div class="footer-bottom">
      <p>© 2024 Razorpay Software Private Limited. All Rights Reserved.</p>
    </div>
  </footer>

  <script>
/* ===== script.js ===== */

/* ---- Navbar Scroll Shadow ---- */
(function () {
  const navbar = document.querySelector('.navbar');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 10) {
      navbar.style.boxShadow = '0 4px 20px rgba(0,0,0,0.10)';
    } else {
      navbar.style.boxShadow = '0 2px 8px rgba(0,0,0,0.04)';
    }
  });
})();


/* ---- Industry Slider ---- */
(function () {
  const cards = document.querySelectorAll('.ind-card');
  const prevBtn = document.getElementById('indPrev');
  const nextBtn = document.getElementById('indNext');
  let active = 2; // default: third card (Education)

  function setActive(idx) {
    cards.forEach((c, i) => {
      c.classList.toggle('active', i === idx);
    });
    active = idx;
  }

  if (prevBtn && nextBtn) {
    prevBtn.addEventListener('click', () => {
      const next = (active - 1 + cards.length) % cards.length;
      setActive(next);
    });
    nextBtn.addEventListener('click', () => {
      const next = (active + 1) % cards.length;
      setActive(next);
    });
  }

  cards.forEach((c, i) => {
    c.addEventListener('click', () => setActive(i));
  });
})();


/* ---- Testimonials Slider ---- */
(function () {
  const track = document.getElementById('testCards');
  const prevBtn = document.getElementById('testPrev');
  const nextBtn = document.getElementById('testNext');
  if (!track || !prevBtn || !nextBtn) return;

  const cards = track.querySelectorAll('.test-card');
  const total = cards.length;
  let current = 0;

  function update() {
    // Show 2 cards at a time
    cards.forEach((c, i) => {
      const visible = (i === current || i === (current + 1) % total);
      c.style.display = visible ? 'block' : 'none';
    });
  }

  prevBtn.addEventListener('click', () => {
    current = (current - 1 + total) % total;
    update();
  });

  nextBtn.addEventListener('click', () => {
    current = (current + 1) % total;
    update();
  });

  update();
})();


/* ---- Scroll-triggered Fade-in ---- */
(function () {
  const targets = document.querySelectorAll(
    '.feature-card, .nocode-card, .test-card, .dev-link-item, .dashboard-preview'
  );

  // Only animate if IntersectionObserver is supported
  if (!('IntersectionObserver' in window)) return;

  // Start elements invisible
  targets.forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(28px)';
    el.style.transition = 'opacity 0.55s ease, transform 0.55s ease';
  });

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.style.opacity = '1';
          entry.target.style.transform = 'translateY(0)';
          observer.unobserve(entry.target);
        }
      });
    },
    { threshold: 0.12 }
  );

  targets.forEach(el => observer.observe(el));
})();


/* ---- Dashboard Tab Switcher ---- */
(function () {
  const tabs = document.querySelectorAll('.tab');
  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');
    });
  });
})();


/* ---- Code Editor Language Switcher ---- */
(function () {
  const changeLang = document.querySelector('.change-lang');
  if (!changeLang) return;

  const languages = ['Curl', 'Python', 'Node.js', 'PHP', 'Java'];
  const codeSnippets = {
    'Curl': `<span class="line-num">1</span>  <span class="kw">curl</span> -X POST https://api.razorpay.com/v1/orders
<span class="line-num">2</span>  -u <span class="str">[YOUR_KEY_ID]:[YOUR_KEY_SECRET]</span>
<span class="line-num">3</span>  -H <span class="str">'content-type:application/json'</span>
<span class="line-num">4</span>  -d <span class="str">'{</span>
<span class="line-num">5</span>      <span class="key">"amount"</span>: <span class="num">500</span>,
<span class="line-num">6</span>      <span class="key">"currency"</span>: <span class="str">"INR"</span>,
<span class="line-num">7</span>      <span class="key">"receipt"</span>: <span class="str">"qwsaq1"</span>,
<span class="line-num">8</span>      <span class="key">"partial_payment"</span>: <span class="bool">true</span>,
<span class="line-num">9</span>      <span class="key">"first_payment_min_amount"</span>: <span class="num">230</span>
<span class="line-num">10</span> <span class="str">}'</span>`,

    'Python': `<span class="line-num">1</span>  <span class="kw">import</span> razorpay
<span class="line-num">2</span>  
<span class="line-num">3</span>  client = razorpay.Client(
<span class="line-num">4</span>      auth=(<span class="str">"YOUR_KEY_ID"</span>, <span class="str">"YOUR_SECRET"</span>)
<span class="line-num">5</span>  )
<span class="line-num">6</span>  
<span class="line-num">7</span>  data = {
<span class="line-num">8</span>      <span class="key">"amount"</span>: <span class="num">500</span>,
<span class="line-num">9</span>      <span class="key">"currency"</span>: <span class="str">"INR"</span>,
<span class="line-num">10</span>     <span class="key">"receipt"</span>: <span class="str">"qwsaq1"</span>
<span class="line-num">11</span> }
<span class="line-num">12</span> client.order.create(data=data)`,

    'Node.js': `<span class="line-num">1</span>  <span class="kw">const</span> Razorpay = require(<span class="str">'razorpay'</span>);
<span class="line-num">2</span>  
<span class="line-num">3</span>  <span class="kw">const</span> instance = <span class="kw">new</span> Razorpay({
<span class="line-num">4</span>      key_id: <span class="str">'YOUR_KEY_ID'</span>,
<span class="line-num">5</span>      key_secret: <span class="str">'YOUR_SECRET'</span>
<span class="line-num">6</span>  });
<span class="line-num">7</span>  
<span class="line-num">8</span>  instance.orders.create({
<span class="line-num">9</span>      amount: <span class="num">500</span>,
<span class="line-num">10</span>     currency: <span class="str">'INR'</span>,
<span class="line-num">11</span>     receipt: <span class="str">'qwsaq1'</span>
<span class="line-num">12</span> });`,

    'PHP': `<span class="line-num">1</span>  <span class="kw">use</span> Razorpay\Api\Api;
<span class="line-num">2</span>  
<span class="line-num">3</span>  <span class="kw">$api</span> = <span class="kw">new</span> Api(
<span class="line-num">4</span>      <span class="str">'YOUR_KEY_ID'</span>, <span class="str">'YOUR_SECRET'</span>
<span class="line-num">5</span>  );
<span class="line-num">6</span>  
<span class="line-num">7</span>  <span class="kw">$api</span>->order->create([
<span class="line-num">8</span>      <span class="str">'amount'</span> => <span class="num">500</span>,
<span class="line-num">9</span>      <span class="str">'currency'</span> => <span class="str">'INR'</span>,
<span class="line-num">10</span>     <span class="str">'receipt'</span> => <span class="str">'qwsaq1'</span>
<span class="line-num">11</span> ]);`,

    'Java': `<span class="line-num">1</span>  <span class="kw">import</span> com.razorpay.*;
<span class="line-num">2</span>  
<span class="line-num">3</span>  RazorpayClient client = <span class="kw">new</span>
<span class="line-num">4</span>      RazorpayClient(<span class="str">"KEY_ID"</span>, <span class="str">"SECRET"</span>);
<span class="line-num">5</span>  
<span class="line-num">6</span>  JSONObject orderRequest = <span class="kw">new</span> JSONObject();
<span class="line-num">7</span>  orderRequest.put(<span class="str">"amount"</span>, <span class="num">500</span>);
<span class="line-num">8</span>  orderRequest.put(<span class="str">"currency"</span>, <span class="str">"INR"</span>);
<span class="line-num">9</span>  orderRequest.put(<span class="str">"receipt"</span>, <span class="str">"qwsaq1"</span>);
<span class="line-num">10</span> Order order = client.orders.create(orderRequest);`
  };

  let langIdx = 0;
  const tabEl = document.querySelector('.editor-tab');
  const codeEl = document.querySelector('.code-block code');

  changeLang.addEventListener('click', () => {
    langIdx = (langIdx + 1) % languages.length;
    const lang = languages[langIdx];
    if (tabEl) tabEl.innerHTML = `${lang} <span class="change-lang">change language ›</span>`;
    if (codeEl) codeEl.innerHTML = codeSnippets[lang] || codeSnippets['Curl'];

    // Re-attach listener
    const newChangeLang = document.querySelector('.change-lang');
    if (newChangeLang) {
      newChangeLang.addEventListener('click', arguments.callee);
    }
  });
})();


/* ---- Smooth hero entrance ---- */
(function () {
  document.addEventListener('DOMContentLoaded', () => {
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.4s ease';
    requestAnimationFrame(() => {
      requestAnimationFrame(() => {
        document.body.style.opacity = '1';
      });
    });
  });
})();

</script>
</body>
</html>
    