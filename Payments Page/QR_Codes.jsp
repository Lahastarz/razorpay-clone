<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Razorpay QR Codes – Accept Instant Payments</title>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --blue: #2563EB;
      --blue-dark: #1D4ED8;
      --blue-light: #3B82F6;
      --blue-pale: #DBEAFE;
      --blue-bg: #EFF6FF;
      --text-dark: #111827;
      --text-mid: #374151;
      --text-muted: #6B7280;
      --border: #E5E7EB;
      --white: #FFFFFF;
      --bg-light: #F3F4F6;
    }

    body {
      font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
      color: var(--text-dark);
      background: var(--white);
      overflow-x: hidden;
    }

    .top-bar { background: #1a1a2e; height: 4px; width: 100%; }

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
      background: #F5F8FF; padding: 60px 80px 0;
      display: flex; align-items: flex-end; gap: 40px;
      min-height: 460px; overflow: hidden;
    }
    .hero-text { flex: 0 0 420px; padding-bottom: 60px; }
    .hero-text h1 {
      font-size: 44px; font-weight: 800; line-height: 1.15;
      color: var(--text-dark); margin-bottom: 20px;
    }
    .hero-text h1 span { color: var(--blue); }
    .hero-text p {
      font-size: 14.5px; color: var(--text-mid); line-height: 1.65;
      margin-bottom: 28px; max-width: 360px;
    }
    .btn-hero {
      background: var(--blue); color: var(--white); font-size: 14px; font-weight: 600;
      padding: 11px 24px; border-radius: 6px; border: none; cursor: pointer;
      display: inline-flex; align-items: center; gap: 8px; transition: background .2s;
    }
    .btn-hero:hover { background: var(--blue-dark); }
    .hero-visual {
      flex: 1; position: relative; display: flex; align-items: flex-end;
      justify-content: center; min-height: 400px;
    }
    .hero-bg-shape {
      position: absolute; right: -20px; bottom: 0;
      width: 500px; height: 390px;
      background: linear-gradient(135deg, #1D4ED8 0%, #2563EB 55%, #60A5FA 100%);
      clip-path: polygon(28% 0%, 100% 0%, 100% 100%, 0% 100%);
    }
    .hero-img {
      position: relative; z-index: 2; width: 340px; height: 390px;
      object-fit: cover; object-position: top center;
    }
    .qr-card {
      position: absolute; top: 24px; right: 24px; z-index: 3;
      background: var(--white); border-radius: 14px; padding: 14px;
      width: 195px; box-shadow: 0 8px 32px rgba(0,0,0,.20);
    }
    .qr-card-header {
      background: #1e3a8a; border-radius: 8px; padding: 10px 12px;
      margin-bottom: 12px; text-align: center;
    }
    .qr-card-header .brand { color: #fff; font-size: 12.5px; font-weight: 700; }
    .qr-card-header .sub { color: rgba(255,255,255,.65); font-size: 8px; letter-spacing: 1.5px; text-transform: uppercase; margin-top: 2px; }
    .qr-inner {
      background: var(--white); border-radius: 8px; padding: 10px;
      border: 1px solid var(--border);
    }
    .upi-badges { display: flex; align-items: center; justify-content: space-between; margin-bottom: 8px; }
    .bhim-badge { background: #1565C0; color: white; font-size: 8px; font-weight: 800; padding: 2px 6px; border-radius: 3px; }
    .upi-badge { color: #1565C0; font-size: 9px; font-weight: 800; border: 1.5px solid #1565C0; padding: 2px 5px; border-radius: 3px; }
    .scan-label { text-align: center; font-size: 7px; font-weight: 700; letter-spacing: 1px; color: var(--text-muted); margin: 6px 0 8px; }
    .upi-apps { display: flex; align-items: center; justify-content: center; gap: 6px; }
    .upi-app-dot {
      width: 22px; height: 22px; border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-size: 9px; font-weight: 700; color: white;
    }

    /* BRANDS TICKER */
    .brands-section {
      background: var(--white); padding: 26px 0;
      border-top: 1px solid var(--border); border-bottom: 1px solid var(--border);
      overflow: hidden;
    }
    .brands-track {
      display: flex; align-items: center; gap: 64px;
      white-space: nowrap; animation: scroll-left 30s linear infinite; width: max-content;
    }
    .brands-section:hover .brands-track { animation-play-state: paused; }
    @keyframes scroll-left { 0%{transform:translateX(0)} 100%{transform:translateX(-50%)} }
    .brand-item { font-size: 12.5px; font-weight: 700; color: #9CA3AF; letter-spacing: 1.5px; text-transform: uppercase; white-space: nowrap; }

    /* SECTIONS */
    section { padding: 80px; }
    .section-title { font-size: 38px; font-weight: 800; color: var(--text-dark); text-align: center; line-height: 1.2; margin-bottom: 14px; }
    .section-subtitle { font-size: 14.5px; color: var(--blue); text-align: center; max-width: 540px; margin: 0 auto 52px; line-height: 1.65; }

    /* WHY SECTION */
    .why-section { background: #F5F8FF; }
    .features-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
    .feature-card {
      background: var(--white); border-radius: 14px; overflow: hidden;
      box-shadow: 0 2px 14px rgba(0,0,0,.07); transition: transform .25s, box-shadow .25s;
    }
    .feature-card:hover { transform: translateY(-4px); box-shadow: 0 10px 28px rgba(37,99,235,.13); }
    .feature-card-img {
      background: #DBEAFE; height: 200px;
      display: flex; align-items: center; justify-content: center;
      padding: 24px; position: relative; overflow: hidden;
    }
    .feature-card-body { padding: 20px 22px 26px; }
    .feature-card-body h3 { font-size: 16px; font-weight: 700; color: var(--text-dark); margin-bottom: 8px; }
    .feature-card-body p { font-size: 13.5px; color: var(--text-muted); line-height: 1.6; }
    .store-icon-box {
      width: 54px; height: 54px; background: var(--blue); border-radius: 10px;
      display: flex; align-items: center; justify-content: center;
    }
    .connector-line { width: 1px; height: 18px; background: #94A3B8; margin: 0 auto; }
    .qr-nodes { display: flex; gap: 10px; }
    .qr-node { display: flex; flex-direction: column; align-items: center; gap: 4px; }
    .qr-node-box {
      width: 38px; height: 38px; border: 1.5px solid #94A3B8; border-radius: 6px;
      display: flex; align-items: center; justify-content: center;
    }
    .qr-node-label { font-size: 8px; color: var(--text-muted); font-weight: 600; }
    .phone-mock {
      width: 88px; height: 156px; background: #1F2937; border-radius: 18px;
      border: 3px solid #374151; display: flex; flex-direction: column;
      align-items: center; justify-content: center; padding: 8px; position: relative;
    }
    .phone-notch { position: absolute; top: 8px; width: 22px; height: 5px; background: #111; border-radius: 4px; }
    .phone-screen {
      background: white; width: 100%; height: 100%; border-radius: 12px;
      display: flex; flex-direction: column; align-items: center; justify-content: center; padding: 8px;
    }
    .scan-to-pay-label { font-size: 6px; font-weight: 700; color: var(--text-dark); margin-bottom: 4px; }
    .payment-methods-box {
      background: white; border-radius: 10px; padding: 14px 16px;
      box-shadow: 0 2px 14px rgba(0,0,0,.11); min-width: 160px;
    }
    .pm-title { font-size: 11px; font-weight: 700; color: var(--text-dark); margin-bottom: 10px; }
    .pm-item {
      display: flex; align-items: center; gap: 8px;
      padding: 7px 0; border-bottom: 1px solid var(--border);
      font-size: 11.5px; font-weight: 600; color: var(--text-dark);
    }
    .pm-item:last-child { border-bottom: none; }
    .pm-icon { width: 22px; height: 22px; border-radius: 4px; display: flex; align-items: center; justify-content: center; }
    .orbit-dot {
      position: absolute; width: 24px; height: 24px; border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      font-size: 8px; font-weight: 700; color: white; z-index: 2;
    }
    .od-1 { top: 8px; left: -2px; animation: od1 3.5s ease-in-out infinite; }
    .od-2 { top: 40%; right: -8px; animation: od2 3.5s ease-in-out infinite .6s; }
    .od-3 { bottom: 10px; left: 0px; animation: od3 3.5s ease-in-out infinite 1.2s; }
    @keyframes od1{0%,100%{transform:translate(0,0)}50%{transform:translate(5px,-5px)}}
    @keyframes od2{0%,100%{transform:translateY(0)}50%{transform:translateY(6px)}}
    @keyframes od3{0%,100%{transform:translate(0,0)}50%{transform:translate(-4px,4px)}}
    .fc-photo { width: 100%; height: 100%; object-fit: cover; }
    .fc-notification {
      background: white; border-radius: 12px; padding: 12px 14px;
      box-shadow: 0 4px 16px rgba(0,0,0,.12); font-size: 11.5px;
      color: var(--text-dark); max-width: 200px; margin-bottom: 10px;
    }
    .fc-txn-row {
      background: white; border-radius: 10px; padding: 10px 14px;
      box-shadow: 0 2px 12px rgba(0,0,0,.1);
      display: flex; align-items: center; justify-content: space-between; gap: 12px;
      font-size: 10px; color: var(--text-muted); max-width: 200px;
    }
    .txn-chip { background: var(--blue); color: white; font-size: 9px; font-weight: 600; padding: 3px 8px; border-radius: 4px; }

    /* TAP SCAN PAY */
    .tap-section { background: var(--white); }
    .tap-header { margin-bottom: 52px; }
    .tap-header h2 { font-size: 40px; font-weight: 800; color: var(--text-dark); max-width: 520px; line-height: 1.2; margin-bottom: 14px; }
    .tap-header p { font-size: 14.5px; color: var(--text-mid); line-height: 1.65; max-width: 500px; }
    .tap-header p span { color: var(--blue); font-weight: 600; }
    .use-cases-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 40px 56px; }
    .use-case { display: flex; flex-direction: column; gap: 10px; }
    .uc-icon { width: 34px; height: 34px; color: var(--blue); }
    .use-case h3 { font-size: 15px; font-weight: 700; color: var(--text-dark); }
    .use-case p { font-size: 13.5px; color: var(--text-muted); line-height: 1.6; }
    .use-case p a { color: var(--blue); text-decoration: none; font-weight: 500; }

    /* TRUSTED */
    .trusted-section {
      background: #F5F8FF; display: flex; align-items: center; gap: 64px; padding: 80px;
    }
    .trusted-left { flex: 0 0 260px; }
    .trusted-left h2 { font-size: 40px; font-weight: 800; color: var(--text-dark); line-height: 1.2; }
    .testimonials-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; flex: 1; }
    .testimonial-card {
      background: var(--white); border-radius: 14px; padding: 28px;
      box-shadow: 0 2px 16px rgba(0,0,0,.07); border: 1px solid var(--border);
    }
    .testimonial-brand { font-size: 15px; font-weight: 800; color: var(--blue); letter-spacing: .5px; margin-bottom: 14px; }
    .testimonial-brand.dark { color: var(--text-dark); }
    .testimonial-card p { font-size: 14px; color: var(--text-dark); line-height: 1.7; font-weight: 500; margin-bottom: 20px; }
    .testimonial-card p a { color: var(--blue); text-decoration: none; font-weight: 600; }
    .testimonial-author-name { font-size: 13px; font-weight: 700; color: var(--text-dark); }
    .testimonial-author-title { font-size: 12px; color: var(--text-muted); margin-top: 3px; }

    /* SUPPLEMENT */
    .supplement-section { background: var(--white); }
    .products-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-top: 40px; }
    .product-card {
      border: 1.5px solid var(--border); border-radius: 12px; padding: 22px 24px 22px;
      transition: border-color .2s, box-shadow .2s; cursor: pointer;
    }
    .product-card:hover { border-color: var(--blue-light); box-shadow: 0 4px 16px rgba(37,99,235,.1); }
    .product-card-header { display: flex; align-items: flex-start; justify-content: space-between; margin-bottom: 10px; }
    .product-label { font-size: 12.5px; color: var(--text-muted); font-weight: 600; }
    .product-icon { width: 28px; height: 28px; color: var(--blue); }
    .product-card h3 { font-size: 15.5px; font-weight: 700; color: var(--text-dark); line-height: 1.4; margin-bottom: 18px; }
    .know-more { color: var(--blue); font-size: 13px; font-weight: 600; text-decoration: none; display: inline-flex; align-items: center; gap: 4px; transition: gap .15s; }
    .know-more:hover { gap: 8px; }

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

    /* SCROLL REVEAL */
    .reveal { opacity: 0; transform: translateY(24px); transition: opacity .55s, transform .55s; }
    .reveal.visible { opacity: 1; transform: none; }

    /* RESPONSIVE */
    @media (max-width: 1100px) {
      .hero { padding: 48px 24px 0; }
      section { padding: 60px 24px; }
      .trusted-section { padding: 60px 24px; gap: 32px; }
      .features-grid { grid-template-columns: 1fr 1fr; }
      .use-cases-grid { grid-template-columns: 1fr 1fr; }
    }
    @media (max-width: 1024px) {
      .footer-grid { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 768px) {
      .hero { flex-direction: column; padding: 40px 20px 0; }
      .hero-text { flex: none; padding-bottom: 0; }
      .hero-visual { min-height: 280px; width: 100%; }
      .features-grid, .products-grid { grid-template-columns: 1fr; }
      .testimonials-grid { grid-template-columns: 1fr; }
      .trusted-section { flex-direction: column; }
      .footer-grid { grid-template-columns: 1fr; }
      .use-cases-grid { grid-template-columns: 1fr; }
    }
  </style>
</head>
<body>

<div class="top-bar"></div>

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
<div class="hero">
  <div class="hero-text reveal">
    <h1>Accept instant payments with Razorpay <span>QR codes</span></h1>
    <p>Generate unlimited QR codes in seconds—be it UPI QR, Bharat QR, or Merchant QR codes. Let your customers pay effortlessly using any UPI-enabled app.</p>
    <button class="btn-hero">Sign up &nbsp;→</button>
  </div>
  <div class="hero-visual">
    <div class="hero-bg-shape"></div>
    <img
      src="https://images.pexels.com/photos/3760067/pexels-photo-3760067.jpeg?auto=compress&cs=tinysrgb&w=400&h=500&dpr=1"
      alt="Merchant holding boxes"
      class="hero-img"
    />
    <div class="qr-card">
      <div class="qr-card-header">
        <div class="brand">Razorpay for Acme</div>
        <div class="sub">BY RAZORPAY</div>
      </div>
      <div class="qr-inner">
        <div class="upi-badges">
          <div class="bhim-badge">BHIM</div>
          <div class="upi-badge">▸ UPI</div>
        </div>
        <svg viewBox="0 0 100 100" width="100%" style="display:block;margin-bottom:5px;" xmlns="http://www.w3.org/2000/svg">
          <rect width="100" height="100" fill="white"/>
          <rect x="5" y="5" width="28" height="28" fill="#111" rx="2"/><rect x="9" y="9" width="20" height="20" fill="white" rx="1"/><rect x="12" y="12" width="14" height="14" fill="#111" rx="1"/>
          <rect x="67" y="5" width="28" height="28" fill="#111" rx="2"/><rect x="71" y="9" width="20" height="20" fill="white" rx="1"/><rect x="74" y="12" width="14" height="14" fill="#111" rx="1"/>
          <rect x="5" y="67" width="28" height="28" fill="#111" rx="2"/><rect x="9" y="71" width="20" height="20" fill="white" rx="1"/><rect x="12" y="74" width="14" height="14" fill="#111" rx="1"/>
          <circle cx="50" cy="50" r="7" fill="#2563EB"/>
          <text x="50" y="54" text-anchor="middle" fill="white" font-size="7" font-weight="bold">R</text>
          <rect x="38" y="5" width="4" height="4" fill="#111"/><rect x="44" y="5" width="4" height="4" fill="#111"/><rect x="50" y="7" width="3" height="3" fill="#111"/><rect x="55" y="5" width="4" height="4" fill="#111"/>
          <rect x="40" y="12" width="3" height="3" fill="#111"/><rect x="46" y="13" width="4" height="4" fill="#111"/><rect x="53" y="11" width="3" height="3" fill="#111"/><rect x="58" y="14" width="3" height="3" fill="#111"/>
          <rect x="38" y="19" width="4" height="3" fill="#111"/><rect x="52" y="18" width="3" height="4" fill="#111"/><rect x="57" y="20" width="4" height="3" fill="#111"/>
          <rect x="41" y="25" width="3" height="4" fill="#111"/><rect x="47" y="26" width="4" height="3" fill="#111"/><rect x="55" y="24" width="3" height="4" fill="#111"/>
          <rect x="5" y="38" width="4" height="4" fill="#111"/><rect x="11" y="40" width="3" height="3" fill="#111"/><rect x="17" y="37" width="4" height="4" fill="#111"/>
          <rect x="5" y="45" width="3" height="4" fill="#111"/><rect x="14" y="44" width="4" height="3" fill="#111"/>
          <rect x="7" y="51" width="4" height="3" fill="#111"/><rect x="16" y="52" width="3" height="4" fill="#111"/>
          <rect x="5" y="57" width="4" height="4" fill="#111"/><rect x="13" y="58" width="3" height="3" fill="#111"/>
          <rect x="6" y="63" width="3" height="4" fill="#111"/>
          <rect x="82" y="38" width="4" height="4" fill="#111"/><rect x="89" y="40" width="3" height="3" fill="#111"/>
          <rect x="84" y="45" width="3" height="3" fill="#111"/><rect x="91" y="44" width="4" height="4" fill="#111"/>
          <rect x="82" y="51" width="4" height="3" fill="#111"/><rect x="89" y="53" width="3" height="4" fill="#111"/>
          <rect x="84" y="59" width="4" height="3" fill="#111"/><rect x="91" y="58" width="3" height="4" fill="#111"/>
          <rect x="38" y="82" width="4" height="4" fill="#111"/><rect x="45" y="84" width="3" height="3" fill="#111"/>
          <rect x="51" y="82" width="4" height="4" fill="#111"/><rect x="58" y="84" width="3" height="3" fill="#111"/>
          <rect x="40" y="90" width="3" height="4" fill="#111"/><rect x="48" y="89" width="4" height="3" fill="#111"/><rect x="56" y="91" width="3" height="4" fill="#111"/>
        </svg>
        <div class="scan-label">SCAN &amp; PAY WITH ANY UPI APP</div>
        <div class="upi-apps">
          <div class="upi-app-dot" style="background:linear-gradient(135deg,#4CAF50,#8BC34A);">G</div>
          <div class="upi-app-dot" style="background:#25D366;">W</div>
          <div class="upi-app-dot" style="background:#C0392B;">P</div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- BRANDS TICKER -->
<div class="brands-section">
  <div class="brands-track">
    <span class="brand-item">ARA</span>
    <span class="brand-item">⊞ SNITCH</span>
    <span class="brand-item">HEADS UP FOR TAILS</span>
    <span class="brand-item">NISH</span>
    <span class="brand-item">bummer</span>
    <span class="brand-item">GIVA</span>
    <span class="brand-item">CHUMBAK</span>
    <span class="brand-item">BOMBAY SHIRT COMPANY</span>
    <span class="brand-item">MAMAEARTH</span>
    <span class="brand-item">BEWAKOOF</span>
    <span class="brand-item">ARA</span>
    <span class="brand-item">⊞ SNITCH</span>
    <span class="brand-item">HEADS UP FOR TAILS</span>
    <span class="brand-item">NISH</span>
    <span class="brand-item">bummer</span>
    <span class="brand-item">GIVA</span>
    <span class="brand-item">CHUMBAK</span>
    <span class="brand-item">BOMBAY SHIRT COMPANY</span>
    <span class="brand-item">MAMAEARTH</span>
    <span class="brand-item">BEWAKOOF</span>
  </div>
</div>

<!-- WHY USE SECTION -->
<section class="why-section">
  <h2 class="section-title reveal">Why use Razorpay QR code<br>generator for payments?</h2>
  <p class="section-subtitle reveal">From flexibility to security, Razorpay QR codes offer everything you need to make transactions faster, easier, and more reliable.</p>

  <div class="features-grid">
    <!-- Card 1: Generate unlimited QR -->
    <div class="feature-card reveal">
      <div class="feature-card-img">
        <div style="display:flex;flex-direction:column;align-items:center;gap:10px;">
          <div class="store-icon-box">
            <svg width="26" height="26" fill="none" stroke="white" stroke-width="2" viewBox="0 0 24 24">
              <path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/>
              <path d="M16 10a4 4 0 01-8 0"/>
            </svg>
          </div>
          <div class="connector-line"></div>
          <div class="qr-nodes">
            <div class="qr-node">
              <div class="qr-node-box">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#374151" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="5" y="5" width="3" height="3" fill="#374151"/><rect x="16" y="5" width="3" height="3" fill="#374151"/><rect x="5" y="16" width="3" height="3" fill="#374151"/><rect x="14" y="14" width="7" height="7"/><rect x="16" y="16" width="3" height="3" fill="white"/></svg>
              </div>
              <span class="qr-node-label">QR 1</span>
            </div>
            <div class="qr-node">
              <div class="qr-node-box">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#374151" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="5" y="5" width="3" height="3" fill="#374151"/><rect x="16" y="5" width="3" height="3" fill="#374151"/><rect x="5" y="16" width="3" height="3" fill="#374151"/><rect x="14" y="14" width="7" height="7"/><rect x="16" y="16" width="3" height="3" fill="white"/></svg>
              </div>
              <span class="qr-node-label">QR 2</span>
            </div>
            <div class="qr-node">
              <div class="qr-node-box">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#374151" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/><rect x="5" y="5" width="3" height="3" fill="#374151"/><rect x="16" y="5" width="3" height="3" fill="#374151"/><rect x="5" y="16" width="3" height="3" fill="#374151"/><rect x="14" y="14" width="7" height="7"/><rect x="16" y="16" width="3" height="3" fill="white"/></svg>
              </div>
              <span class="qr-node-label">QR 3</span>
            </div>
          </div>
        </div>
      </div>
      <div class="feature-card-body">
        <h3>Generate unlimited QR codes</h3>
        <p>Create as many QR codes as you need for collecting both single and multiple payments directly into your bank account.</p>
      </div>
    </div>

    <!-- Card 2: Accept payments your way -->
    <div class="feature-card reveal">
      <div class="feature-card-img">
        <div style="position:relative;width:160px;height:160px;display:flex;align-items:center;justify-content:center;">
          <div class="phone-mock">
            <div class="phone-notch"></div>
            <div class="phone-screen">
              <div class="scan-to-pay-label">Scan to Pay</div>
              <svg viewBox="0 0 60 60" width="50" height="50" xmlns="http://www.w3.org/2000/svg">
                <rect width="60" height="60" fill="white"/>
                <rect x="3" y="3" width="17" height="17" fill="#111" rx="2"/><rect x="6" y="6" width="11" height="11" fill="white" rx="1"/><rect x="8" y="8" width="7" height="7" fill="#111"/>
                <rect x="40" y="3" width="17" height="17" fill="#111" rx="2"/><rect x="43" y="6" width="11" height="11" fill="white" rx="1"/><rect x="45" y="8" width="7" height="7" fill="#111"/>
                <rect x="3" y="40" width="17" height="17" fill="#111" rx="2"/><rect x="6" y="43" width="11" height="11" fill="white" rx="1"/><rect x="8" y="45" width="7" height="7" fill="#111"/>
                <circle cx="30" cy="30" r="5" fill="#2563EB"/>
                <rect x="23" y="3" width="3" height="3" fill="#111"/><rect x="28" y="5" width="3" height="2" fill="#111"/><rect x="33" y="3" width="3" height="3" fill="#111"/>
                <rect x="3" y="23" width="3" height="3" fill="#111"/><rect x="5" y="28" width="2" height="3" fill="#111"/>
                <rect x="54" y="23" width="3" height="3" fill="#111"/><rect x="54" y="30" width="3" height="3" fill="#111"/>
                <rect x="23" y="54" width="3" height="3" fill="#111"/><rect x="30" y="54" width="3" height="3" fill="#111"/><rect x="37" y="54" width="3" height="3" fill="#111"/>
              </svg>
            </div>
          </div>
          <div class="orbit-dot od-1" style="background:#4CAF50;">G</div>
          <div class="orbit-dot od-2" style="background:#FF9800;">P</div>
          <div class="orbit-dot od-3" style="background:#25D366;">W</div>
        </div>
      </div>
      <div class="feature-card-body">
        <h3>Accept payments, your way</h3>
        <p>Select the best payment method for your business needs &amp; give customers the flexibility to pay the way they prefer.</p>
      </div>
    </div>

    <!-- Card 3: Payment methods beyond UPI -->
    <div class="feature-card reveal">
      <div class="feature-card-img">
        <div class="payment-methods-box">
          <div class="pm-title">Payment Methods</div>
          <div class="pm-item">
            <div class="pm-icon" style="background:#EFF6FF;">
              <svg width="13" height="13" fill="none" stroke="#2563EB" stroke-width="2" viewBox="0 0 24 24"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg>
            </div>
            UPI
          </div>
          <div class="pm-item">
            <div class="pm-icon" style="background:#EFF6FF;">
              <svg width="13" height="13" fill="none" stroke="#2563EB" stroke-width="2" viewBox="0 0 24 24"><rect x="1" y="4" width="22" height="16" rx="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
            </div>
            Debit Cards
          </div>
          <div class="pm-item">
            <div class="pm-icon" style="background:#EFF6FF;">
              <svg width="13" height="13" fill="none" stroke="#2563EB" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="2"/><path d="M3 9h18M9 21V9"/></svg>
            </div>
            Netbanking
          </div>
        </div>
      </div>
      <div class="feature-card-body">
        <h3>Payment methods beyond UPI</h3>
        <p>With Razorpay's multi-payment QR codes, offer your customers the choice of paying via credit or debit card by scanning your QR Code.</p>
      </div>
    </div>

    <!-- Card 4: Track payments photo -->
    <div class="feature-card reveal">
      <div class="feature-card-img" style="padding:0;overflow:hidden;">
        <img
          src="https://images.pexels.com/photos/5926382/pexels-photo-5926382.jpeg?auto=compress&cs=tinysrgb&w=500&h=300&dpr=1"
          alt="Scanning QR code"
          class="fc-photo"
        />
      </div>
      <div class="feature-card-body">
        <h3>Track QR code payments easily</h3>
        <p>Monitor all QR code transactions in real-time from your Razorpay dashboard with instant notifications and full reconciliation.</p>
      </div>
    </div>

    <!-- Card 5: Custom branded QR -->
    <div class="feature-card reveal">
      <div class="feature-card-img" style="padding:0;overflow:hidden;">
        <img
          src="https://images.pexels.com/photos/4968384/pexels-photo-4968384.jpeg?auto=compress&cs=tinysrgb&w=500&h=300&dpr=1"
          alt="QR on products"
          class="fc-photo"
        />
      </div>
      <div class="feature-card-body">
        <h3>Custom branded QR codes</h3>
        <p>Add your logo and branding to QR codes. Share via email, WhatsApp, or print for in-store payments.</p>
      </div>
    </div>

    <!-- Card 6: Instant settlements -->
    <div class="feature-card reveal">
      <div class="feature-card-img">
        <div style="display:flex;flex-direction:column;align-items:center;gap:10px;width:100%;">
          <div class="fc-notification">
            <div style="display:flex;align-items:center;gap:6px;margin-bottom:5px;">
              <div style="width:16px;height:16px;border-radius:50%;background:#22C55E;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
                <svg width="8" height="8" fill="none" stroke="white" stroke-width="2.5" viewBox="0 0 12 12"><polyline points="2 6 5 9 10 3"/></svg>
              </div>
              <span style="font-size:9.5px;font-weight:700;color:#374151;">Payment Received</span>
            </div>
            <div style="font-size:11.5px;font-weight:600;color:#111827;">&#8377;500 received via UPI – Thanks for using Razorpay!</div>
          </div>
          <div class="fc-txn-row">
            <span style="font-weight:600;color:#374151;">Transfer</span>
            <span style="color:#2563EB;font-weight:600;font-size:9px;">trf_FQHf7IDksak</span>
            <div class="txn-chip">&#8377;100</div>
          </div>
        </div>
      </div>
      <div class="feature-card-body">
        <h3>Instant payment settlements</h3>
        <p>Receive payments directly to your bank account with real-time notifications and complete transaction records.</p>
      </div>
    </div>
  </div>
</section>

<!-- TAP SCAN PAY -->
<section class="tap-section">
  <div class="tap-header reveal">
    <h2>Tap, scan, pay anywhere with QR codes</h2>
    <p>Effortlessly accept payments across <span>in-store</span>, <span>online</span>, and <span>on-the-go</span> channels with Razorpay QR codes.</p>
  </div>
  <div class="use-cases-grid">
    <div class="use-case reveal">
      <svg class="uc-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path d="M6 2L3 6v14a2 2 0 002 2h14a2 2 0 002-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 01-8 0"/></svg>
      <h3>In-Store Payments</h3>
      <p>Display QR codes at checkout for quick, touch-free mobile payments.</p>
    </div>
    <div class="use-case reveal">
      <svg class="uc-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
      <h3>Seamless COD Payments</h3>
      <p>Reduce cash-handling <a href="#">risks with QR codes</a> for online orders and doorstep <a href="#">deliveries</a>.</p>
    </div>
    <div class="use-case reveal">
      <svg class="uc-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><rect x="1" y="4" width="22" height="16" rx="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
      <h3>Event &amp; Service Payments</h3>
      <p>Collect payments on the spot for events, subscriptions, and services with ease.</p>
    </div>
    <div class="use-case reveal">
      <svg class="uc-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/><path d="M16 3.13a4 4 0 010 7.75"/></svg>
      <h3>Multi-Location Businesses</h3>
      <p>Assign unique <a href="#">merchant QR codes</a> to different branches, franchises, or service points for better transaction tracking.</p>
    </div>
    <div class="use-case reveal">
      <svg class="uc-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/><path d="M1 1h4l2.68 13.39a2 2 0 002 1.61H19a2 2 0 002-1.8L23 6H6"/></svg>
      <h3>E-commerce &amp; Social Selling</h3>
      <p>Share QR codes via WhatsApp, social media, or email to collect payments seamlessly from anywhere.</p>
    </div>
  </div>
</section>

<!-- TRUSTED -->
<div class="trusted-section">
  <div class="trusted-left reveal">
    <h2>Trusted by businesses like yours</h2>
  </div>
  <div class="testimonials-grid">
    <div class="testimonial-card reveal">
      <div class="testimonial-brand">BOROSIL</div>
      <p>Razorpay has been a game changer for our business. We've seen a significant reduction in COD orders and returns, with our <a href="#">RTO rate dropping by 36.36%</a></p>
      <div>
        <div class="testimonial-author-name">Sarthak Vij</div>
        <div class="testimonial-author-title">Head of Digital, Borosil Limited</div>
      </div>
    </div>
    <div class="testimonial-card reveal">
      <div class="testimonial-brand dark">mokobara</div>
      <p>Card stack features like TokenHQ prevents the hassle of repeat customers re-entering card details. With <a href="#">60% of our customers paying via cards and 40% opting for UPI</a>, Razorpay handles every transaction effortlessly.</p>
      <div>
        <div class="testimonial-author-name">Nikhilendra Pratap Singh Deo</div>
        <div class="testimonial-author-title">Leading CRM &amp; Tech, Mokobara</div>
      </div>
    </div>
  </div>
</div>

<!-- SUPPLEMENT -->
<section class="supplement-section">
  <h2 class="section-title reveal">Supplement Seamlessly With Other<br>Razorpay Products</h2>
  <div class="products-grid">
    <div class="product-card reveal">
      <div class="product-card-header">
        <span class="product-label">Payment Links</span>
        <svg class="product-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><rect x="1" y="4" width="22" height="16" rx="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
      </div>
      <h3>Create and share links over email, text and social to accept payments instantly.</h3>
      <a href="#" class="know-more">Know more →</a>
    </div>
    <div class="product-card reveal">
      <div class="product-card-header">
        <span class="product-label">Payment Pages</span>
        <svg class="product-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><rect x="5" y="2" width="14" height="20" rx="2"/><line x1="9" y1="7" x2="15" y2="7"/><line x1="9" y1="11" x2="15" y2="11"/><line x1="9" y1="15" x2="12" y2="15"/></svg>
      </div>
      <h3>Accept payments without coding on a custom-branded store</h3>
      <a href="#" class="know-more">Know more →</a>
    </div>
    <div class="product-card reveal">
      <div class="product-card-header">
        <span class="product-label">Invoices</span>
        <svg class="product-icon" fill="none" stroke="currentColor" stroke-width="1.8" viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="9" y1="13" x2="15" y2="13"/><line x1="9" y1="17" x2="12" y2="17"/></svg>
      </div>
      <h3>Generate invoices, get instant payments from customers</h3>
      <a href="#" class="know-more">Know more →</a>
    </div>
  </div>
</section>

<!-- ===========================
     FOOTER — FIXED
  =========================== -->
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
  // Scroll reveal
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('visible');
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.08, rootMargin: '0px 0px -32px 0px' });

  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));

  // Stagger delay for grid children
  document.querySelectorAll('.features-grid .feature-card').forEach((el, i) => {
    el.style.transitionDelay = (i % 3) * 90 + 'ms';
  });
  document.querySelectorAll('.products-grid .product-card').forEach((el, i) => {
    el.style.transitionDelay = i * 80 + 'ms';
  });
  document.querySelectorAll('.use-cases-grid .use-case').forEach((el, i) => {
    el.style.transitionDelay = (i % 3) * 70 + 'ms';
  });

  // Nav shadow on scroll
  const nav = document.getElementById('navbar');
  window.addEventListener('scroll', () => {
    if(nav) nav.style.boxShadow = window.scrollY > 8 ? '0 2px 18px rgba(0,0,0,.09)' : 'none';
  }, { passive: true });
</script>
</body>
</html>
