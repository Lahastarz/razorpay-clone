<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RazorpayX Vendor Payments - Track Invoices & Pay Vendors</title>
    
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        /* ===========================
           RESET & BASE
        =========================== */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        :root {
            --blue: #2563EB;
            --blue-dark: #1E40AF;
            --blue-light: #3B82F6;
            --green: #22C55E;
            --green-dark: #16A34A;
            --dark: #0f172a;
            --gray-50: #F8FAFC;
            --gray-100: #F1F5F9;
            --gray-200: #E2E8F0;
            --gray-500: #64748B;
            --gray-600: #475569;
            --gray-700: #334155;
            --gray-900: #0F172A;
        }

        html { scroll-behavior: smooth; }

        body {
            font-family: 'DM Sans', sans-serif;
            color: var(--dark);
            background: #fff;
            line-height: 1.5;
            overflow-x: hidden;
        }

        a { text-decoration: none; color: inherit; }
        ul { list-style: none; }

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

        .nav-logo img { height: 32px; object-fit: contain; }

        .nav-links { display: flex; align-items: center; height: 66px; }

        .nav-item { position: static; height: 100%; display: flex; align-items: center; }

        .nav-link {
            padding: 8px 12px;
            font-size: 14px;
            font-weight: 500;
            color: #374151;
            white-space: nowrap;
            cursor: pointer;
            height: 100%;
            display: flex;
            align-items: center;
            border-bottom: 2.5px solid transparent;
            transition: color 0.15s;
        }

        .nav-link:hover { color: var(--blue); }

        /* DROPDOWN LOGIC */
        .dropdown {
            display: none;
            position: fixed;
            top: 66px; left: 0; right: 0;
            background: #ffffff;
            border-top: 1px solid #e5e7eb;
            border-bottom: 1px solid #e5e7eb;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
            z-index: 999;
            animation: fadeSlideDown 0.18s ease;
        }

        @keyframes fadeSlideDown {
            from { opacity: 0; transform: translateY(-6px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .nav-item.has-dropdown:hover .dropdown { display: block; }

        .dropdown-simple {
            position: absolute;
            top: 66px; left: auto; right: auto;
            width: auto; min-width: 230px;
            border-radius: 0 0 10px 10px;
            padding: 12px 0;
        }

        .simple-link {
            display: block;
            padding: 12px 28px;
            font-size: 14px;
            color: #374151;
            transition: background 0.15s;
        }

        .simple-link:hover { background: #f8faff; color: var(--blue); }

        .mega-col-wrap { max-width: 1280px; margin: 0 auto; display: flex; padding-top: 28px; }
        .mega-col { flex: 1; padding: 0 20px 28px 20px; border-right: 1px solid #f1f5f9; }
        .col-heading { font-size: 11px; font-weight: 700; color: #9ca3af; text-transform: uppercase; margin-bottom: 14px; }

        .mega-item { display: flex; align-items: flex-start; gap: 12px; padding: 10px; border-radius: 8px; transition: background 0.15s; }
        .mega-item:hover { background: #f4f8ff; }

        .mega-icon { width: 34px; height: 34px; background: var(--blue); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 14px; }
        .mega-title { font-size: 14px; font-weight: 600; color: #111827; display: block; }
        .mega-desc { font-size: 12px; color: #6b7280; line-height: 1.4; }

        .nav-actions { display: flex; align-items: center; gap: 12px; }
        .btn-login { background: transparent; border: 1.5px solid var(--blue); color: var(--blue); padding: 8px 20px; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; transition: 0.2s; }
        .btn-login:hover { background: var(--blue); color: #fff; }
        .btn-signup { background: var(--blue); color: white; border: none; padding: 9.5px 22px; border-radius: 6px; font-size: 14px; font-weight: 600; cursor: pointer; }

        /* ===========================
           HERO
        =========================== */
        .hero {
            padding-top: 40px;
            background: linear-gradient(180deg, #E8F0FE 0%, #ECF4FF 50%, #E5F0FF 100%);
            position: relative;
            overflow: hidden;
            min-height: 85vh;
        }

        .hero-grid-bg {
            position: absolute; inset: 0;
            background-image: linear-gradient(rgba(100,160,255,0.08) 1px, transparent 1px), linear-gradient(90deg, rgba(100,160,255,0.08) 1px, transparent 1px);
            background-size: 45px 45px; pointer-events: none;
        }

        .hero-inner { position: relative; z-index: 1; max-width: 1200px; margin: 0 auto; padding: 60px 40px 0; text-align: center; }
        .hero-badge { color: var(--blue); font-size: 13px; font-weight: 700; margin-bottom: 20px; text-transform: uppercase; letter-spacing: 1px; }
        .hero-title { font-size: clamp(34px, 5vw, 62px); font-weight: 800; color: var(--gray-900); line-height: 1.1; letter-spacing: -1.5px; margin-bottom: 24px; }
        .hero-title .accent { color: #1A7FE8; }
        .hero-subtitle { font-size: 16px; color: var(--gray-500); max-width: 580px; margin: 0 auto 40px; line-height: 1.6; }

        /* Dashboard Card Mockup */
        .dashboard-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 10px 48px rgba(0,0,0,0.12);
            overflow: hidden;
            max-width: 850px;
            margin: 0 auto;
            text-align: left;
            display: flex;
            flex-direction: column;
        }

        .db-header { padding: 14px 22px; border-bottom: 1px solid var(--gray-100); display: flex; align-items: center; justify-content: space-between; }
        .db-logo { font-weight: 800; color: #072654; font-size: 15px; }
        .db-body { display: flex; min-height: 240px; }
        .db-sidebar { width: 180px; border-right: 1px solid var(--gray-100); padding: 12px 0; }
        .db-nav-item { padding: 10px 22px; font-size: 13px; color: var(--gray-500); cursor: pointer; border-left: 3px solid transparent; }
        .db-nav-item.active { color: var(--blue); background: #f0f7ff; font-weight: 600; border-left-color: var(--blue); }
        .db-main { flex: 1; padding: 24px; }
        .inv-row { display: flex; justify-content: space-between; align-items: center; padding: 10px 0; border-bottom: 1px solid #f8fafc; font-size: 13px; }
        .badge { padding: 4px 10px; border-radius: 4px; font-size: 10px; font-weight: 700; }
        .badge-pending { background: #fef3c7; color: #92400e; }
        .badge-processed { background: #d1fae5; color: #065f46; }

        /* ===========================
           WORKFLOW
        =========================== */
        .workflow-section { padding: 80px 24px; max-width: 1280px; margin: 0 auto; }
        .section-h { text-align: center; font-size: 36px; font-weight: 800; margin-bottom: 50px; color: var(--gray-900); }
        .wf-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 24px; }
        .wf-card { background: #fff; border: 1px solid var(--gray-200); border-radius: 16px; padding: 28px; transition: 0.3s; }
        .wf-card:hover { transform: translateY(-5px); box-shadow: 0 12px 30px rgba(0,0,0,0.06); }
        .wf-title { font-weight: 700; margin-bottom: 14px; font-size: 17px; }
        .wf-desc { font-size: 14px; color: var(--gray-600); line-height: 1.6; }

        /* ===========================
           FOOTER
        =========================== */
        .footer {
            background: #f5f7fa;
            padding: 60px 40px;
            border-top: 1px solid var(--gray-200);
        }

        .footer-container { max-width: 1200px; margin: auto; }

        .footer-grid {
            display: grid;
            grid-template-columns: 2fr repeat(4, 1fr);
            gap: 50px;
        }

        .footer-about { color: #6b7280; font-size: 14px; line-height: 1.6; }
        .footer-about p { margin-bottom: 15px; }

        .logo-f {
            font-size: 24px;
            font-weight: 800;
            color: #111827;
            margin-bottom: 15px;
            display: block;
        }

        .disclaimer { font-size: 12px; color: #9ca3af; }

        .footer-col h4 {
            font-size: 12px;
            font-weight: 700;
            color: #6b7280;
            margin: 20px 0 10px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .footer-col ul li {
            font-size: 14px;
            color: var(--blue);
            margin-bottom: 9px;
            cursor: pointer;
        }

        .footer-col ul li:hover { text-decoration: underline; }

        .new-badge {
            background: #d1fae5;
            color: #065f46;
            font-size: 10px;
            padding: 2px 7px;
            border-radius: 10px;
            margin-left: 6px;
            font-weight: 700;
        }

        .footer-bottom {
            margin-top: 40px;
            font-size: 13px;
            color: #9ca3af;
            border-top: 1px solid #e5e7eb;
            padding-top: 25px;
            text-align: center;
        }

        /* ===========================
           RESPONSIVE
        =========================== */
        @media (max-width: 1024px) {
            .nav-links, .nav-actions { display: none; }
            .wf-grid, .footer-grid { grid-template-columns: 1fr; gap: 30px; }
            .dashboard-card { margin: 0 20px; }
            .db-sidebar { width: 140px; }
        }
    </style>
</head>
<body>

    <header class="navbar" id="navbar">
        <nav class="nav-container">
            <div class="nav-logo">
                <img src="razorpay_img.png" alt="Razorpay Logo">
            </div>

            <ul class="nav-links">
                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Agentic Stack</a>
                    <div class="dropdown dropdown-simple">
                        <a href="#" class="simple-link">Agentic Payments</a>
                        <a href="#" class="simple-link">Agent Studio</a>
                        <a href="#" class="simple-link">Agentic Business Banking</a>
                    </div>
                </li>

                <li class="nav-item has-dropdown">
                    <a href="#" class="nav-link">Payments</a>
                    <div class="dropdown">
                        <div class="mega-col-wrap">
                            <div class="mega-col">
                                <p class="col-heading">Accept Payments Online</p>
                                <div class="mega-item">
                                    <div class="mega-icon">💸</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Gateway</span>
                                        <span class="mega-desc">Payments on your Website & App</span>
                                    </div>
                                </div>
                                <div class="mega-item">
                                    <div class="mega-icon">🔗</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Payment Links</span>
                                        <span class="mega-desc">Create & send links to collect money</span>
                                    </div>
                                </div>
                            </div>
                            <div class="mega-col">
                                <p class="col-heading">Accept Payments Offline</p>
                                <div class="mega-item">
                                    <div class="mega-icon">🏪</div>
                                    <div class="mega-text">
                                        <span class="mega-title">Razorpay POS</span>
                                        <span class="mega-desc">Accept Payments In-Store</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mega-footer">Payment aggregation services provided by RBI Authorised Aggregators</div>
                    </div>
                </li>

                <li class="nav-item"><a href="#" class="nav-link">Banking+</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Payroll</a></li>
                <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
            </ul>

            <div class="nav-actions">
                <button class="btn-login">Login</button>
                <button class="btn-signup">Sign Up &rarr;</button>
            </div>
        </nav>
    </header>

    <main>
        
        <section class="hero">
            <div class="hero-grid-bg"></div>
            <div class="hero-inner">
                <div class="hero-badge">RazorpayX Vendor Payments</div>
                <h1 class="hero-title">
                    Track invoices, pay vendors, close<br>books, & more on <span class="accent">one platform</span>
                </h1>
                <p class="hero-subtitle">Get enhanced control, speed and accuracy with vendor payments that work like clockwork.</p>
                <button class="btn-hero">Get Started Now &rarr;</button>

                <div class="dashboard-card">
                    <div class="db-header">
                        <span class="db-logo">RazorpayX</span>
                        <span style="font-size: 11px; color: var(--gray-500);">Overview / Invoices</span>
                    </div>
                    <div class="db-body">
                        <div class="db-sidebar">
                            <div class="db-nav-item active">Invoices</div>
                            <div class="db-nav-item">Advances</div>
                            <div class="db-nav-item">TDS Payments</div>
                            <div class="db-nav-item">Accounting</div>
                            <div class="db-nav-item">Vendors</div>
                        </div>
                        <div class="db-main">
                            <div class="inv-row">
                                <span>#94873823 — Advaith B.</span>
                                <span class="badge badge-pending">Pending Approval</span>
                            </div>
                            <div class="inv-row">
                                <span>#38983484 — Soetiana S.</span>
                                <span class="badge badge-processed">Processed</span>
                            </div>
                            <div class="inv-row">
                                <span>#84823479 — Sonia Kapoor</span>
                                <span class="badge badge-processed">Processed</span>
                            </div>
                            <div style="margin-top: 20px; font-size: 12px; color: var(--gray-500);">
                                <p>Total Outstanding: <strong>₹ 14,79,763</strong></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="workflow-section">
            <h2 class="section-h">Magic at every step of your workflow</h2>
            <div class="wf-grid">
                <div class="wf-card">
                    <div class="wf-title">Bulk Import Vendors</div>
                    <p class="wf-desc">Onboard hundreds of vendors instantly with a single CSV upload. No manual entry needed.</p>
                </div>
                <div class="wf-card">
                    <div class="wf-title">Quick Filters & Search</div>
                    <p class="wf-desc">Find any invoice or payment status in seconds with smart filters designed for scale.</p>
                </div>
                <div class="wf-card">
                    <div class="wf-title">Partial Pay Invoices</div>
                    <p class="wf-desc">Gain flexibility by paying invoices in parts. Manage your cash flow with precision.</p>
                </div>
            </div>
        </section>

    </main>

    <footer class="footer">
        <div class="footer-container">
            <div class="footer-grid">
                
                <div class="footer-col footer-about">
                    <span class="logo-f">Razorpay</span>
                    <p>Razorpay is the only payments solution in India that allows businesses to accept, process and disburse payments with its product suite.</p>
                    <p>RazorpayX supercharges your business banking experience, bringing excellence to all financial processes.</p>
                    <p class="disclaimer">Disclaimer: RazorpayX powered current account is provided by partner banks. Razorpay is not a bank and does not hold a banking license.</p>
                </div>

                <div class="footer-col">
                    <h4>Accept Payments</h4>
                    <ul>
                        <li>Payment Gateway</li>
                        <li>Payment Pages</li>
                        <li>Payment Links</li>
                        <li>Razorpay POS <span class="new-badge">NEW</span></li>
                        <li>QR Codes</li>
                        <li>Subscriptions</li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Banking Plus</h4>
                    <ul>
                        <li>RazorpayX</li>
                        <li>Current Accounts</li>
                        <li>Payouts</li>
                        <li>Corporate Credit Card</li>
                    </ul>
                    <h4>Payroll</h4>
                    <ul>
                        <li>RazorpayX Payroll</li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Developers</h4>
                    <ul>
                        <li>Docs</li>
                        <li>Integrations</li>
                        <li>API Reference</li>
                    </ul>
                    <h4>Resources</h4>
                    <ul>
                        <li>Blog</li>
                        <li>Customer Stories</li>
                    </ul>
                </div>

                <div class="footer-col">
                    <h4>Company</h4>
                    <ul>
                        <li>About Us</li>
                        <li>Careers</li>
                        <li>Terms of Use</li>
                        <li>Privacy Policy</li>
                        <li>Partners</li>
                    </ul>
                </div>

            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2026 Razorpay Software Private Limited. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Navbar Scroll Shadow
        window.addEventListener('scroll', function () {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 10) {
                navbar.style.boxShadow = '0 2px 20px rgba(0,0,0,0.08)';
            } else {
                navbar.style.boxShadow = 'none';
            }
        });

        // Simple Tab Logic for Dashboard Mockup
        document.querySelectorAll('.db-nav-item').forEach(item => {
            item.addEventListener('click', function() {
                document.querySelectorAll('.db-nav-item').forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>