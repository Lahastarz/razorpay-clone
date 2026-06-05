<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Pages - Razorpay</title>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap"
        rel="stylesheet">
    <style>
        :root {
            --blue: #2b6aed;
            --blue-hover: #1b53d0;
            --text-dark: #0f172a;
            --text-gray: #475569;
            --bg-light: #fafbfd;
            --dark-green: #093c31;
            --green-card: #0c4c3f;
            --border-light: #e2e8f0;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'DM Sans', sans-serif;
        }

        body {
            color: var(--text-dark);
            background: #ffffff;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
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


        /* HERO SECTION */
        .hero {
            background: #ffffff;
            padding: 60px 24px;
            position: relative;
            overflow: hidden;
        }

        .hero-bg {
            position: absolute;
            top: 0;
            right: 0;
            width: 45%;
            height: 100%;
            background: linear-gradient(180deg, #f0f6ff 0%, #ffffff 100%);
            z-index: 0;
        }

        .hero-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            gap: 40px;
            position: relative;
            z-index: 1;
        }

        .hero-content {
            flex: 1;
            padding-right: 40px;
        }

        .hero-title {
            font-size: 48px;
            font-weight: 800;
            line-height: 1.15;
            color: var(--text-dark);
            margin-bottom: 20px;
            letter-spacing: -1px;
        }

        .text-blue {
            color: var(--blue);
        }

        .hero-desc {
            font-size: 16px;
            color: var(--text-gray);
            line-height: 1.6;
            margin-bottom: 32px;
            max-width: 480px;
        }

        .btn-primary {
            background: var(--blue);
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 15px;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            transition: background 0.2s;
        }

        .btn-primary:hover {
            background: var(--blue-hover);
        }

        .hero-visual {
            flex: 1;
            position: relative;
            min-height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Visual Mocks */
        .mock-person {
            width: 320px;
            height: 400px;
            background: #a5c6f5;
            border-radius: 20px;
            position: relative;
            z-index: 2;
            display: flex;
            align-items: flex-end;
            justify-content: center;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
        }

        .mock-person-placeholder {
            width: 160px;
            height: 250px;
            background: #84aef0;
            border-radius: 80px 80px 0 0;
            position: relative;
        }

        .mock-person-placeholder::after {
            content: '';
            position: absolute;
            bottom: 40px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 80px;
            background: #333;
            border-radius: 8px;
        }

        .mock-form-card {
            position: absolute;
            top: 20px;
            left: -80px;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 240px;
            z-index: 3;
            border: 1px solid var(--border-light);
        }

        .mock-form-header {
            font-size: 14px;
            font-weight: 700;
            color: var(--blue);
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .mock-form-title {
            font-size: 16px;
            font-weight: 800;
            margin-bottom: 4px;
        }

        .mock-form-subtitle {
            font-size: 10px;
            color: #94a3b8;
            margin-bottom: 16px;
        }

        .mock-input {
            background: #f8fafc;
            border: 1px solid var(--border-light);
            border-radius: 4px;
            padding: 8px 10px;
            font-size: 10px;
            color: #94a3b8;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
        }

        .mock-input-label {
            font-size: 10px;
            color: #64748b;
            width: 50px;
        }

        .mock-chart-card {
            position: absolute;
            bottom: 40px;
            right: -40px;
            background: white;
            padding: 16px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 180px;
            z-index: 3;
            border: 1px solid var(--border-light);
        }

        .mock-chart-title {
            font-size: 10px;
            color: var(--text-gray);
            margin-bottom: 4px;
        }

        .mock-chart-val {
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 12px;
        }

        .mock-bars {
            display: flex;
            align-items: flex-end;
            gap: 4px;
            height: 40px;
        }

        .mock-bar {
            flex: 1;
            background: var(--blue);
            border-radius: 2px 2px 0 0;
        }

        .tag-nocode {
            position: absolute;
            top: 40px;
            right: 40px;
            background: #3b82f6;
            color: white;
            padding: 4px 12px;
            font-size: 11px;
            font-weight: 700;
            border-radius: 4px;
            z-index: 4;
            letter-spacing: 0.5px;
        }

        /* BRANDS */
        .brands-strip {
            background: var(--bg-light);
            padding: 30px 24px;
            border-bottom: 1px solid var(--border-light);
            border-top: 1px solid var(--border-light);
        }

        .brands-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            opacity: 0.6;
        }

        .brand-item {
            font-size: 18px;
            font-weight: 800;
            color: #64748b;
        }

        /* FEATURES SECTION */
        .features-section {
            padding: 80px 24px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 50px;
        }

        .section-title {
            font-size: 38px;
            font-weight: 800;
            line-height: 1.2;
            letter-spacing: -0.5px;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 40px;
            row-gap: 50px;
        }

        .feature-item {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .feature-icon {
            color: var(--blue);
            font-size: 24px;
            margin-bottom: 4px;
        }

        .feature-title {
            font-size: 18px;
            font-weight: 700;
            color: var(--text-dark);
        }

        .feature-desc {
            font-size: 15px;
            color: var(--text-gray);
            line-height: 1.6;
        }

        /* DASHBOARD PREVIEW */
        .dashboard-section {
            background: #ffffff;
            padding: 60px 24px;
            text-align: center;
        }

        .dash-heading {
            font-size: 42px;
            font-weight: 800;
            max-width: 800px;
            margin: 0 auto 16px;
            letter-spacing: -1px;
            line-height: 1.2;
        }

        .dash-sub {
            font-size: 16px;
            color: var(--text-gray);
            max-width: 600px;
            margin: 0 auto 40px;
            line-height: 1.6;
        }

        .dashboard-mockup {
            max-width: 1000px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
            border: 1px solid var(--border-light);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            text-align: left;
        }

        .dash-browser-bar {
            background: #f8fafc;
            padding: 12px 16px;
            border-bottom: 1px solid var(--border-light);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .dash-dot {
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }

        .dash-url {
            margin: 0 auto;
            background: #e2e8f0;
            border-radius: 4px;
            padding: 4px 100px;
            font-size: 12px;
            color: #64748b;
        }

        .dash-body {
            display: flex;
            height: 400px;
            background: #f8fafc;
        }

        .dash-sidebar {
            width: 200px;
            background: #ffffff;
            border-right: 1px solid var(--border-light);
            padding: 20px 0;
        }

        .dash-side-item {
            padding: 10px 20px;
            font-size: 13px;
            color: #475569;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .dash-side-item.active {
            background: #eff6ff;
            color: var(--blue);
            font-weight: 600;
            border-right: 3px solid var(--blue);
        }

        .dash-main {
            flex: 1;
            padding: 24px;
            background: #ffffff;
            margin: 16px;
            border-radius: 8px;
            border: 1px solid var(--border-light);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
        }

        .dash-stats-row {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        .dash-stat {
            flex: 1;
        }

        .dash-stat-label {
            font-size: 12px;
            color: #64748b;
            margin-bottom: 8px;
        }

        .dash-stat-val {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 4px;
        }

        .dash-stat-diff {
            font-size: 11px;
            color: #22c55e;
            font-weight: 600;
        }

        .dash-chart-area {
            height: 180px;
            background: linear-gradient(180deg, #eff6ff 0%, #ffffff 100%);
            border-bottom: 2px solid var(--blue);
            position: relative;
        }

        .dash-chart-area::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 100%;
            height: 40px;
            background: url('data:image/svg+xml;utf8,<svg viewBox="0 0 100 20" xmlns="http://www.w3.org/2000/svg"><path d="M0 10 Q 25 0 50 10 T 100 10" fill="none" stroke="%232b6aed" stroke-width="2"/></svg>') repeat-x;
            background-size: 100px 20px;
        }

        /* NO-CODE STACK */
        .nocode-section {
            background: var(--dark-green);
            padding: 80px 24px;
            color: white;
        }

        .nocode-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .nocode-title {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 50px;
            line-height: 1.2;
            max-width: 700px;
        }

        .nocode-highlight {
            color: #4ade80;
        }

        .nocode-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .nocode-card {
            background: var(--green-card);
            border-radius: 12px;
            padding: 30px 24px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            flex-direction: column;
            gap: 16px;
            transition: transform 0.2s;
        }

        .nocode-card:hover {
            transform: translateY(-4px);
        }

        .nc-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 16px;
            font-weight: 600;
            color: #e2e8f0;
        }

        .nc-icon {
            font-size: 20px;
        }

        .nc-desc {
            font-size: 18px;
            font-weight: 700;
            line-height: 1.4;
            flex: 1;
        }

        .nc-link {
            font-size: 14px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 4px;
            margin-top: auto;
            color: #cbd5e1;
        }

        .nc-link:hover {
            color: white;
        }

        /* TESTIMONIALS */
        .testimonials {
            padding: 80px 24px;
            background: #ffffff;
            border-bottom: 1px solid var(--border-light);
        }

        .testi-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            gap: 60px;
            align-items: center;
        }

        .testi-left {
            flex: 0 0 300px;
        }

        .testi-title {
            font-size: 40px;
            font-weight: 800;
            line-height: 1.15;
            letter-spacing: -1px;
        }

        .testi-grid {
            flex: 1;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 24px;
        }

        .testi-card {
            background: #ffffff;
            border: 1px solid var(--border-light);
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.03);
            display: flex;
            flex-direction: column;
        }

        .testi-logo {
            font-weight: 800;
            font-size: 16px;
            margin-bottom: 24px;
            color: #334155;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .testi-quote {
            font-size: 15px;
            color: var(--text-gray);
            line-height: 1.6;
            margin-bottom: 32px;
            flex: 1;
        }

        .testi-author {
            font-size: 14px;
            font-weight: 700;
            color: var(--text-dark);
        }

        .testi-role {
            font-size: 12px;
            color: #64748b;
            font-weight: 400;
        }

        /* FAQ */
        .faq {
            padding: 80px 24px;
            background: #ffffff;
        }

        .faq-container {
            max-width: 1000px;
            margin: 0 auto;
            display: flex;
            gap: 60px;
            align-items: flex-start;
        }

        .faq-left {
            flex: 0 0 300px;
        }

        .faq-title {
            font-size: 36px;
            font-weight: 800;
            line-height: 1.15;
            position: sticky;
            top: 100px;
        }

        .faq-list {
            flex: 1;
        }

        .faq-item {
            border-bottom: 1px solid var(--border-light);
        }

        .faq-question {
            width: 100%;
            background: none;
            border: none;
            text-align: left;
            padding: 24px 0;
            font-size: 15px;
            font-weight: 500;
            color: var(--text-dark);
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            outline: none;
        }

        .faq-icon {
            color: #94a3b8;
            transition: transform 0.3s;
        }

        .faq-item.active .faq-icon {
            transform: rotate(180deg);
        }

        .faq-answer {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease;
        }

        .faq-answer-inner {
            padding-bottom: 24px;
            font-size: 14px;
            color: var(--text-gray);
            line-height: 1.6;
        }


        /* ===========================
   FOOTER
=========================== */
        /* .footer { background: #0a0f1e; color: white; padding: 60px 32px 32px; }
.footer-container { max-width: 1280px; margin: 0 auto; }

.footer-top { display: grid; grid-template-columns: 1.5fr repeat(4,1fr); gap: 48px; padding-bottom: 48px; border-bottom: 1px solid rgba(255,255,255,0.08); }

.footer-logo { display: flex; align-items: center; gap: 10px; font-size: 20px; font-weight: 800; margin-bottom: 16px; }

.footer-logo-icon { background: #2563eb; width: 30px; height: 30px; border-radius: 6px; display: flex; align-items: center; justify-content: center; font-size: 16px; }

.footer-brand p { font-size: 14px; color: #94a3b8; line-height: 1.7; max-width: 240px; }

.footer-col h4 { font-size: 12px; font-weight: 700; letter-spacing: 0.5px; text-transform: uppercase; color: #94a3b8; margin-bottom: 16px; }

.footer-col ul { display: flex; flex-direction: column; gap: 10px; }
.footer-col ul a { font-size: 14px; color: #cbd5e1; transition: color 0.2s; }
.footer-col ul a:hover { color: white; }

.footer-bottom { display: flex; justify-content: space-between; align-items: center; padding-top: 24px; flex-wrap: wrap; gap: 12px; }
.footer-bottom p { font-size: 13px; color: #64748b; }
.footer-links { display: flex; gap: 20px; }
.footer-links a { font-size: 13px; color: #64748b; transition: color 0.2s; }
.footer-links a:hover { color: white; } */
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



        /* ===========================
   RESPONSIVE
=========================== */
        @media (max-width: 1024px) {
            .feature-cards {
                grid-template-columns: repeat(2, 1fr);
            }

            .testimonial-cards {
                grid-template-columns: repeat(2, 1fr);
            }

            .footer-top {
                grid-template-columns: 1fr 1fr;
            }

            .nocode-cards {
                grid-template-columns: 1fr;
            }

            .dev-tryout {
                flex-direction: column;
                gap: 40px;
            }
        }

        @media (max-width: 768px) {

            .nav-links,
            .nav-actions {
                display: none;
            }

            .hamburger {
                display: flex;
            }

            .hero-container {
                flex-direction: column;
                padding: 48px 24px;
            }

            .hero-content h1 {
                font-size: 34px;
            }

            .hero-visual {
                max-width: 100%;
                width: 100%;
            }

            .sprint-inner {
                flex-direction: column;
                padding: 40px 28px;
                gap: 32px;
            }

            .sprint-content h2 {
                font-size: 42px;
            }

            .sprint-cards {
                display: none;
            }

            .features-container h2 {
                font-size: 30px;
            }

            .feature-cards {
                grid-template-columns: 1fr;
            }

            .dev-top h2 {
                font-size: 28px;
            }

            .dev-cards {
                grid-template-columns: 1fr;
                gap: 32px;
            }

            .dev-tryout {
                flex-direction: column;
                gap: 32px;
            }

            .tryout-left h3 {
                font-size: 26px;
            }

            .nocode-heading {
                font-size: 28px;
            }

            .nocode-cards {
                grid-template-columns: 1fr;
            }

            .testimonial-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
            }

            .testimonial-cards {
                grid-template-columns: 1fr 1fr;
            }

            .testimonial-card.featured {
                transform: none;
            }

            .faq-container {
                grid-template-columns: 1fr;
                gap: 32px;
            }

            .faq-left h2 {
                position: static;
                font-size: 28px;
            }

            .footer-top {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 480px) {
            .testimonial-cards {
                grid-template-columns: 1fr;
            }

            .footer-top {
                grid-template-columns: 1fr;
            }

            .brands-container {
                gap: 14px;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
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
                                <a href="Payments/Payment_Aggregator.jsp" target="_blank" class="mega-item">
                                    <div class="mega-icon">&#9646;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Aggregator</span>
                                        <span class="mega-desc">Accepting payments made easy for businesses</span>
                                    </div>
                                </a>
                                <a href="Payments/Payment_Gateway.jsp" target="_blank" class="mega-item">
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
                                <a href="Payments/Payments_Page.jsp" target="_blank" class="mega-item">
                                    <div class="mega-icon">&#128196;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Pages</span>
                                        <span class="mega-desc">Get paid with personalized page</span>
                                    </div>
                                </a>
                                <a href="Payments/QR_Codes.jsp" target="_blank" class="mega-item">
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
                                        <span class="mega-title">Accept Payments from India <span
                                                class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Seamless INR collections via UPI &amp; cards</span>
                                    </div>
                                </a>
                                <p class="col-heading" style="margin-top:20px;">ALL-IN-ONE PAYMENTS</p>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9881;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Omnichannel Payments <span
                                                class="tag-new">NEW</span></span>
                                        <span class="mega-desc">One Payment Platform for All Channels</span>
                                    </div>
                                </a>
                            </div>

                        </div>
                        <div class="mega-footer">
                            Payment aggregation services provided by Razorpay Payments Private Limited, an RBI
                            Authorised Payment Aggregator
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
                                <a href="Banking_Plus/RazorpayX.jsp" target="_blank" class="mega-item">
                                    <div class="mega-icon mega-icon-x">X</div>
                                    <div class="mega-text">
                                        <span class="mega-title">RazorpayX</span>
                                        <span class="mega-desc">Business Banking Supercharged for disruptors</span>
                                    </div>
                                </a>
                                <a href="Banking_Plus/VendorPayments.jsp" target="_blank" class="mega-item">
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
                                        <span class="mega-title">Forex/FDI Transfers <span
                                                class="tag-new">NEW</span></span>
                                        <span class="mega-desc">Expert-led service to bring foreign currency</span>
                                    </div>
                                </a>
                                <a href="#" class="mega-item">
                                    <div class="mega-icon">&#9989;</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Bank Account Verification <span
                                                class="tag-new">NEW</span></span>
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
                            Business Banking+ is operated under RZPX Limited where the banking services are provided by
                            scheduled commercial banks. Digital Lending is operated under Razorpay Tech Solutions
                            Private Limited, a Lending Service Provider to Regulated Entities authorised by RBI.
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
            <!-- <div class="nav-actions">
                <button class="btn-login">Login</button>
                <button class="btn-signup">Sign Up &rarr;</button>
            </div> -->

            <!-- Right Side Buttons -->
            <!-- <div class="nav-actions">
                <button class="btn-login">Login</button>
                <button class="btn-signup">Sign Up &rarr;</button>
            </div> -->
            <div class="nav-btns">
                <div class="hamburger" id="hamburger">☰</div>
                <a href="Login.jsp" target="_blank" class="btn-login">Log In</a>
                <a href="SignUp.jsp" target="_blank" class="btn-signup">Sign Up</a>
            </div>

            <!-- Hamburger -->
            <div class="hamburger" id="hamburger">
                <span></span>
                <span></span>
                <span></span>
            </div>

        </nav>
    </header>

    <!-- HERO -->
    <section class="hero">
        <div class="hero-bg"></div>
        <div class="hero-container">
            <div class="hero-content">
                <h1 class="hero-title">Sell Without a Website, Create <span class="text-blue">Payment Pages</span></h1>
                <p class="hero-desc">With Razorpay Payment Pages, create custom-branded pages, accept payments
                    instantly, and get automated receipts. All in minutes, no coding needed.</p>
                <button class="btn-primary">Sign up &rarr;</button>
            </div>
            <div class="hero-visual">
                <div class="tag-nocode">NO CODE</div>
                <div class="mock-person">
                    <div class="mock-person-placeholder"></div>
                </div>

                <div class="mock-form-card">
                    <div class="mock-form-header">
                        <span>📖 EDUVision</span>
                    </div>
                    <div class="mock-form-title">Digital Marketing Course</div>
                    <div class="mock-form-subtitle">COHORT 04</div>

                    <div style="font-size:10px; font-weight:700; margin-bottom:8px;">Payment details</div>

                    <div class="mock-input">
                        <span class="mock-input-label">Name</span>
                        <span>Enter full name</span>
                    </div>
                    <div class="mock-input">
                        <span class="mock-input-label">Email</span>
                        <span>Enter email address</span>
                    </div>
                    <div class="mock-input" style="border-color:#3b82f6;">
                        <span class="mock-input-label">Amount</span>
                        <span style="color:#0f172a; font-weight:700;">₹5500</span>
                    </div>
                </div>

                <div class="mock-chart-card">
                    <div class="mock-chart-title">Net Sales</div>
                    <div class="mock-chart-val">₹23,500</div>
                    <div class="mock-bars">
                        <div class="mock-bar" style="height: 20%;"></div>
                        <div class="mock-bar" style="height: 30%;"></div>
                        <div class="mock-bar" style="height: 25%;"></div>
                        <div class="mock-bar" style="height: 40%;"></div>
                        <div class="mock-bar" style="height: 35%;"></div>
                        <div class="mock-bar" style="height: 50%;"></div>
                        <div class="mock-bar" style="height: 80%;"></div>
                        <div class="mock-bar" style="height: 60%;"></div>
                        <div class="mock-bar" style="height: 90%;"></div>
                        <div class="mock-bar" style="height: 70%;"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- BRANDS -->
    <div class="brands-strip">
        <div class="brands-container">
            <span class="brand-item">Ram Fincorp</span>
            <span class="brand-item">upstox</span>
            <span class="brand-item">FARMRISE</span>
            <span class="brand-item">bewakoof</span>
            <span class="brand-item">MIRAE ASSET</span>
            <span class="brand-item">Swiggy</span>
            <span class="brand-item">SBM bank</span>
            <span class="brand-item">india gold</span>
        </div>
    </div>

    <!-- FEATURES -->
    <section class="features-section">
        <div class="section-header">
            <h2 class="section-title">The Fastest Way to<br><span class="text-blue">Accept Payments Online</span></h2>
            <button class="btn-primary">Sign up now &rarr;</button>
        </div>

        <div class="features-grid">
            <div class="feature-item">
                <div class="feature-icon">{'</>'}</div>
                <div class="feature-title">No Coding Required</div>
                <div class="feature-desc">Create Payment Pages, customise layouts, and launch a payment web page without
                    coding. We build and host everything for you.</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">🧾</div>
                <div class="feature-title">Automated Receipts</div>
                <div class="feature-desc">Every payment made via your hosted payment page triggers automated receipts,
                    reducing manual work.</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">🔗</div>
                <div class="feature-title">Custom URLs</div>
                <div class="feature-desc">Look professional with a custom URL for your payment page website, making it
                    easy to remember and share.</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">📄</div>
                <div class="feature-title">Branded Page</div>
                <div class="feature-desc">Design custom payment pages that match your brand colours for seamless
                    customer experience.</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">💳</div>
                <div class="feature-title">Custom Fields</div>
                <div class="feature-desc">Collect information relevant and important to your business by adding and
                    modifying fields on the Payment Page.</div>
            </div>
            <div class="feature-item">
                <div class="feature-icon">📊</div>
                <div class="feature-title">Real-time tracking</div>
                <div class="feature-desc">Get insights from real-time data and track activity across all your <i>payment
                        pages</i> from the dashboard.</div>
            </div>
        </div>
    </section>

    <!-- DASHBOARD -->
    <section class="dashboard-section">
        <h2 class="dash-heading">Create, Share, Track,<br>all from a <span class="text-blue">Single Dashboard</span>
        </h2>
        <p class="dash-sub">Generate Payment Pages, share them with customers, and track every transaction, all from a
            single dashboard built for speed and control.</p>

        <div class="dashboard-mockup">
            <div class="dash-browser-bar">
                <div class="dash-dot" style="background:#ff5f56;"></div>
                <div class="dash-dot" style="background:#ffbd2e;"></div>
                <div class="dash-dot" style="background:#27c93f;"></div>
                <div class="dash-url">🔒 https://razorpay.com/</div>
            </div>
            <div class="dash-body">
                <div class="dash-sidebar">
                    <div class="dash-side-item">🏠 Home</div>
                    <div class="dash-side-item">↔ Transactions</div>
                    <div class="dash-side-item">💰 Settlements</div>
                    <div class="dash-side-item">📊 Reports</div>
                    <div style="font-size:10px; color:#94a3b8; padding: 16px 20px 8px; font-weight:700;">RECENTLY USED
                    </div>
                    <div class="dash-side-item">🔗 Payment Links</div>
                    <div class="dash-side-item">✨ Magic Checkout</div>
                    <div class="dash-side-item active">📄 Payment Pages</div>
                </div>
                <div class="dash-main">
                    <h3 style="font-size:18px; font-weight:700; margin-bottom: 24px;">Payments overview</h3>
                    <div class="dash-stats-row">
                        <div class="dash-stat">
                            <div class="dash-stat-label">Collected amount ⓘ</div>
                            <div class="dash-stat-val">₹39,000.00 <span class="dash-stat-diff">▲ +14%</span></div>
                            <div class="dash-stat-label" style="font-size:11px;">₹5600 above than previous week</div>
                        </div>
                        <div class="dash-stat">
                            <div class="dash-stat-label">Refunds ⓘ</div>
                            <div class="dash-stat-val">₹10,000.00 <span class="dash-stat-diff">▲ +14%</span></div>
                            <div class="dash-stat-label" style="font-size:11px;">₹5600 above than previous week</div>
                        </div>
                        <div class="dash-stat">
                            <div class="dash-stat-label">Disputes ⓘ</div>
                            <div class="dash-stat-val">₹10,000.00 <span class="dash-stat-diff">▲ +14%</span></div>
                            <div class="dash-stat-label" style="font-size:11px;">₹5600 above than previous week</div>
                        </div>
                    </div>
                    <div class="dash-chart-area"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- NO-CODE STACK -->
    <section class="nocode-section">
        <div class="nocode-container">
            <h2 class="nocode-title">Use Razorpay Payment Pages<br>With The Rest of Our <span
                    class="nocode-highlight">No-Code Stack</span></h2>

            <div class="nocode-grid">
                <div class="nocode-card">
                    <div class="nc-header">
                        <span>Invoices</span>
                        <span class="nc-icon">🧾</span>
                    </div>
                    <div class="nc-desc">Generate invoices, get instant payments from customers</div>
                    <a href="#" class="nc-link">Know More &rarr;</a>
                </div>
                <div class="nocode-card">
                    <div class="nc-header">
                        <span>Payment Links</span>
                        <span class="nc-icon">🔗</span>
                    </div>
                    <div class="nc-desc">Create and share links over email, SMS and social media platforms to accept
                        payments instantly.</div>
                    <a href="#" class="nc-link">Know More &rarr;</a>
                </div>
                <div class="nocode-card">
                    <div class="nc-header">
                        <span>Smart Collect</span>
                        <span class="nc-icon">⚡</span>
                    </div>
                    <div class="nc-desc">Now accept NEFT, RTGS & IMPS transfers through customer identifiers that can be
                        generated on-demand</div>
                    <a href="#" class="nc-link">Know More &rarr;</a>
                </div>
            </div>
        </div>
    </section>

    <!-- TESTIMONIALS -->
    <section class="testimonials">
        <div class="testi-container">
            <div class="testi-left">
                <h2 class="testi-title">Trusted by<br><span class="text-blue">businesses</span> like<br>yours</h2>
            </div>
            <div class="testi-grid">
                <div class="testi-card">
                    <div class="testi-logo"><span>B</span> FinanceBazaar</div>
                    <div class="testi-quote">We had the option to use any payment gateway company in India but we chose
                        Razorpay as their response time is excellent and the team is so friendly to work with. It seems
                        like they really want your business to succeed. The best part of Razorpay I like is their
                        payment pages which help us to use links to collect payments easily.</div>
                    <div>
                        <div class="testi-author">Avik Kedia</div>
                        <div class="testi-role">Founder & CEO, FinanceBazaar</div>
                    </div>
                </div>
                <div class="testi-card">
                    <div class="testi-logo"><span>Q</span> QuickSell</div>
                    <div class="testi-quote">Razorpay's Payment Pages has helped us in accepting payments for our
                        products more conveniently. Payment Pages is a quick and easy solution to accept payments
                        without the hassle and resources required for setting up a page and integrating a payment
                        gateway and no need to set up custom links again and again for every payee.</div>
                    <div>
                        <div class="testi-author">Deepak Bhagchandani</div>
                        <div class="testi-role">Founder & CEO, QuickSell</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ -->
    <section class="faq">
        <div class="faq-container">
            <div class="faq-left">
                <h2 class="faq-title">Frequently asked<br>questions</h2>
            </div>
            <div class="faq-list">
                <div class="faq-item">
                    <button class="faq-question">
                        How do Razorpay Payment Pages work?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Payment pages allow you to quickly generate a hosted web page to collect payments from your
                            customers without writing any code. You can customize the fields and branding to match your
                            needs.
                        </div>
                    </div>
                </div>
                <div class="faq-item">
                    <button class="faq-question">
                        How to create a page to collect payments?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Simply log into your Razorpay Dashboard, navigate to Payment Pages, choose a template or
                            start from scratch, customize your fields, and hit publish. You can then share the URL with
                            your customers.
                        </div>
                    </div>
                </div>
                <div class="faq-item">
                    <button class="faq-question">
                        Can I customize the Razorpay Payment Pages design?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            Yes, you can customize the colors, logos, and layout to ensure the payment page aligns
                            perfectly with your brand identity.
                        </div>
                    </div>
                </div>
                <div class="faq-item">
                    <button class="faq-question">
                        How secure are Razorpay Payment Pages?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            They are 100% secure. Razorpay is PCI DSS Level 1 compliant, meaning all transactions and
                            customer data are encrypted and handled with the highest level of security.
                        </div>
                    </div>
                </div>
                <div class="faq-item">
                    <button class="faq-question">
                        What should be present on a payment page?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            A payment page typically includes customer details (name, email, phone), amount details,
                            terms and conditions, and a clear Pay button.
                        </div>
                    </div>
                </div>
                <div class="faq-item">
                    <button class="faq-question">
                        Are there any setup or maintenance charges for using Razorpay Payment Pages?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            No, creating and hosting Payment Pages is completely free. You only pay standard transaction
                            fees when you successfully receive a payment.
                        </div>
                    </div>
                </div>
                <div class="faq-item">
                    <button class="faq-question">
                        What payment methods are supported on the Razorpay Payment Page?
                        <span class="faq-icon">⌄</span>
                    </button>
                    <div class="faq-answer">
                        <div class="faq-answer-inner">
                            We support over 100+ payment methods including Credit/Debit Cards, Netbanking, UPI, Wallets,
                            and EMI options.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
        // ===========================
        // NAVBAR — Scroll Shadow
        // ===========================
        window.addEventListener('scroll', function () {
            var navbar = document.getElementById('navbar');
            if (window.scrollY > 10) {
                navbar.style.boxShadow = '0 2px 16px rgba(0,0,0,0.08)';
            } else {
                navbar.style.boxShadow = 'none';
            }
        });
        // ===========================
        // HAMBURGER — Mobile Menu
        // ===========================
        var hamburger = document.getElementById('hamburger');
        var navLinks = document.getElementById('nav-links');

        hamburger.addEventListener('click', function () {
            var isOpen = navLinks.style.display === 'flex';
            if (isOpen) {
                navLinks.style.display = 'none';
            } else {
                navLinks.style.display = 'flex';
                navLinks.style.flexDirection = 'column';
                navLinks.style.position = 'absolute';
                navLinks.style.top = '66px';
                navLinks.style.left = '0';
                navLinks.style.right = '0';
                navLinks.style.background = 'white';
                navLinks.style.padding = '16px 24px';
                navLinks.style.borderBottom = '1px solid #e5e7eb';
                navLinks.style.zIndex = '998';
                navLinks.style.gap = '4px';
                navLinks.style.height = 'auto';
                navLinks.style.boxShadow = '0 8px 24px rgba(0,0,0,0.08)';
            }
        });



        // FAQ Accordion functionality
        document.querySelectorAll('.faq-question').forEach(button => {
            button.addEventListener('click', () => {
                const faqItem = button.parentElement;
                const answer = button.nextElementSibling;

                // Close other open items
                document.querySelectorAll('.faq-item').forEach(item => {
                    if (item !== faqItem && item.classList.contains('active')) {
                        item.classList.remove('active');
                        item.querySelector('.faq-answer').style.maxHeight = null;
                    }
                });

                // Toggle current item
                faqItem.classList.toggle('active');

                if (faqItem.classList.contains('active')) {
                    answer.style.maxHeight = answer.scrollHeight + "px";
                } else {
                    answer.style.maxHeight = null;
                }
            });
        });
    </script>
</body>

</html>