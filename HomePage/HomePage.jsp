<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RazorPay - Payment Partner</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Inline CSS -->
    <style>
/* ===========================
   RESET & BASE
=========================== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: 'DM Sans', sans-serif;
    color: #0f172a;
    background: #fff;
    overflow-x: hidden;
}

a {
    text-decoration: none;
    color: inherit;
}

ul {
    list-style: none;
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

/* ===========================
   HERO
=========================== */
.hero {
    background: linear-gradient(150deg, #f0f6ff 0%, #e8f0fe 50%, #f5f9ff 100%);
    min-height: 580px;
    display: flex;
    align-items: center;
}

.hero-container {
    max-width: 1280px;
    margin: 0 auto;
    padding: 80px 32px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 48px;
    width: 100%;
}

.hero-content {
    flex: 1;
    max-width: 540px;
}

.hero-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: #dbeafe;
    color: #2563eb;
    padding: 6px 14px;
    border-radius: 100px;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 24px;
}

.badge-dot {
    width: 6px;
    height: 6px;
    background: #2563eb;
    border-radius: 50%;
    display: inline-block;
}

.hero-content h1 {
    font-size: 50px;
    font-weight: 800;
    line-height: 1.15;
    color: #0f172a;
    letter-spacing: -1px;
}

.hero-highlight {
    color: #2563eb;
}

.hero-sub {
    margin-top: 18px;
    font-size: 15px;
    color: #6b7280;
    line-height: 1.6;
}

.hero-buttons {
    margin-top: 32px;
    display: flex;
    align-items: center;
    gap: 16px;
}

.btn-primary {
    background: #2563eb;
    color: white;
    padding: 14px 28px;
    border-radius: 8px;
    font-weight: 700;
    font-size: 15px;
    display: inline-flex;
    align-items: center;
    gap: 6px;
    transition: background 0.2s, transform 0.15s;
}

.btn-primary:hover {
    background: #1d4ed8;
    transform: translateY(-1px);
}

.btn-outline {
    color: #2563eb;
    font-weight: 600;
    font-size: 15px;
    padding: 14px 8px;
    transition: opacity 0.2s;
}

.btn-outline:hover {
    opacity: 0.7;
}

.hero-visual {
    flex: 1;
    max-width: 520px;
    display: flex;
    align-items: center;
    gap: 12px;
}

.hero-card {
    background: white;
    border-radius: 16px;
    box-shadow: 0 20px 60px rgba(37, 99, 235, 0.15);
    padding: 24px;
    flex: 1;
}

.hero-card-logo {
    font-size: 12px;
    font-weight: 700;
    color: #555;
    background: #f0f4f8;
    padding: 8px 12px;
    border-radius: 8px;
    display: inline-block;
    margin-bottom: 14px;
}

.hero-card-title {
    font-size: 12px;
    color: #6b7280;
    font-weight: 500;
    margin-bottom: 12px;
}

.hero-chart-bars {
    display: flex;
    align-items: flex-end;
    gap: 8px;
    height: 80px;
    margin-bottom: 16px;
}

.bar {
    flex: 1;
    border-radius: 4px 4px 0 0;
    background: linear-gradient(to top, #2563eb, #60a5fa);
    opacity: 0.8;
    transition: opacity 0.2s;
}

.bar:hover {
    opacity: 1;
}

.hero-card-statement {
    border-top: 1px solid #f0f0f0;
    padding-top: 14px;
}

.statement-label {
    font-size: 12px;
    color: #6b7280;
    margin-bottom: 8px;
}

.statement-row {
    display: flex;
    justify-content: space-between;
    font-size: 13px;
    color: #333;
    margin-bottom: 6px;
    font-weight: 500;
}

.hero-card-footer {
    margin-top: 12px;
    text-align: right;
    font-size: 11px;
    color: #999;
    font-style: italic;
}

.carousel-arrow {
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 50%;
    width: 36px;
    height: 36px;
    font-size: 20px;
    color: #374151;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    transition: all 0.2s;
}

.carousel-arrow:hover {
    background: #2563eb;
    color: white;
    border-color: #2563eb;
}

/* ===========================
   HELP BAR
=========================== */
.help-bar {
    padding: 20px 32px;
}

.help-bar-container {
    max-width: 1280px;
    margin: 0 auto;
    background: white;
    border: 1px solid #e5e7eb;
    border-radius: 12px;
    padding: 14px 28px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
    display: flex;
    align-items: center;
    gap: 8px;
    flex-wrap: wrap;
}

.help-label {
    font-size: 14px;
    font-weight: 700;
    color: #0f172a;
    padding-right: 16px;
    border-right: 1px solid #e5e7eb;
    margin-right: 8px;
}

.help-bar-container a {
    display: flex;
    align-items: center;
    gap: 6px;
    padding: 7px 14px;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 500;
    color: #374151;
    transition: background 0.15s, color 0.15s;
}

.help-bar-container a:hover {
    background: #f1f5f9;
    color: #2563eb;
}

/* ===========================
   BRANDS STRIP
=========================== */
.brands-strip {
    padding: 36px 32px;
    border-top: 1px solid #f0f0f0;
    border-bottom: 1px solid #f0f0f0;
}

.brands-container {
    max-width: 1280px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 20px;
}

.brand-item {
    font-size: 17px;
    font-weight: 800;
    color: #9ca3af;
    letter-spacing: -0.5px;
    cursor: default;
    transition: color 0.2s;
}

.brand-item:hover {
    color: #0f172a;
}

.brand-item.bordered {
    border: 1.5px solid #d1d5db;
    padding: 4px 10px;
    border-radius: 6px;
}

/* ===========================
   SPRINT BANNER
=========================== */
.sprint-banner {
    padding: 0 32px 40px;
}

.sprint-inner {
    max-width: 1280px;
    margin: 0 auto;
    background: #1a3df0;
    border-radius: 20px;
    padding: 56px 64px;
    color: white;
    display: flex;
    align-items: center;
    justify-content: space-between;
    overflow: hidden;
    position: relative;
}

.sprint-inner::before {
    content: '';
    position: absolute;
    right: -80px;
    top: -80px;
    width: 400px;
    height: 400px;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.08) 0%, transparent 70%);
    border-radius: 50%;
}

.sprint-content {
    position: relative;
    z-index: 1;
}

.sprint-content h2 {
    font-size: 64px;
    font-weight: 900;
    letter-spacing: -3px;
    line-height: 1;
    margin-bottom: 12px;
}

.sprint-content p {
    font-size: 22px;
    line-height: 1.5;
    opacity: 0.9;
}

.sprint-content a {
    display: inline-block;
    margin-top: 20px;
    color: white;
    font-size: 15px;
    font-weight: 600;
    text-decoration: underline;
    text-underline-offset: 3px;
    opacity: 0.9;
    transition: opacity 0.2s;
}

.sprint-content a:hover {
    opacity: 1;
}

.sprint-cards {
    display: flex;
    gap: 16px;
    align-items: center;
    position: relative;
    z-index: 1;
}

.sprint-card {
    background: rgba(0, 0, 0, 0.4);
    border-radius: 12px;
    padding: 18px;
    color: white;
    min-width: 130px;
}

.sprint-card-title {
    font-size: 14px;
    font-weight: 800;
    margin-bottom: 10px;
    line-height: 1.4;
}

.sprint-tag {
    background: #22c55e;
    color: #0d2137;
    padding: 3px 10px;
    border-radius: 100px;
    font-size: 10px;
    font-weight: 800;
    display: inline-block;
}

/* ===========================
   FEATURES
=========================== */
.features {
    padding: 80px 32px;
}

.features-container {
    max-width: 1280px;
    margin: 0 auto;
}

.features-container h2 {
    font-size: 46px;
    font-weight: 800;
    color: #0f172a;
    line-height: 1.2;
    letter-spacing: -1px;
}

.green-text {
    color: #16a34a;
}

.features-sub {
    margin-top: 12px;
    font-size: 15px;
    color: #6b7280;
}

.feature-tabs {
    display: flex;
    margin-top: 32px;
    border-bottom: 2px solid #e5e7eb;
    flex-wrap: wrap;
}

.tab-btn {
    background: none;
    border: none;
    padding: 12px 20px;
    font-size: 14px;
    font-weight: 500;
    color: #6b7280;
    border-bottom: 2px solid transparent;
    margin-bottom: -2px;
    cursor: pointer;
    font-family: 'DM Sans', sans-serif;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: all 0.2s;
}

.tab-btn:hover {
    color: #0f172a;
}

.tab-btn.active {
    color: #0f172a;
    border-bottom-color: #2563eb;
    font-weight: 700;
}

.tab-new {
    background: #ef4444;
    color: white;
    font-size: 10px;
    padding: 2px 7px;
    border-radius: 100px;
    font-weight: 700;
}

.feature-cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-top: 40px;
}

.feat-card {
    border: 1px solid #e5e7eb;
    border-radius: 16px;
    padding: 20px;
    min-height: 200px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    transition: box-shadow 0.2s, transform 0.2s;
}

.feat-card:hover {
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
    transform: translateY(-2px);
}

.card-light-blue {
    background: #f0f7ff;
}

.card-dark-blue {
    background: #1a3df0;
    color: white;
}

.card-grey {
    background: #f8f8f8;
}

.card-white {
    background: #ffffff;
}

.feat-tag {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.5px;
    color: #6b7280;
    text-transform: uppercase;
    margin-bottom: 8px;
}

.feat-tag.light {
    color: rgba(255, 255, 255, 0.6);
}

.feat-card h4 {
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 6px;
}

.feat-card p {
    font-size: 12px;
    color: #6b7280;
    line-height: 1.5;
    margin-bottom: 8px;
}

.card-dark-blue h4 {
    color: white;
}

.feat-agent-pill {
    background: rgba(255, 255, 255, 0.7);
    border-radius: 8px;
    padding: 8px 12px;
    font-size: 12px;
    font-weight: 600;
    display: flex;
    align-items: center;
    gap: 6px;
    color: #0f172a;
}

.agent-dot {
    width: 7px;
    height: 7px;
    background: #22c55e;
    border-radius: 50%;
    display: inline-block;
}

.agent-list {
    display: flex;
    flex-direction: column;
    gap: 8px;
    margin-top: 8px;
}

.agent-item {
    background: rgba(255, 255, 255, 0.15);
    border-radius: 8px;
    padding: 7px 10px;
    font-size: 11px;
    font-weight: 600;
    color: white;
}

.feat-icons {
    display: flex;
    gap: 14px;
    font-size: 22px;
    margin-top: 8px;
}

.agent-report-list {
    display: flex;
    flex-direction: column;
    gap: 6px;
    margin-top: 8px;
}

.report-item {
    font-size: 11px;
    font-weight: 700;
    letter-spacing: 0.5px;
}

.report-item.muted {
    color: #9ca3af;
}

.report-item.bold-box {
    border: 1.5px solid #0f172a;
    display: inline-block;
    padding: 4px 8px;
    border-radius: 5px;
    color: #0f172a;
}

/* ===========================
   DEVELOPER SECTION
=========================== */
.developer-section {
    background: #0d2137;
    color: white;
}

.ticker-bar {
    background: #16a34a;
    padding: 10px 0;
    overflow: hidden;
    white-space: nowrap;
}

.ticker-track {
    display: inline-block;
    animation: ticker 25s linear infinite;
    font-size: 12px;
    font-weight: 800;
    letter-spacing: 2px;
    color: #052e16;
    padding-right: 60px;
}

@keyframes ticker {
    0% {
        transform: translateX(0);
    }

    100% {
        transform: translateX(-50%);
    }
}

.developer-content {
    max-width: 1280px;
    margin: 0 auto;
    padding: 72px 32px;
}

/* Top part: heading + 3 cards */
.dev-top {
    margin-bottom: 72px;
}

.dev-top h2 {
    font-size: 44px;
    font-weight: 800;
    line-height: 1.2;
    letter-spacing: -1px;
    margin-bottom: 48px;
}

.green-code {
    color: #4ade80;
}

.dev-cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 48px;
}

.dev-icon {
    font-size: 20px;
    margin-bottom: 14px;
    width: 44px;
    height: 44px;
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.dev-card h3 {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 10px;
}

.dev-card p {
    font-size: 13px;
    color: #94a3b8;
    line-height: 1.7;
}

.dev-card a {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    margin-top: 18px;
    color: white;
    font-size: 14px;
    font-weight: 600;
    opacity: 0.9;
    transition: opacity 0.2s;
}

.dev-card a:hover {
    opacity: 1;
}

/* Bottom part: Try it out + code window */
.dev-tryout {
    display: flex;
    align-items: flex-start;
    gap: 64px;
}

.tryout-left {
    flex-shrink: 0;
}

.tryout-left h3 {
    font-size: 36px;
    font-weight: 800;
    line-height: 1.25;
    color: white;
}

.tryout-arrow {
    display: inline-block;
    font-size: 32px;
    color: white;
}

/* Code editor window */
.code-window {
    flex: 1;
    background: #0e2030;
    border-radius: 14px;
    overflow: hidden;
    border: 1px solid rgba(255, 255, 255, 0.08);
    box-shadow: 0 24px 64px rgba(0, 0, 0, 0.4);
}

/* Top bar of code window */
.code-topbar {
    display: flex;
    align-items: center;
    gap: 12px;
    padding: 12px 18px;
    background: #0a1a28;
    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
}

.code-lang {
    font-size: 13px;
    font-weight: 700;
    color: #e2e8f0;
}

.code-change {
    font-size: 12px;
    color: #64748b;
    cursor: pointer;
    transition: color 0.2s;
}

.code-change:hover {
    color: #94a3b8;
}

.code-dots {
    margin-left: auto;
    display: flex;
    align-items: center;
    gap: 8px;
}

.dot-copy {
    font-size: 14px;
    color: #64748b;
    cursor: pointer;
}

.dot-orange {
    width: 12px;
    height: 12px;
    background: #f97316;
    border-radius: 50%;
    cursor: pointer;
}

.dot-expand {
    font-size: 14px;
    color: #64748b;
    cursor: pointer;
}

/* Code body */
.code-body {
    padding: 18px 18px 24px;
}

.code-line {
    display: flex;
    align-items: baseline;
    gap: 16px;
    line-height: 1.9;
    font-family: 'Courier New', Courier, monospace;
    font-size: 13px;
}

/* Line numbers */
.ln {
    color: #334155;
    font-size: 12px;
    min-width: 18px;
    text-align: right;
    user-select: none;
}

/* Code token colours */
.code-cmd {
    color: #e2e8f0;
}

.code-flag {
    color: #e2e8f0;
}

.code-val {
    color: #e2e8f0;
}

.code-str {
    color: #4ade80;
}

/* green strings */
.code-key {
    color: #4ade80;
}

/* green keys */
.code-num {
    color: #fb923c;
}

/* orange numbers */
.code-bool {
    color: #fb923c;
}

/* orange booleans */
.code-punc {
    color: #94a3b8;
}

/* grey punctuation */

/* ===========================
   NO-CODE SECTION
=========================== */
.nocode-section {
    background: #eef2f7;
    padding: 80px 32px;
}

.nocode-container {
    max-width: 1280px;
    margin: 0 auto;
}

.nocode-tag {
    font-size: 13px;
    font-weight: 600;
    color: #374151;
    margin-bottom: 12px;
    font-family: 'Courier New', monospace;
}

.nocode-heading {
    font-size: 40px;
    font-weight: 800;
    color: #0f172a;
    line-height: 1.2;
    margin-bottom: 40px;
}

.nocode-green {
    color: #16a34a;
}

/* 3 cards */
.nocode-cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

.nocode-card {
    background: #ffffff;
    border: 1px solid #e5e7eb;
    border-radius: 14px;
    padding: 24px;
    display: flex;
    flex-direction: column;
    gap: 16px;
    position: relative;
    transition: box-shadow 0.2s, transform 0.2s;
}

.nocode-card:hover {
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
    transform: translateY(-2px);
}

.nocode-card-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.nocode-card-name {
    font-size: 13px;
    font-weight: 600;
    color: #6b7280;
}

.nocode-card-icon {
    font-size: 20px;
    color: #6b7280;
}

.nocode-card-desc {
    font-size: 16px;
    font-weight: 500;
    color: #111827;
    line-height: 1.5;
    flex: 1;
}

.nocode-link {
    color: #2563eb;
    font-weight: 600;
    text-decoration: none;
    transition: opacity 0.2s;
}

.nocode-link:hover {
    opacity: 0.75;
    text-decoration: underline;
}

.nocode-card-actions {
    display: flex;
    align-items: center;
    gap: 20px;
    margin-top: auto;
}

.nocode-action-link {
    font-size: 14px;
    font-weight: 600;
    color: #2563eb;
    transition: opacity 0.2s;
}

.nocode-action-link:hover {
    opacity: 0.75;
}

/* Blue arrow button on last card */
.nocode-arrow-btn {
    position: absolute;
    bottom: 24px;
    right: 24px;
    width: 36px;
    height: 36px;
    background: #2563eb;
    color: white;
    border-radius: 50%;
    font-size: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background 0.2s;
}

.nocode-arrow-btn:hover {
    background: #1d4ed8;
}

/* ===========================
   TESTIMONIALS
=========================== */
.testimonials {
    padding: 80px 32px;
    background: #fafbfd;
}

.testimonials-container {
    max-width: 1280px;
    margin: 0 auto;
}

.testimonial-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    margin-bottom: 48px;
}

.testimonial-header h2 {
    font-size: 44px;
    font-weight: 800;
    letter-spacing: -1px;
}

.blue-text {
    color: #2563eb;
}

.testi-stat {
    font-size: 28px;
    font-weight: 800;
    color: #0f172a;
}

.testimonial-cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    align-items: end;
}

.testimonial-card {
    border-radius: 16px;
    overflow: hidden;
    position: relative;
    cursor: pointer;
}

.testi-img {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 60px;
    filter: grayscale(1);
    transition: filter 0.3s;
}

.testi-img.short {
    height: 260px;
}

.testi-img.tall {
    height: 340px;
}

.testimonial-card:hover .testi-img {
    filter: grayscale(0.3);
}

.testi-info {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 20px;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.7) 0%, transparent 100%);
    color: white;
}

.testi-info h4 {
    font-size: 16px;
    font-weight: 700;
}

.testi-info p {
    font-size: 12px;
    opacity: 0.8;
    margin-top: 2px;
}

.testimonial-card.featured {
    transform: translateY(-24px);
}

/* ===========================
   FAQ
=========================== */
/* .faq { padding: 80px 32px; }

.faq-container { max-width: 1280px; margin: 0 auto; display: grid; grid-template-columns: 1fr 2fr; gap: 80px; }

.faq-left h2 { font-size: 38px; font-weight: 800; line-height: 1.25; letter-spacing: -0.5px; position: sticky; top: 80px; }

.faq-item { border-bottom: 1px solid #e5e7eb; }

.faq-question {
    width: 100%; text-align: left; background: none; border: none;
    padding: 20px 0; display: flex; justify-content: space-between; align-items: center;
    font-size: 16px; font-weight: 500; color: #0f172a;
    cursor: pointer; font-family: 'DM Sans', sans-serif; transition: color 0.2s;
}

.faq-question:hover { color: #2563eb; }
.faq-arrow { font-size: 20px; transition: transform 0.3s; flex-shrink: 0; }
.faq-question.open .faq-arrow { transform: rotate(180deg); }

.faq-answer { max-height: 0; overflow: hidden; transition: max-height 0.35s ease; }
.faq-answer.open { max-height: 300px; }
.faq-answer p { padding: 0 0 20px; font-size: 15px; color: #374151; line-height: 1.7; } */

/* ===========================
   FAQ SECTION
=========================== */
.faq {
    padding: 80px 32px;
}

.faq-container {
    max-width: 1280px;
    margin: 0 auto;
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 80px;
}

.faq-left h2 {
    font-size: 38px;
    font-weight: 800;
    line-height: 1.25;
    letter-spacing: -0.5px;
    position: sticky;
    top: 80px;
}

.faq-item {
    border-bottom: 1px solid #e5e7eb;
}

.faq-question {
    width: 100%;
    text-align: left;
    background: none;
    border: none;
    padding: 20px 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 16px;
    font-weight: 500;
    color: #0f172a;
    cursor: pointer;
    font-family: 'DM Sans', sans-serif;
    transition: color 0.2s;
}

.faq-question:hover {
    color: #2563eb;
}

.faq-arrow {
    font-size: 20px;
    transition: transform 0.3s;
    flex-shrink: 0;
}

.faq-question.open .faq-arrow {
    transform: rotate(180deg);
}

.faq-answer {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.35s ease;
}

.faq-answer.open {
    max-height: 300px;
}

.faq-answer p {
    padding: 0 0 20px;
    font-size: 15px;
    color: #374151;
    line-height: 1.7;
}

/* CTA SECTION */
.cta-section {
    background: #e9eef5;
    padding: 100px 40px;
}

.cta-container {
    max-width: 1200px;
    margin: auto;
}

/* TITLE */
.cta-title {
    font-size: 48px;
    font-weight: 700;
    color: #1f2937;
    line-height: 1.2;
    margin-bottom: 30px;
}

/* BUTTON */
.cta-button {
    background: #2563eb;
    color: white;
    border: none;
    padding: 14px 26px;
    font-size: 16px;
    font-weight: 600;
    border-radius: 6px;
    cursor: pointer;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    transition: all 0.3s ease;
}

.cta-button:hover {
    background: #1d4ed8;
    transform: translateY(-2px);
}

/* ARROW ANIMATION */
.cta-button .arrow {
    transition: transform 0.3s ease;
}

.cta-button:hover .arrow {
    transform: translateX(5px);
}

@media (max-width: 768px) {
    .cta-title {
        font-size: 32px;
    }

    .cta-section {
        padding: 60px 20px;
    }
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

    <!-- ==================== MAIN ==================== -->
    <main>

        <!-- ===== HERO ===== -->
        <section class="hero">
            <div class="hero-container">
                <div class="hero-content">
                    <div class="hero-badge">
                        <span class="badge-dot"></span>
                        Now with Agentic Commerce
                    </div>
                    <h1>
                        <span class="hero-highlight">Effortless Banking</span><br>
                        for India's boldest disruptors
                    </h1>
                    <p class="hero-sub">Powerful Automation | Smart Dashboard | Integrated Access</p>
                    <div class="hero-buttons">
                        <a href="#" class="btn-primary">Sign Up Now &rarr;</a>
                        <a href="#" class="btn-outline">Know More</a>
                    </div>
                </div>
                <div class="hero-visual">
                    <button class="carousel-arrow left">&#8249;</button>
                    <div class="hero-card">
                        <div class="hero-card-logo">&#9632; mygate &nbsp;&nbsp; Powered by Current Account</div>
                        <div class="hero-card-title">Current Account Insights</div>
                        <div class="hero-chart-bars">
                            <div class="bar" style="height:40%"></div>
                            <div class="bar" style="height:65%"></div>
                            <div class="bar" style="height:50%"></div>
                            <div class="bar" style="height:80%"></div>
                            <div class="bar" style="height:60%"></div>
                            <div class="bar" style="height:90%"></div>
                            <div class="bar" style="height:70%"></div>
                            <div class="bar" style="height:55%"></div>
                        </div>
                        <div class="hero-card-statement">
                            <p class="statement-label">Account Statement</p>
                            <div class="statement-row"><span>&#9679; Transaction 1</span><span>&#8377;10,000</span></div>
                            <div class="statement-row"><span>&#9679; Transaction 2</span><span>&#8377;20,000</span></div>
                        </div>
                        <div class="hero-card-footer">MYGATE FOUNDER &mdash; <em>Abhishek</em></div>
                    </div>
                    <button class="carousel-arrow right">&#8250;</button>
                </div>
            </div>
        </section>

        <!-- ===== HELP BAR ===== -->
        <section class="help-bar">
            <div class="help-bar-container">
                <span class="help-label">&#10022; Need help choosing?</span>
                <a href="#"><span>&#9645;</span> Accept Payments</a>
                <a href="#"><span>&#9711;</span> Make Payouts</a>
                <a href="#"><span>&#10005;</span> Start Business Banking</a>
                <a href="#"><span>&#9646;</span> Get Credit</a>
                <a href="#"><span>&#9645;</span> Automate Payroll</a>
                <a href="#"><span>&#9998;</span> Something else?</a>
            </div>
        </section>

        <!-- ===== BRANDS STRIP ===== -->
        <section class="brands-strip">
            <div class="brands-container">
                <div class="brand-item">NYKAA</div>
                <div class="brand-item">&#9632; ZERODHA</div>
                <div class="brand-item">&#8853; ATHER</div>
                <div class="brand-item">IndiGo</div>
                <div class="brand-item">&#8743; Akasa Air</div>
                <div class="brand-item">M Myntra</div>
                <div class="brand-item bordered">nish hair</div>
                <div class="brand-item">&#8634; airtel</div>
                <div class="brand-item">&#9645; CRED</div>
            </div>
        </section>

        <!-- ===== SPRINT BANNER ===== -->
        <section class="sprint-banner">
            <div class="sprint-inner">
                <div class="sprint-content">
                    <h2>SPRINT/26</h2>
                    <p>100+ Launches<br>One Blueprint</p>
                    <a href="#">See What's New</a>
                </div>
                <div class="sprint-cards">
                    <div class="sprint-card"><div class="sprint-card-title">AGENTIC<br>COMMERCE</div><span class="sprint-tag">NEW</span></div>
                    <div class="sprint-card"><div class="sprint-card-title">MAGIC<br>CHECKOUT</div><span class="sprint-tag">UPDATED</span></div>
                    <div class="sprint-card"><div class="sprint-card-title">GLOBAL<br>CHECKOUT</div><span class="sprint-tag">LIVE</span></div>
                </div>
            </div>
        </section>

        <!-- ===== FEATURES ===== -->
        <section class="features">
            <div class="features-container">
                <h2>The all in one <span class="green-text">finance platform</span><br>you've been looking for</h2>
                <p class="features-sub">With Razorpay, you can:</p>
                <div class="feature-tabs">
                    <button class="tab-btn active" onclick="switchTab(this)">Build AI Native <span class="tab-new">NEW</span></button>
                    <button class="tab-btn" onclick="switchTab(this)">Accept Payments</button>
                    <button class="tab-btn" onclick="switchTab(this)">Make Payouts</button>
                    <button class="tab-btn" onclick="switchTab(this)">Start Business Banking</button>
                    <button class="tab-btn" onclick="switchTab(this)">Automate Payroll</button>
                    <button class="tab-btn" onclick="switchTab(this)">Get Credit &amp; Loans</button>
                </div>
                <div class="feature-cards">
                    <div class="feat-card card-light-blue">
                        <div class="feat-tag">Chat Bot</div>
                        <h4>kiranacloud</h4>
                        <p>AI-powered chat that handles orders, payments and customer queries automatically.</p>
                        <div class="feat-agent-pill"><span class="agent-dot"></span> Payment Completed &#10003;</div>
                    </div>
                    <div class="feat-card card-dark-blue">
                        <div class="feat-tag light">Agents</div>
                        <h4>AGENT / SUBSCRIPTION RECOVERY</h4>
                        <div class="agent-list">
                            <div class="agent-item">AGENT / REVENUE DROP DETECTOR</div>
                            <div class="agent-item">AGENT / AUTO-CAPTURE</div>
                            <div class="agent-item">AGENT / RTO SHIELDER</div>
                        </div>
                    </div>
                    <div class="feat-card card-grey">
                        <div class="feat-tag">Integrations</div>
                        <h4>Connect with your stack</h4>
                        <p>Native integrations with n8n, Replit, and 100+ tools.</p>
                        <div class="feat-icons"><span>&#9898;</span><span>&#11042;</span><span>&#9889;</span></div>
                    </div>
                    <div class="feat-card card-white">
                        <div class="feat-tag">Reporting</div>
                        <h4>AI Reporting Agents</h4>
                        <p>Auto-generated insights for payroll, cashflow and tax.</p>
                        <div class="agent-report-list">
                            <div class="report-item muted">REPORTING AGENT</div>
                            <div class="report-item muted">PAYROLL AGENT</div>
                            <div class="report-item bold-box">CASHFLOW INSIGHTS AGENT</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== DEVELOPER SECTION ===== -->
        <section class="developer-section">

            <!-- Green scrolling ticker -->
            <div class="ticker-bar">
                <div class="ticker-track">
                    PHP &bull; NODE JS &bull; CURL &bull; JAVA &bull; PYTHON &bull;
                    PHP &bull; NODE JS &bull; CURL &bull; JAVA &bull; PYTHON &bull;
                    PHP &bull; NODE JS &bull; CURL &bull; JAVA &bull; PYTHON &bull;
                    PHP &bull; NODE JS &bull; CURL &bull; JAVA &bull; PYTHON &bull;
                </div>
            </div>

            <div class="developer-content">

                <!-- Top: heading + 3 cards -->
                <div class="dev-top">
                    <h2>Razorpay is built<br>
                        <span class="green-code">&lt;for developers by developers&gt;</span>
                    </h2>
                    <div class="dev-cards">
                        <div class="dev-card">
                            <div class="dev-icon">&#9113;</div>
                            <h3>Integrations</h3>
                            <p>Find all popular platform SDKs, plugin, server integrations in our integration stack.</p>
                            <a href="#">View Docs &rarr;</a>
                        </div>
                        <div class="dev-card">
                            <div class="dev-icon">&#128279;</div>
                            <h3>API Reference</h3>
                            <p>Comprehensive documentation to build powerful payment solutions.</p>
                            <a href="#">View Docs &rarr;</a>
                        </div>
                        <div class="dev-card">
                            <div class="dev-icon">&#9889;</div>
                            <h3>Webhooks</h3>
                            <p>Receive real-time notifications for all payment related transactions and events.</p>
                            <a href="#">View Docs &rarr;</a>
                        </div>
                    </div>
                </div>

                <!-- Bottom: Try it out + Code block -->
                <div class="dev-tryout">
                    <div class="tryout-left">
                        <h3>Try it out<br>for yourself <span class="tryout-arrow">&#8599;</span></h3>
                    </div>
                    <div class="tryout-right">
                        <div class="code-window">
                            <!-- Window top bar -->
                            <div class="code-topbar">
                                <span class="code-lang">Curl</span>
                                <span class="code-change">change language &rsaquo;</span>
                                <div class="code-dots">
                                    <span class="dot-copy">&#9166;</span>
                                    <span class="dot-orange"></span>
                                    <span class="dot-expand">&#10752;</span>
                                </div>
                            </div>
                            <!-- Code lines -->
                            <div class="code-body">
                                <div class="code-line"><span class="ln">1</span><span class="code-cmd">curl -X POST https://api.razorpay.com/v1/orders</span></div>
                                <div class="code-line"><span class="ln">2</span><span class="code-flag">-U</span> <span class="code-val">[YOUR_KEY_ID]:[YOUR_KEY_SECRET]</span></div>
                                <div class="code-line"><span class="ln">3</span><span class="code-flag">-H</span> <span class="code-str">'content-type:application/json'</span></div>
                                <div class="code-line"><span class="ln">4</span><span class="code-flag">-d</span> <span class="code-punc">'{</span></div>
                                <div class="code-line"><span class="ln">5</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-key">"amount"</span><span class="code-punc">:</span> <span class="code-num">500</span><span class="code-punc">,</span></div>
                                <div class="code-line"><span class="ln">6</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-key">"currency"</span><span class="code-punc">:</span> <span class="code-str">"INR"</span><span class="code-punc">,</span></div>
                                <div class="code-line"><span class="ln">7</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-key">"receipt"</span><span class="code-punc">:</span> <span class="code-str">"qwsaq1"</span><span class="code-punc">,</span></div>
                                <div class="code-line"><span class="ln">8</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-key">"partial_payment"</span><span class="code-punc">:</span> <span class="code-bool">true</span><span class="code-punc">,</span></div>
                                <div class="code-line"><span class="ln">9</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="code-key">"first_payment_min_amount"</span><span class="code-punc">:</span> <span class="code-num">230</span></div>
                                <div class="code-line"><span class="ln">10</span><span class="code-punc">}'</span></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- ===== NO-CODE SECTION ===== -->
        <section class="nocode-section">
            <div class="nocode-container">
                <p class="nocode-tag">&lt;what html?&gt;</p>
                <h2 class="nocode-heading">
                    <span class="nocode-green">Not a developer?</span><br>
                    Our No-Code products have you covered
                </h2>
                <div class="nocode-cards">

                    <div class="nocode-card">
                        <div class="nocode-card-top">
                            <span class="nocode-card-name">Payment Links</span>
                            <span class="nocode-card-icon">&#9707;</span>
                        </div>
                        <p class="nocode-card-desc">
                            Accept payments instantly:
                            <a href="#" class="nocode-link">Share links</a> via email, text, or social.
                        </p>
                        <div class="nocode-card-actions">
                            <a href="#" class="nocode-action-link">Sign Up &rarr;</a>
                            <a href="#" class="nocode-action-link">Know More &#8599;</a>
                        </div>
                    </div>

                    <div class="nocode-card">
                        <div class="nocode-card-top">
                            <span class="nocode-card-name">Payment Pages</span>
                            <span class="nocode-card-icon">&#128196;</span>
                        </div>
                        <p class="nocode-card-desc">
                            Accept payments without
                            <a href="#" class="nocode-link">coding on a custom-branded store</a>
                        </p>
                        <div class="nocode-card-actions">
                            <a href="#" class="nocode-action-link">Sign Up &rarr;</a>
                            <a href="#" class="nocode-action-link">Know More &#8599;</a>
                        </div>
                    </div>

                    <div class="nocode-card">
                        <div class="nocode-card-top">
                            <span class="nocode-card-name">Payment Buttons</span>
                            <span class="nocode-card-icon">&#9654;</span>
                        </div>
                        <p class="nocode-card-desc">
                            Effortlessly <a href="#" class="nocode-link">add a Pay Now button</a> without any coding knowledge
                        </p>
                        <div class="nocode-card-actions">
                            <a href="#" class="nocode-action-link">Sign Up &rarr;</a>
                            <a href="#" class="nocode-action-link">Know More &#8599;</a>
                        </div>
                        <div class="nocode-arrow-btn">&#8250;</div>
                    </div>

                </div>
            </div>
        </section>

        <!-- ===== TESTIMONIALS ===== -->
        <section class="testimonials">
            <div class="testimonials-container">
                <div class="testimonial-header">
                    <h2>Razorpay grows with <span class="blue-text">you!</span></h2>
                    <p class="testi-stat">1,50,000+ Businesses</p>
                </div>
                <div class="testimonial-cards">
                    <div class="testimonial-card">
                        <div class="testi-img short" style="background:linear-gradient(135deg,#4a4e69,#9a8c98);">&#128084;</div>
                        <div class="testi-info"><h4>Aditya Shankar</h4><p>Co-founder, Doubtnut</p></div>
                    </div>
                    <div class="testimonial-card featured">
                        <div class="testi-img tall" style="background:linear-gradient(135deg,#6b6b6b,#3d3d3d);">&#128053;</div>
                        <div class="testi-info"><h4>Neha Tandon Sharma</h4><p>Founder, Isadora Life</p></div>
                    </div>
                    <div class="testimonial-card">
                        <div class="testi-img short" style="background:linear-gradient(135deg,#5a5a5a,#2d2d2d);">&#128084;</div>
                        <div class="testi-info"><h4>Durlabh Rawat</h4><p>Founder, Barosi</p></div>
                    </div>
                    <div class="testimonial-card">
                        <div class="testi-img short" style="background:linear-gradient(135deg,#7a7a8a,#3a3a4a);">&#128053;</div>
                        <div class="testi-info"><h4>Nikita Gujral</h4><p>Founder, AN Fashions</p></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ===== FAQ ===== -->
        <!-- <section class="faq">
            <div class="faq-container">
                <div class="faq-left">
                    <h2>Frequently asked questions</h2>
                </div>
                <div class="faq-right">
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What is Razorpay? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>Razorpay is India's leading full-stack financial solutions company covering payment gateway, banking, payroll, and lending.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What services does Razorpay offer? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>Razorpay offers Payment Gateway, RazorpayX Business Banking, Payroll Automation, Payout solutions, Credit and Lending, and an Agentic AI stack.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What online payment solutions does Razorpay offer? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>Razorpay supports Credit/Debit Cards, UPI, Net Banking, Wallets, EMI, and International payments optimized for high conversion rates.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What offline payment solutions does Razorpay offer? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>Razorpay offers PoS solutions, payment links, QR codes, and Bharat QR for in-person payments across retail and hospitality industries.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What international payment solutions does Razorpay offer? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>Razorpay's Global Checkout supports 100+ currencies and international payment methods with fast settlements.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What are RazorpayX Payroll and Payouts? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>RazorpayX Payroll automates salary disbursements, tax compliance, and payslip generation. Payouts allows instant fund transfers at scale.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">Which banks are supported by RazorpayX? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>RazorpayX is powered by Yes Bank, RBL Bank, ICICI Bank, and Axis Bank. Current accounts can be opened within the dashboard.</p></div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">What is Razorpay Rize? <span class="faq-arrow">&#8964;</span></button>
                        <div class="faq-answer"><p>Razorpay Rize helps startups quickly register companies, open bank accounts, and get payment-ready from a single platform.</p></div>
                    </div>
                </div>
            </div>
        </section> -->
        <section class="faq">
            <div class="faq-container">

                <div class="faq-left">
                    <h2>Frequently asked questions</h2>
                </div>

                <div class="faq-right">

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What is Razorpay?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay is India's leading full-stack financial solutions company. It allows businesses to accept, process, and disburse payments with its product suite covering payment gateway, banking, payroll, and lending.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What services does Razorpay offer?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay offers a wide range of financial services including Payment Gateway, RazorpayX Business Banking, Payroll Automation, Payout solutions, Credit and Lending products, and an Agentic AI stack for modern businesses.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What online payment solutions does Razorpay offer?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay supports all major payment modes including Credit/Debit Cards, UPI, Net Banking, Wallets, EMI, and International payments. The checkout is optimized for high conversion rates.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What offline payment solutions does Razorpay offer?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay offers PoS solutions, payment links, QR codes, and Bharat QR for in-person payments. These solutions work seamlessly across retail, hospitality, and service industries.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What international payment solutions does Razorpay offer?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay's Global Checkout supports 100+ currencies and international payment methods. Businesses can accept payments from customers worldwide with fast settlements.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What are RazorpayX Payroll and Payouts?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>RazorpayX Payroll automates salary disbursements, tax compliance, and payslip generation. The Payouts product allows instant fund transfers to vendors, employees, and customers at scale.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            Which banks are supported by RazorpayX?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>RazorpayX is currently powered by leading banks including Yes Bank, RBL Bank, ICICI Bank, and Axis Bank. Current accounts can be opened seamlessly within the dashboard.</p>
                        </div>
                    </div>

                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            What is Razorpay Rize?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay Rize is an incorporation service that helps startups and entrepreneurs quickly register their companies, open bank accounts, and get payment-ready — all from a single platform.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            Is Razorpay safe and secure?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay maintains the highest global standards for data security. It is certified PCI-DSS
                            Level 1 compliant, which is the rigorous standard required for processing high-volume
                            credit card transactions. Additionally, the platform is ISO 27001:2013 certified for
                            Information Security Management Systems (ISMS) and SOC 2 compliant for System and
                            Organization Controls. The infrastructure undergoes regular external audits and
                            penetration testing to ensure defense-grade security against data breaches and cyber
                            threats.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            Does Razorpay provide customer support?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Yes, Razorpay offers 24/7 customer support through multiple channels. Businesses get
                                dedicated account managers, technical support for integration, compliance guidance, and
                                priority assistance based on their plan and transaction volumes.</p>
                        </div>
                    </div>
                    <div class="faq-item">
                        <button class="faq-question" onclick="toggleFaq(this)">
                            Which companies use Razorpay's products?
                            <span class="faq-arrow">&#8964;</span>
                        </button>
                        <div class="faq-answer">
                            <p>Razorpay powers over 150,000 businesses in India, including 70% of India's unicorns.
                                Payment Gateway customers include Flipkart, Zomato, Swiggy, Ola, CRED, BookMyShow,
                                Airtel, OYO, Yatra, Goibibo, Meta, and Google.<br>

                                RazorpayX supports vendor payouts and payroll for businesses like Bangalore Brewing
                                Company and SuperNan.<br>

                                For international payments, it serves Amazon Global Sellers, Airbnb hosts, Etsy and eBay
                                exporters, traditional exporters (textiles, jewelry, handicrafts), SaaS companies, and large
                                enterprises such as Bajaj Finserv, Urban Company, and New India Assurance.</p>
                        </div>
                    </div>

                </div>
            </div>
        </section>

    </main>
    <section class="cta-section">
  <div class="cta-container">
    
    <h1 class="cta-title">
      Supercharge your business <br> with Razorpay
    </h1>

    <button class="cta-button">
      Sign Up Now
      <span class="arrow">→</span>
    </button>

  </div>
</section>

    </main>

    <!-- ==================== FOOTER ==================== -->
    <!-- <footer class="footer">
        <div class="footer-container">
            <div class="footer-top">
                <div class="footer-brand">
                    <div class="footer-logo"><span class="footer-logo-icon">&#9889;</span> Razorpay</div>
                    <p>India's leading payment gateway and full-stack financial services platform, trusted by 1,50,000+ businesses.</p>
                </div>
                <div class="footer-col">
                    <h4>Products</h4>
                    <ul>
                        <li><a href="#">Payment Gateway</a></li>
                        <li><a href="#">Payment Links</a></li>
                        <li><a href="#">Payment Pages</a></li>
                        <li><a href="#">Subscriptions</a></li>
                        <li><a href="#">Smart Collect</a></li>
                        <li><a href="#">Optimizer</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Banking+</h4>
                    <ul>
                        <li><a href="#">Current Accounts</a></li>
                        <li><a href="#">Payouts</a></li>
                        <li><a href="#">Payroll</a></li>
                        <li><a href="#">Corporate Cards</a></li>
                        <li><a href="#">Capital</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Developers</h4>
                    <ul>
                        <li><a href="#">API Reference</a></li>
                        <li><a href="#">Integration Guide</a></li>
                        <li><a href="#">Webhooks</a></li>
                        <li><a href="#">SDKs</a></li>
                        <li><a href="#">Postman Collection</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Razorpay Software Private Limited. All Rights Reserved.</p>
                <div class="footer-links">
                    <a href="#">Privacy Policy</a>
                    <a href="#">Terms of Use</a>
                    <a href="#">Cookie Policy</a>
                </div>
            </div>
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

    <!-- Inline JavaScript -->
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
var navLinks  = document.getElementById('nav-links');

hamburger.addEventListener('click', function () {
    var isOpen = navLinks.style.display === 'flex';
    if (isOpen) {
        navLinks.style.display = 'none';
    } else {
        navLinks.style.display       = 'flex';
        navLinks.style.flexDirection = 'column';
        navLinks.style.position      = 'absolute';
        navLinks.style.top           = '66px';
        navLinks.style.left          = '0';
        navLinks.style.right         = '0';
        navLinks.style.background    = 'white';
        navLinks.style.padding       = '16px 24px';
        navLinks.style.borderBottom  = '1px solid #e5e7eb';
        navLinks.style.zIndex        = '998';
        navLinks.style.gap           = '4px';
        navLinks.style.height        = 'auto';
        navLinks.style.boxShadow     = '0 8px 24px rgba(0,0,0,0.08)';
    }
});


// ===========================
// FAQ — Accordion
// ===========================
function toggleFaq(btn) {
    var answer = btn.nextElementSibling;
    var isOpen = btn.classList.contains('open');

    // Close all first
    document.querySelectorAll('.faq-question').forEach(function (q) {
        q.classList.remove('open');
        q.nextElementSibling.classList.remove('open');
    });

    // Open this one if it was closed
    if (!isOpen) {
        btn.classList.add('open');
        answer.classList.add('open');
    }
}


// ===========================
// FEATURE TABS — Switch Active
// ===========================
function switchTab(btn) {
    document.querySelectorAll('.tab-btn').forEach(function (tab) {
        tab.classList.remove('active');
    });
    btn.classList.add('active');
}

    </script>

</body>
</html>
    