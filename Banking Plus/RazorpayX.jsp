<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RazorpayX - The all-in-one business banking suite</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  :root {
    --blue: #3395FF;
    --blue-dark: #2563EB;
    --navy: #1a1a2e;
    --teal: #00B2A9;
    --green: #22C55E;
    --bg: #f0f4ff;
    --white: #ffffff;
    --text: #1a1a2e;
    --muted: #6b7280;
    --border: #e5e7eb;
    --card-bg: #fff;
  }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--white);
    color: var(--text);
    overflow-x: hidden;
  }

  /* ===========================
     NAVBAR
  =========================== */
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
    list-style: none;
    padding: 0;
    margin: 0;
  }

  /* FIX: Remove default underline from all nav anchors */
  .nav-links a,
  .nav-links a:visited,
  .nav-links a:hover,
  .nav-links a:active {
    text-decoration: none;
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
    text-decoration: none; /* belt-and-suspenders */
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
    position: absolute;
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
    from { opacity: 0; transform: translateY(-6px); }
    to   { opacity: 1; transform: translateY(0); }
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

  /* FIX: Remove underline from dropdown links too */
  .simple-link {
    display: block;
    padding: 12px 28px;
    font-size: 15px;
    font-weight: 400;
    color: #374151;
    transition: color 0.15s, background 0.15s;
    text-decoration: none;
  }

  .simple-link:hover {
    color: #2563eb;
    background: #f8faff;
    text-decoration: none;
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

  .mega-col:first-child { padding-left: 32px; }
  .mega-col:last-child  { border-right: none; padding-right: 32px; }

  .col-heading {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.8px;
    color: #9ca3af;
    text-transform: uppercase;
    margin-bottom: 14px;
  }

  /* FIX: Remove underline from mega menu links */
  .mega-item {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    padding: 9px 8px;
    border-radius: 8px;
    margin-bottom: 2px;
    transition: background 0.15s;
    cursor: pointer;
    text-decoration: none;
  }

  .mega-item:hover {
    background: #f4f8ff;
    text-decoration: none;
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

  .mega-icon-x { font-size: 15px; font-weight: 900; }

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
    text-decoration: none;
    display: inline-flex;
    align-items: center;
  }

  .btn-login:hover {
    background: #2563eb;
    color: white;
    text-decoration: none;
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
    text-decoration: none;
    display: inline-flex;
    align-items: center;
  }

  .btn-signup:hover {
    background: #1d4ed8;
    text-decoration: none;
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

  /* HERO */
  .hero {
    background: linear-gradient(160deg, #eef3ff 0%, #f5f8ff 50%, #e8f0ff 100%);
    padding: 60px 40px 0;
    display: flex; flex-direction: column; align-items: center;
    text-align: center;
    overflow: hidden;
    position: relative;
  }
  .hero::before {
    content: '';
    position: absolute; top: 0; left: 0; right: 0; bottom: 0;
    background: radial-gradient(ellipse at 20% 40%, rgba(51,149,255,0.08) 0%, transparent 60%),
                radial-gradient(ellipse at 80% 20%, rgba(51,149,255,0.05) 0%, transparent 50%);
  }
  .hero-logo { font-size: 13px; color: var(--blue); font-weight: 700; display: flex; align-items: center; gap: 5px; margin-bottom: 20px; position: relative; }
  .hero h1 { font-size: clamp(36px, 5vw, 52px); font-weight: 700; line-height: 1.15; margin-bottom: 18px; position: relative; }
  .hero h1 span { color: var(--blue); }
  .hero-sub { font-size: 16px; color: var(--muted); line-height: 1.6; max-width: 480px; margin-bottom: 32px; position: relative; }
  .btn-hero { background: var(--blue); color: #fff; border: none; padding: 13px 32px; border-radius: 8px; font-size: 16px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; position: relative; }
  .btn-hero:hover { background: var(--blue-dark); }

  /* HERO DASHBOARD MOCKUP */
  .hero-visual {
    margin-top: 50px;
    position: relative;
    width: 100%; max-width: 1100px;
    height: 380px;
    display: flex; align-items: flex-end; justify-content: center;
  }
  .hero-dashboard {
    background: #fff;
    border-radius: 12px 12px 0 0;
    box-shadow: 0 -4px 40px rgba(51,149,255,0.12);
    width: 55%; max-width: 600px;
    overflow: hidden;
    border: 1px solid #e5e7eb;
    border-bottom: none;
    position: relative; z-index: 2;
  }
  .db-header {
    background: #f8faff;
    padding: 10px 16px;
    border-bottom: 1px solid #e5e7eb;
    display: flex; align-items: center; gap: 8px;
    font-size: 12px; color: var(--blue); font-weight: 700;
  }
  .db-body { display: flex; }
  .db-sidebar {
    width: 140px; padding: 12px 0;
    border-right: 1px solid #f0f0f0;
    font-size: 11px;
  }
  .db-sidebar-item {
    padding: 8px 14px; display: flex; align-items: center; gap: 8px;
    color: #6b7280; cursor: pointer;
  }
  .db-sidebar-item.active { background: #eef3ff; color: var(--blue); border-right: 2px solid var(--blue); font-weight: 600; }
  .db-sidebar-item svg { width: 13px; height: 13px; flex-shrink: 0; }
  .db-content { flex: 1; padding: 14px; }
  .db-welcome { font-size: 12px; font-weight: 600; color: #1a1a2e; margin-bottom: 4px; }
  .db-amount { font-size: 14px; font-weight: 700; color: #1a1a2e; margin-bottom: 8px; }
  .db-tag { font-size: 10px; color: var(--muted); margin-bottom: 10px; }

  .mini-chart { display: flex; align-items: flex-end; gap: 3px; height: 50px; }
  .mini-bar { background: linear-gradient(to top, #22C55E, #4ade80); border-radius: 2px 2px 0 0; width: 10px; }

  /* Floating cards */
  .float-card {
    position: absolute;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 24px rgba(0,0,0,0.10);
    padding: 10px 14px;
    font-size: 12px;
    white-space: nowrap;
  }
  .fc-banking { top: 60px; left: 6%; background: var(--blue); color: #fff; font-weight: 600; padding: 10px 16px; }
  .fc-vendor { top: 80px; right: 8%; background: #fff; border: 1px solid #e5e7eb; font-weight: 600; }
  .fc-upload { top: 30px; right: 12%; background: #fff; border: 1px solid #e5e7eb; color: var(--blue); }
  .fc-corporate {
    top: 20px; right: 2%;
    background: linear-gradient(135deg, #a8c4f0 0%, #c5d8f8 100%);
    border-radius: 10px; padding: 12px 16px; min-width: 160px;
    box-shadow: 0 8px 24px rgba(51,149,255,0.2);
  }
  .fc-payroll {
    bottom: 60px; right: 2%;
    background: #fff; border: 1px solid #e5e7eb;
    min-width: 180px;
  }
  .pr-label { font-size: 10px; color: var(--muted); }
  .pr-month { display: flex; justify-content: space-between; align-items: center; }
  .pr-month-val { font-size: 11px; font-weight: 600; color: var(--blue); }
  .pr-amount { font-size: 16px; font-weight: 700; color: #1a1a2e; margin: 4px 0; }
  .pr-finalised { font-size: 11px; font-weight: 600; color: var(--green); }
  .btn-make-payout { background: var(--blue); color: #fff; border: none; border-radius: 5px; padding: 6px 12px; font-size: 11px; font-weight: 600; cursor: pointer; margin-top: 8px; width: 100%; }

  /* TICKER / LOGO STRIP */
  .logo-strip {
    background: #fff;
    padding: 16px 0;
    overflow: hidden;
    border-bottom: 1px solid #f3f4f6;
  }
  .ticker-track {
    display: flex; gap: 40px; align-items: center;
    animation: ticker 20s linear infinite;
    white-space: nowrap;
    width: max-content;
  }
  @keyframes ticker { from { transform: translateX(0); } to { transform: translateX(-50%); } }
  .ticker-logo { font-size: 14px; font-weight: 700; color: #374151; opacity: 0.6; }
  .ticker-logo.flip { color: #F59E0B; }
  .ticker-logo.matrix { color: #374151; }
  .ticker-logo.credit { letter-spacing: 1px; }

  /* SECTION HEADERS */
  .section { padding: 80px 40px; }
  .section-center { text-align: center; }
  .section-tag { font-size: 11px; text-transform: uppercase; letter-spacing: 2px; font-weight: 700; color: var(--blue); margin-bottom: 10px; }
  .section-h2 { font-size: clamp(26px, 3.5vw, 36px); font-weight: 700; line-height: 1.2; margin-bottom: 16px; }
  .section-h2 span { color: var(--blue); }
  .section-sub { font-size: 16px; color: var(--muted); max-width: 560px; margin: 0 auto; line-height: 1.6; }

  /* PRODUCT TABS SECTION */
  .products-section { background: #f9fbff; padding: 60px 40px; }
  .tab-bar {
    display: flex; gap: 0; border-bottom: 2px solid #e5e7eb;
    max-width: 900px; margin: 0 auto 48px;
    overflow-x: auto;
  }
  .tab-btn {
    padding: 12px 24px; font-size: 14px; font-weight: 500; color: var(--muted);
    border: none; background: none; cursor: pointer; border-bottom: 2px solid transparent;
    margin-bottom: -2px; white-space: nowrap;
    transition: color 0.2s, border-color 0.2s;
  }
  .tab-btn.active { color: var(--blue); border-bottom-color: var(--blue); font-weight: 600; }
  .tab-btn:hover { color: var(--blue); }

  .product-panels { max-width: 900px; margin: 0 auto; }
  .product-panel { display: none; }
  .product-panel.active { display: flex; align-items: center; gap: 60px; }
  .panel-visual {
    flex: 1; min-width: 0;
    background: linear-gradient(135deg, #e8f0fe 0%, #dbeafe 100%);
    border-radius: 16px; padding: 40px 30px;
    display: flex; align-items: center; justify-content: center;
    min-height: 320px;
  }
  .panel-info { flex: 1; min-width: 0; }
  .panel-tag { font-size: 10px; text-transform: uppercase; letter-spacing: 2px; color: var(--muted); font-weight: 700; margin-bottom: 10px; }
  .panel-h3 { font-size: 28px; font-weight: 700; margin-bottom: 12px; }
  .panel-desc { font-size: 15px; color: var(--muted); line-height: 1.6; margin-bottom: 20px; }
  .panel-features { list-style: none; display: flex; flex-direction: column; gap: 10px; margin-bottom: 28px; }
  .panel-features li { display: flex; align-items: flex-start; gap: 10px; font-size: 14px; color: #374151; }
  .panel-features li::before { content: ''; width: 18px; height: 18px; background: var(--teal); border-radius: 50%; flex-shrink: 0; display: flex; align-items: center; justify-content: center; background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 12 12' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M2 6l3 3 5-5' stroke='white' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E"); background-size: 12px; background-repeat: no-repeat; background-position: center; margin-top: 2px; }
  .panel-btns { display: flex; gap: 14px; }
  .btn-primary { background: var(--blue); color: #fff; border: none; padding: 11px 24px; border-radius: 7px; font-size: 14px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 6px; }
  .btn-secondary { background: none; border: none; color: var(--blue); font-size: 14px; font-weight: 600; cursor: pointer; }

  /* Phone mockup */
  .phone-mockup {
    width: 140px; height: 240px;
    background: #fff;
    border-radius: 20px;
    border: 3px solid #34d399;
    box-shadow: 0 8px 32px rgba(52,211,153,0.2);
    padding: 20px 12px;
    font-size: 11px;
  }
  .phone-item { padding: 8px; background: #f0fdf4; border-radius: 6px; color: #065f46; font-weight: 600; margin-bottom: 8px; }

  /* API payout card */
  .api-success-card {
    background: var(--green);
    border-radius: 14px;
    padding: 24px 28px;
    text-align: center;
    color: #fff;
    width: 220px;
  }
  .api-check { width: 48px; height: 48px; background: rgba(255,255,255,0.3); border-radius: 50%; margin: 0 auto 12px; display: flex; align-items: center; justify-content: center; }
  .api-success-title { font-size: 14px; font-weight: 700; }
  .api-success-date { font-size: 11px; opacity: 0.8; margin-top: 4px; }

  /* Escrow card */
  .escrow-card {
    background: #fff; border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.08);
    padding: 16px; width: 200px; position: relative;
  }
  .escrow-badge { background: var(--green); color: #fff; font-size: 11px; font-weight: 700; padding: 4px 10px; border-radius: 6px; display: inline-block; margin-bottom: 8px; }
  .escrow-label { font-size: 11px; color: var(--muted); }
  .approval-tag { background: #f0fdf4; border: 1px solid #bbf7d0; color: var(--green); font-size: 10px; font-weight: 600; padding: 4px 8px; border-radius: 6px; position: absolute; top: -12px; right: -10px; }

  /* INNOVATIONS SECTION */
  .innovations { background: #fff; padding: 60px 40px; }
  .inno-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; max-width: 900px; margin: 40px auto 0; }
  .inno-card {
    border-radius: 14px; padding: 30px;
    position: relative; overflow: hidden; min-height: 200px;
    display: flex; flex-direction: column; justify-content: flex-end;
  }
  .inno-card.dark1 { background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); color: #fff; }
  .inno-card.dark2 { background: linear-gradient(135deg, #064e3b 0%, #065f46 100%); color: #fff; }
  .inno-badge {
    position: absolute; top: 20px; right: 20px;
    background: var(--blue); color: #fff; font-size: 11px; font-weight: 600;
    padding: 6px 12px; border-radius: 20px;
  }
  .inno-icon { font-size: 20px; margin-bottom: 10px; opacity: 0.6; }
  .inno-h3 { font-size: 20px; font-weight: 700; margin-bottom: 8px; }
  .inno-desc { font-size: 13px; opacity: 0.8; line-height: 1.5; margin-bottom: 14px; }
  .btn-know { background: none; border: 1px solid rgba(255,255,255,0.4); color: #fff; font-size: 12px; padding: 6px 14px; border-radius: 6px; cursor: pointer; display: inline-block; }
  .btn-know:hover { background: rgba(255,255,255,0.1); }
  .lsp-tag { background: rgba(255,255,255,0.15); color: #fff; font-size: 10px; padding: 3px 8px; border-radius: 4px; }

  /* INTEGRATIONS */
  .integrations { background: #f9fbff; padding: 60px 40px; text-align: center; }
  .integrations h2 { font-size: 28px; font-weight: 700; margin-bottom: 8px; }
  .integrations h2 span { color: var(--blue); }
  .int-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; max-width: 820px; margin: 40px auto 0; }
  .int-logo {
    background: #fff; border: 1px solid #e5e7eb; border-radius: 10px;
    padding: 16px 12px; display: flex; align-items: center; justify-content: center;
    font-size: 13px; font-weight: 700; color: #374151; gap: 6px;
    transition: box-shadow 0.2s;
  }
  .int-logo:hover { box-shadow: 0 4px 16px rgba(51,149,255,0.12); }
  .int-logo .dot { width: 8px; height: 8px; border-radius: 50%; }

  /* STATS SECTION */
  .stats-section {
    background: linear-gradient(135deg, #0f2744 0%, #1e3a5f 100%);
    padding: 60px 40px; text-align: center; color: #fff;
  }
  .stats-h2 { font-size: 28px; font-weight: 700; margin-bottom: 40px; }
  .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; max-width: 900px; margin: 0 auto; }
  .stat-card { background: rgba(255,255,255,0.08); border-radius: 12px; padding: 24px 16px; }
  .stat-val { font-size: 24px; font-weight: 700; color: #fff; margin-bottom: 6px; }
  .stat-desc { font-size: 12px; color: rgba(255,255,255,0.6); line-height: 1.4; }

  /* INSIGHTS */
  .insights { background: #fff; padding: 60px 40px; text-align: center; }
  .insights h2 { font-size: 26px; font-weight: 700; margin-bottom: 32px; }
  .insights h2 span { color: var(--blue); }
  .insights-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; max-width: 900px; margin: 0 auto; }
  .insight-card {
    background: #f8faff; border-radius: 12px; overflow: hidden;
    text-align: left; border: 1px solid #e5e7eb;
  }
  .insight-img { height: 120px; display: flex; align-items: center; justify-content: center; font-size: 28px; }
  .insight-body { padding: 14px; }
  .insight-title { font-size: 13px; font-weight: 600; margin-bottom: 6px; line-height: 1.4; }
  .insight-link { font-size: 12px; color: var(--blue); font-weight: 600; cursor: pointer; }

  /* PARTNERS */
  .partners { background: #f9fbff; padding: 60px 40px; text-align: center; }
  .partner-tag { font-size: 11px; text-transform: uppercase; letter-spacing: 2px; color: var(--blue); font-weight: 700; margin-bottom: 10px; }
  .partners h2 { font-size: 28px; font-weight: 700; margin-bottom: 40px; }
  .partners h2 span { color: var(--blue); }
  .partner-benefits { display: grid; grid-template-columns: repeat(4, 1fr); gap: 24px; max-width: 900px; margin: 0 auto 48px; text-align: left; }
  .pb-icon { font-size: 22px; margin-bottom: 10px; }
  .pb-title { font-size: 14px; font-weight: 700; margin-bottom: 6px; }
  .pb-desc { font-size: 13px; color: var(--muted); line-height: 1.5; }
  .partner-cards { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; max-width: 900px; margin: 0 auto; }
  .pc { background: #fff; border-radius: 12px; overflow: hidden; border: 1px solid #e5e7eb; }
  .pc-img { height: 130px; display: flex; align-items: center; justify-content: center; font-size: 36px; }
  .pc-img.ac { background: linear-gradient(135deg, #dbeafe 0%, #e0f2fe 100%); }
  .pc-img.rf { background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%); }
  .pc-img.cn { background: linear-gradient(135deg, #fefce8 0%, #fef9c3 100%); }
  .pc-img.tp { background: linear-gradient(135deg, #f5f3ff 0%, #ede9fe 100%); }
  .pc-body { padding: 14px; }
  .pc-title { font-size: 13px; font-weight: 700; margin-bottom: 4px; }
  .pc-desc { font-size: 12px; color: var(--muted); }

  /* ===========================
     FOOTER — FIXED
  =========================== */
  .footer {
    background: #f5f7fa;
    padding: 60px 40px;
    font-family: 'DM Sans', sans-serif;
  }

  .footer-container {
    max-width: 1200px;
    margin: auto;
  }

  .footer-grid {
    display: grid;
    grid-template-columns: 2fr repeat(4, 1fr);
    gap: 50px;
  }

  /* FIX: Renamed from .logo to .footer-logo-name to avoid nav conflict */
  .footer-about {
    color: #6b7280;
    font-size: 14px;
    line-height: 1.6;
  }

  .footer-about p {
    margin-bottom: 15px;
  }

  .footer-brand-name {
    font-size: 22px;
    font-weight: bold;
    color: #111827;
    margin-bottom: 15px;
    display: block;
  }

  .footer-disclaimer {
    font-size: 12px;
    color: #9ca3af;
  }

  .footer-col h4 {
    font-size: 12px;
    font-weight: 700;
    color: #6b7280;
    margin: 20px 0 10px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  .footer-col h4:first-child {
    margin-top: 0;
  }

  .footer-col ul {
    list-style: none;
    padding: 0;
    margin: 0;
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

  .new-badge {
    background: #d1fae5;
    color: #065f46;
    font-size: 10px;
    padding: 2px 6px;
    border-radius: 10px;
    margin-left: 6px;
  }

  .social-icons {
    display: flex;
    gap: 10px;
    margin: 10px 0;
  }

  .social-icons span {
    font-size: 18px;
    cursor: pointer;
  }

  .footer-address {
    font-size: 13px;
    color: #6b7280;
    line-height: 1.5;
  }

  .footer-bottom {
    margin-top: 40px;
    padding-top: 20px;
    border-top: 1px solid #e5e7eb;
    font-size: 13px;
    color: #6b7280;
    text-align: center;
  }

  /* SCROLL ANIMATION */
  .fade-in { opacity: 0; transform: translateY(24px); transition: opacity 0.6s ease, transform 0.6s ease; }
  .fade-in.visible { opacity: 1; transform: none; }

  /* RESPONSIVE */
  @media (max-width: 1024px) {
    .footer-grid { grid-template-columns: repeat(2, 1fr); }
  }
  @media (max-width: 768px) {
    .product-panel.active { flex-direction: column; }
    .stats-grid, .partner-benefits, .partner-cards, .int-grid, .insights-grid { grid-template-columns: 1fr 1fr; }
    .inno-grid { grid-template-columns: 1fr; }
    .hero-visual { height: 240px; }
    .hero-dashboard { width: 80%; }
    .footer-grid { grid-template-columns: 1fr; }
  }
</style>
</head>
<body>

<!-- ==================== NAVBAR ==================== -->
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
      <a href="login.html" target="_blank" class="btn-login">Log In</a>
      <a href="signup.html" target="_blank" class="btn-signup">Sign Up</a>

      <div class="hamburger" id="hamburger">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>

  </nav>
</header>

<!-- HERO -->
<section class="hero">
  <div class="hero-logo">
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none"><path d="M4 4h7l9 16H13L4 4z" fill="#3395FF"/></svg>
    RazorpayX
  </div>
  <h1>The <span>all-in-one</span><br>business banking suite</h1>
  <p class="hero-sub">Get Business Banking, Corporate Cards, Payroll, Vendor Payments, and API solutions trusted by 70% of India's Unicorns</p>
  <button class="btn-hero">Sign Up →</button>

  <div class="hero-visual">
    <div class="float-card fc-banking">🏦 Business Banking+</div>
    <div class="float-card fc-upload">⬆ Upload Invoice</div>
    <div class="float-card fc-vendor">💳 Vendor Payments</div>

    <div class="float-card fc-corporate">
      <div style="font-size:9px;color:rgba(30,60,114,0.7);margin-bottom:2px;">RazorpayX</div>
      <div style="font-size:10px;color:#374151;margin-bottom:6px;">Utkarsh Ranjan<br><span style="color:#6b7280;font-size:9px;">Owner</span></div>
      <div style="background:#1a1a2e;color:#fff;font-size:12px;font-weight:700;padding:5px 12px;border-radius:5px;">Corporate Card</div>
    </div>

    <div class="float-card fc-payroll">
      <div class="pr-label">Payroll Month</div>
      <div class="pr-month">
        <span class="pr-month-val">April 2024</span>
        <span style="font-size:10px;color:#6b7280;">▾</span>
      </div>
      <div style="font-size:10px;color:#6b7280;margin-top:4px;">Amount</div>
      <div class="pr-amount">₹23,50,000</div>
      <div class="pr-finalised">Your payroll has been finalised.</div>
      <button class="btn-make-payout">Make Payouts</button>
    </div>

    <!-- Main dashboard card -->
    <div class="hero-dashboard">
      <div class="db-header">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none"><path d="M4 4h7l9 16H13L4 4z" fill="#3395FF"/></svg>
        RazorpayX
      </div>
      <div class="db-body">
        <div class="db-sidebar">
          <div class="db-sidebar-item">
            <svg viewBox="0 0 16 16" fill="none"><rect x="2" y="2" width="5" height="5" rx="1" fill="currentColor" opacity="0.5"/><rect x="9" y="2" width="5" height="5" rx="1" fill="currentColor" opacity="0.5"/><rect x="2" y="9" width="5" height="5" rx="1" fill="currentColor" opacity="0.5"/><rect x="9" y="9" width="5" height="5" rx="1" fill="currentColor" opacity="0.5"/></svg>
            Dashboard
          </div>
          <div class="db-sidebar-item">
            <svg viewBox="0 0 16 16" fill="none"><rect x="2" y="4" width="12" height="8" rx="2" stroke="currentColor" stroke-width="1.5"/></svg>
            Business Banking+
          </div>
          <div class="db-sidebar-item active">
            <svg viewBox="0 0 16 16" fill="none"><path d="M2 14L14 2M14 2H8M14 2v6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
            API Payouts
          </div>
          <div class="db-sidebar-item">
            <svg viewBox="0 0 16 16" fill="none"><rect x="2" y="4" width="12" height="8" rx="2" stroke="currentColor" stroke-width="1.5"/><path d="M5 8h6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
            Vendor Payments
          </div>
          <div class="db-sidebar-item">
            <svg viewBox="0 0 16 16" fill="none"><circle cx="8" cy="6" r="3" stroke="currentColor" stroke-width="1.5"/><path d="M2 14c0-3.3 2.7-6 6-6s6 2.7 6 6" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"/></svg>
            Escrow Services
          </div>
        </div>
        <div class="db-content">
          <div class="db-welcome">Welcome back, Sid</div>
          <div class="db-tag">Detailed Account Insights</div>
          <div class="db-amount">₹13,08,000<span style="font-size:9px;color:#6b7280;">00</span></div>
          <div class="mini-chart">
            <div class="mini-bar" style="height:20px;"></div>
            <div class="mini-bar" style="height:30px;"></div>
            <div class="mini-bar" style="height:25px;"></div>
            <div class="mini-bar" style="height:40px;"></div>
            <div class="mini-bar" style="height:35px;"></div>
            <div class="mini-bar" style="height:50px;"></div>
            <div class="mini-bar" style="height:38px;"></div>
            <div class="mini-bar" style="height:45px;"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- LOGO STRIP -->
<div class="logo-strip">
  <div class="ticker-track">
    <span class="ticker-logo flip">Flipkart 🛍</span>
    <span class="ticker-logo matrix">matrix partners</span>
    <span class="ticker-logo credit">CREDIT SAISON</span>
    <span class="ticker-logo">P Poonawalla Finance</span>
    <span class="ticker-logo">JSW ONE</span>
    <span class="ticker-logo">⚡ Gameskraft</span>
    <span class="ticker-logo">🌅 Art of Living</span>
    <span class="ticker-logo">🌲 treebo</span>
    <span class="ticker-logo">↑upstox</span>
    <span class="ticker-logo">zepto</span>
    <span class="ticker-logo">🚗 rapido</span>
    <span class="ticker-logo">🏠 HOUSING.com</span>
    <span class="ticker-logo">CRED</span>
    <span class="ticker-logo">🎯 hike</span>
    <!-- repeat for seamless loop -->
    <span class="ticker-logo flip">Flipkart 🛍</span>
    <span class="ticker-logo matrix">matrix partners</span>
    <span class="ticker-logo credit">CREDIT SAISON</span>
    <span class="ticker-logo">P Poonawalla Finance</span>
    <span class="ticker-logo">JSW ONE</span>
    <span class="ticker-logo">⚡ Gameskraft</span>
    <span class="ticker-logo">🌅 Art of Living</span>
    <span class="ticker-logo">🌲 treebo</span>
    <span class="ticker-logo">↑upstox</span>
    <span class="ticker-logo">zepto</span>
    <span class="ticker-logo">🚗 rapido</span>
    <span class="ticker-logo">🏠 HOUSING.com</span>
    <span class="ticker-logo">CRED</span>
    <span class="ticker-logo">🎯 hike</span>
  </div>
</div>

<!-- PRODUCTS SECTION -->
<section class="products-section fade-in">
  <div style="text-align:center;margin-bottom:32px;">
    <h2 class="section-h2">The business banking solution with<br><span>payouts at the center</span></h2>
  </div>

  <div class="tab-bar">
    <button class="tab-btn active" onclick="switchTab(this,'bb')">Business Banking+</button>
    <button class="tab-btn" onclick="switchTab(this,'api')">API Payouts</button>
    <button class="tab-btn" onclick="switchTab(this,'escrow')">Escrow+</button>
    <button class="tab-btn" onclick="switchTab(this,'vendor')">Vendor Payments</button>
    <button class="tab-btn" onclick="switchTab(this,'payroll')">Payroll</button>
    <button class="tab-btn" onclick="switchTab(this,'card')">Corporate Card</button>
  </div>

  <div class="product-panels">

    <!-- Business Banking+ -->
    <div class="product-panel active" id="panel-bb">
      <div class="panel-visual">
        <div class="phone-mockup">
          <div style="font-size:10px;color:#6b7280;margin-bottom:8px;">Bulk Payout Summary</div>
          <div class="phone-item">✓ 450 payouts sent</div>
          <div class="phone-item">✓ ₹12.4L disbursed</div>
          <div class="phone-item" style="background:#fff5f5;color:#dc2626;">! 2 failed</div>
        </div>
      </div>
      <div class="panel-info">
        <div class="panel-tag">PAY SMARTER WITH</div>
        <div class="panel-h3">Business Banking+</div>
        <p class="panel-desc">Supercharged command center for complete financial management and payouts:</p>
        <ul class="panel-features">
          <li>Add beneficiaries &amp; pay instantly with no cool-off period</li>
          <li>Make up to 50k payouts in bulk using a single OTP</li>
          <li>Add multiple users &amp; create custom approval workflows</li>
        </ul>
        <div class="panel-btns">
          <button class="btn-primary">Sign Up →</button>
          <button class="btn-secondary">Know More</button>
        </div>
      </div>
    </div>

    <!-- API Payouts -->
    <div class="product-panel" id="panel-api">
      <div class="panel-visual" style="background:linear-gradient(135deg,#e8fdf5 0%,#d1fae5 100%);">
        <div class="api-success-card">
          <div class="api-check">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="10" stroke="white" stroke-width="2"/><path d="M7 12l4 4 6-7" stroke="white" stroke-width="2" stroke-linecap="round"/></svg>
          </div>
          <div class="api-success-title">API Payout Successful</div>
          <div class="api-success-date">7 May | 12:45 PM</div>
        </div>
      </div>
      <div class="panel-info">
        <div class="panel-tag">PAY AT SCALE WITH</div>
        <div class="panel-h3">API Payouts</div>
        <p class="panel-desc">Enjoy a seamless payout experience with India's only AI-powered multi-bank router:</p>
        <ul class="panel-features">
          <li>Route payments in real-time with 99.9% success rate</li>
          <li>Enjoy 100% secure payments with multiple anti-fraud measures</li>
          <li>Use UPI/IMPS/NEFT/RTGS or payout to cards 24/7, 365 days a year</li>
        </ul>
        <div class="panel-btns">
          <button class="btn-primary">Sign Up →</button>
        </div>
      </div>
    </div>

    <!-- Escrow+ -->
    <div class="product-panel" id="panel-escrow">
      <div class="panel-visual" style="background:linear-gradient(135deg,#f5f3ff 0%,#ede9fe 100%);">
        <div class="escrow-card">
          <div class="approval-tag">Approval Workflows</div>
          <div class="escrow-badge">99.98%</div>
          <div class="escrow-label">Uptime guaranteed</div>
          <div style="margin-top:8px;font-size:12px;color:#374151;">Digital onboarding modules for instant escrow setup</div>
        </div>
      </div>
      <div class="panel-info">
        <div class="panel-tag">PAY COMPLIANTLY WITH</div>
        <div class="panel-h3">Escrow+</div>
        <p class="panel-desc">An escrow management platform bringing banks, trustees, &amp; RazorpayX as your TSP together:</p>
        <ul class="panel-features">
          <li>Get onboarded 10X faster with our digital modules</li>
          <li>Open sub-escrows instantly for all use cases and seamless recon</li>
          <li>End-to-end automation with world-class APIs &amp; dashboard access</li>
        </ul>
        <div class="panel-btns">
          <button class="btn-primary">Sign Up →</button>
        </div>
      </div>
    </div>

    <!-- Vendor Payments -->
    <div class="product-panel" id="panel-vendor">
      <div class="panel-visual" style="background:linear-gradient(135deg,#fff7ed 0%,#ffedd5 100%);">
        <div style="background:#fff;border-radius:12px;padding:20px;width:200px;box-shadow:0 4px 16px rgba(0,0,0,0.08);">
          <div style="font-size:11px;color:#6b7280;margin-bottom:8px;">Upload Invoice</div>
          <div style="background:#f0fdf4;border-radius:6px;padding:10px;margin-bottom:8px;">
            <div style="font-size:12px;font-weight:700;color:#065f46;">Invoice #1042</div>
            <div style="font-size:11px;color:#6b7280;">Acme Corp • ₹45,000</div>
          </div>
          <div style="background:#eff6ff;border-radius:6px;padding:8px;">
            <div style="font-size:11px;color:#1d4ed8;font-weight:600;">Auto-scheduled ✓</div>
          </div>
        </div>
      </div>
      <div class="panel-info">
        <div class="panel-tag">PAY VENDORS WITH</div>
        <div class="panel-h3">Vendor Payments</div>
        <p class="panel-desc">Streamline your vendor payment workflows with automation and control:</p>
        <ul class="panel-features">
          <li>Upload invoices and schedule payments automatically</li>
          <li>Multi-level approval workflows for compliance</li>
          <li>Real-time payment status and reconciliation</li>
        </ul>
        <div class="panel-btns">
          <button class="btn-primary">Sign Up →</button>
          <button class="btn-secondary">Know More</button>
        </div>
      </div>
    </div>

    <!-- Payroll -->
    <div class="product-panel" id="panel-payroll">
      <div class="panel-visual" style="background:linear-gradient(135deg,#f0f9ff 0%,#e0f2fe 100%);">
        <div style="background:#fff;border-radius:12px;padding:20px;width:200px;box-shadow:0 4px 16px rgba(0,0,0,0.08);">
          <div style="font-size:11px;color:#6b7280;margin-bottom:6px;">Payroll Month</div>
          <div style="font-size:12px;font-weight:700;color:var(--blue);margin-bottom:10px;">April 2024 ▾</div>
          <div style="font-size:11px;color:#6b7280;">Amount</div>
          <div style="font-size:18px;font-weight:700;color:#1a1a2e;margin-bottom:6px;">₹23,50,000</div>
          <div style="font-size:11px;font-weight:600;color:var(--green);margin-bottom:8px;">Your payroll has been finalised.</div>
          <button style="background:var(--blue);color:#fff;border:none;border-radius:6px;padding:7px 14px;font-size:11px;font-weight:600;cursor:pointer;width:100%;">Make Payouts</button>
        </div>
      </div>
      <div class="panel-info">
        <div class="panel-tag">MANAGE WITH</div>
        <div class="panel-h3">Payroll</div>
        <p class="panel-desc">Process payroll for your entire team with one click:</p>
        <ul class="panel-features">
          <li>Automated salary calculations with compliance built-in</li>
          <li>Generate 17 lakh+ payslips monthly with ease</li>
          <li>TDS, PF, ESI and other deductions handled automatically</li>
        </ul>
        <div class="panel-btns">
          <button class="btn-primary">Sign Up →</button>
          <button class="btn-secondary">Know More</button>
        </div>
      </div>
    </div>

    <!-- Corporate Card -->
    <div class="product-panel" id="panel-card">
      <div class="panel-visual" style="background:linear-gradient(135deg,#1e3a5f 0%,#2d4f7c 100%);">
        <div style="background:linear-gradient(135deg,#a8c4f0 0%,#c5d8f8 100%);border-radius:14px;padding:24px 20px;width:200px;box-shadow:0 12px 40px rgba(0,0,0,0.3);">
          <div style="font-size:9px;color:rgba(30,60,114,0.7);margin-bottom:2px;font-weight:700;">RazorpayX</div>
          <div style="width:32px;height:22px;background:linear-gradient(135deg,#d4af37,#f0d060);border-radius:4px;margin-bottom:14px;"></div>
          <div style="font-size:12px;font-weight:700;color:#1a1a2e;margin-bottom:4px;">Utkarsh Ranjan</div>
          <div style="font-size:10px;color:#374151;">Owner</div>
          <div style="margin-top:14px;font-size:13px;color:rgba(30,60,114,0.9);letter-spacing:2px;">•••• •••• 4242</div>
        </div>
      </div>
      <div class="panel-info">
        <div class="panel-tag">SPEND SMART WITH</div>
        <div class="panel-h3">Corporate Card</div>
        <p class="panel-desc">Empower your team with smart corporate cards with built-in controls:</p>
        <ul class="panel-features">
          <li>Issue unlimited physical &amp; virtual cards instantly</li>
          <li>Set spending limits and category controls per card</li>
          <li>Real-time expense tracking and automated reconciliation</li>
        </ul>
        <div class="panel-btns">
          <button class="btn-primary">Sign Up →</button>
          <button class="btn-secondary">Know More</button>
        </div>
      </div>
    </div>

  </div>
</section>

<!-- INNOVATIONS -->
<section class="innovations fade-in">
  <div style="text-align:center;">
    <h2 class="section-h2">Complex money flows, simplified with our <span>latest innovations</span></h2>
  </div>
  <div class="inno-grid">
    <div class="inno-card dark1">
      <div class="inno-badge">Bring FDI to your India Account</div>
      <div class="inno-icon">🌐</div>
      <div class="inno-h3">Forex Management</div>
      <p class="inno-desc">An expert-led, transparent service that helps bring in FDI and make forex payments securely with 100% compliance.</p>
      <button class="btn-know">Know More</button>
    </div>
    <div class="inno-card dark2" style="position:relative;">
      <div class="inno-icon">❓</div>
      <div class="inno-h3">Lending Tech Stack</div>
      <p class="inno-desc">An end-to-end tech stack loved by NBFCs for 48-hour LSP onboarding, 10-sec loan disbursals &amp; industry-best collections suite.</p>
      <div style="display:flex;gap:6px;margin-bottom:14px;align-items:center;">
        <div class="lsp-tag">LSP 01</div>
        <div class="lsp-tag">LSP 02</div>
        <div class="lsp-tag">LSP 03</div>
      </div>
      <div style="margin-bottom:14px;"><span style="background:var(--green);color:#fff;font-size:11px;font-weight:700;padding:4px 10px;border-radius:5px;">NBFC</span></div>
      <button class="btn-know">Know More</button>
    </div>
  </div>
</section>

<!-- INTEGRATIONS -->
<section class="integrations fade-in">
  <h2><span>Plugs directly</span> into your finance stack</h2>
  <div class="int-grid">
    <div class="int-logo"><div class="dot" style="background:#e53e3e;"></div>Zaggle</div>
    <div class="int-logo">⏰ Jibble</div>
    <div class="int-logo">🔵 Zoho People</div>
    <div class="int-logo" style="color:#c00;">ORACLE<br><small>NETSUITE</small></div>
    <div class="int-logo">📊 Microsoft Dynamics 365</div>
    <div class="int-logo" style="color:#e53e3e;font-style:italic;">Tally</div>
    <div class="int-logo">📒 Zoho Books</div>
    <div class="int-logo" style="color:#96bf48;">🛒 Shopify</div>
    <div class="int-logo" style="color:#0072cc;font-weight:900;">SAP</div>
    <div class="int-logo"><span style="color:#6366f1;">✦</span> slack</div>
    <div class="int-logo" style="color:#f97316;font-style:italic;">Jify</div>
    <div class="int-logo">🛡 SpringVerify</div>
    <div class="int-logo" style="color:#25D366;">📱 WhatsApp</div>
    <div class="int-logo" style="color:#e91e8c;">plum</div>
    <div class="int-logo" style="color:#e91e8c;">🩷 pazcare</div>
    <div class="int-logo" style="color:#0052cc;font-size:11px;">UBITECH SOLUTIONS</div>
  </div>
</section>

<!-- STATS -->
<section class="stats-section fade-in">
  <h2 class="stats-h2">Raising the bar in business payments every day</h2>
  <div class="stats-grid">
    <div class="stat-card">
      <div class="stat-val">$37 Billion</div>
      <div class="stat-desc">Total Payout Volume (TPV) processed in 2024</div>
    </div>
    <div class="stat-card">
      <div class="stat-val">99.99%</div>
      <div class="stat-desc">payouts success rate, the best in the industry</div>
    </div>
    <div class="stat-card">
      <div class="stat-val">17 Lakhs</div>
      <div class="stat-desc">payslips generated monthly through RazorpayX Payroll</div>
    </div>
    <div class="stat-card">
      <div class="stat-val">6%</div>
      <div class="stat-desc">of India's IMPS volumes</div>
    </div>
  </div>
</section>

<!-- INSIGHTS -->
<section class="insights fade-in">
  <h2><span>Data-Driven Insights</span> to fuel Strategic Decisions</h2>
  <div class="insights-grid">
    <div class="insight-card">
      <div class="insight-img" style="background:linear-gradient(135deg,#dbeafe,#bfdbfe);">📊</div>
      <div class="insight-body">
        <div class="insight-title">State of Startup Hiring Report 2024</div>
        <div class="insight-link">Download Report →</div>
      </div>
    </div>
    <div class="insight-card">
      <div class="insight-img" style="background:linear-gradient(135deg,#f0fdf4,#dcfce7);">💡</div>
      <div class="insight-body">
        <div class="insight-title">Business Banking Trends India 2024</div>
        <div class="insight-link">Download Report →</div>
      </div>
    </div>
    <div class="insight-card">
      <div class="insight-img" style="background:linear-gradient(135deg,#fef9c3,#fef08a);">🏦</div>
      <div class="insight-body">
        <div class="insight-title">Personalised Lending in the Digital Age</div>
        <div class="insight-link">Download Report →</div>
      </div>
    </div>
    <div class="insight-card">
      <div class="insight-img" style="background:linear-gradient(135deg,#f5f3ff,#ede9fe);">💰</div>
      <div class="insight-body">
        <div class="insight-title">Show Me The Money</div>
        <div class="insight-sub" style="font-size:12px;color:#6b7280;margin-bottom:6px;">Learn the latest hiring and workforce trends shaping the landscape of employment in India</div>
        <div class="insight-link">Download Report →</div>
      </div>
    </div>
  </div>
</section>

<!-- PARTNERS -->
<section class="partners fade-in">
  <div class="partner-tag">RAZORPAYX PARTNERS</div>
  <h2>Automate your Client's Business <span>Finance Payments</span></h2>
  <div class="partner-benefits">
    <div>
      <div class="pb-icon">⚏</div>
      <div class="pb-title">Diversify your services</div>
      <div class="pb-desc">Add 10+ business finance offerings with zero effort</div>
    </div>
    <div>
      <div class="pb-icon">⏱</div>
      <div class="pb-title">Save time and effort</div>
      <div class="pb-desc">Save 98% of time &amp; cost while managing clients</div>
    </div>
    <div>
      <div class="pb-icon">🤍</div>
      <div class="pb-title">Delight your clients</div>
      <div class="pb-desc">Delight clients with simplified business processes</div>
    </div>
    <div>
      <div class="pb-icon">🏷</div>
      <div class="pb-title">Get exclusive offers</div>
      <div class="pb-desc">Get an exclusive discount for your clients</div>
    </div>
  </div>
  <div class="partner-cards">
    <div class="pc">
      <div class="pc-img ac">📋</div>
      <div class="pc-body">
        <div class="pc-title">Accounting Partner</div>
        <div class="pc-desc">Become a business advisor and grow your practice.</div>
      </div>
    </div>
    <div class="pc">
      <div class="pc-img rf">🤝</div>
      <div class="pc-body">
        <div class="pc-title">Referral Partner</div>
        <div class="pc-desc">Leverage your client network and grow your revenue.</div>
      </div>
    </div>
    <div class="pc">
      <div class="pc-img cn">💼</div>
      <div class="pc-body">
        <div class="pc-title">Consulting Partner</div>
        <div class="pc-desc">Implement finance solutions &amp; maximize business efficiency.</div>
      </div>
    </div>
    <div class="pc">
      <div class="pc-img tp">⚙️</div>
      <div class="pc-body">
        <div class="pc-title">Technology Partner</div>
        <div class="pc-desc">Integrate with RazorpayX and provide value to customers.</div>
      </div>
    </div>
  </div>
</section>

<!-- FOOTER -->
<footer class="footer">
  <div class="footer-container">
    <div class="footer-grid">

      <!-- COLUMN 0: ABOUT -->
      <div class="footer-col footer-about">
        <span class="footer-brand-name">Razorpay</span>
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
        <p class="footer-disclaimer">
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

        <h4>HELP &amp; SUPPORT</h4>
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
        <p class="footer-address">
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
  // Tab switching
  function switchTab(btn, id) {
    document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
    document.querySelectorAll('.product-panel').forEach(p => p.classList.remove('active'));
    btn.classList.add('active');
    document.getElementById('panel-' + id).classList.add('active');
  }

  // Scroll fade-in
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); });
  }, { threshold: 0.1 });
  document.querySelectorAll('.fade-in').forEach(el => observer.observe(el));
</script>
</body>
</html>