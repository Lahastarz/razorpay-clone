# Razorpay Website Clone

A clone of the [Razorpay](https://razorpay.com) website built using **JSP (Java Server Pages)**, simulating real-world banking and payment features.

---

## 🚀 Features

- User Authentication (Login, Signup, Logout)
- Home Page inspired by Razorpay's UI
- Dashboard with banking and payment overview
- Payment Processing functionality
- Modular folder structure (Banking_Plus, Payments)
- Clean JSP-based server-side rendering

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| JSP (Java Server Pages) | Server-side rendering and logic |
| HTML5 & CSS3 | Page structure and styling |
| JavaScript | Interactivity and dynamic behavior |
| Java (Servlet/WEB-INF) | Backend configuration and processing |

---

## 📦 Installation & Setup

### Prerequisites
- Java JDK 8 or above
- Apache Tomcat (v9 or above recommended)
- Any IDE (Eclipse / IntelliJ IDEA)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/razorpay-clone.git
   ```

2. **Import into your IDE**
   - Open Eclipse or IntelliJ
   - Import as a **Dynamic Web Project** (Eclipse) or **Maven/Web Project** (IntelliJ)

3. **Deploy on Tomcat**
   - Add the project to your Tomcat server
   - Start the server

4. **Open in browser**
   ```
   http://localhost:8080/razorpay-clone/HomePage.jsp
   ```

---

## 📁 Project Structure

```
razorpay-clone/
├── Banking_Plus/          # Banking related modules
├── Payments/              # Payment related modules
├── META-INF/              # Metadata configuration
├── WEB-INF/               # Web configuration (web.xml)
├── HomePage.jsp           # Landing/Home page
├── Login.jsp              # Login page
├── SignUp.jsp             # Registration page
├── dashboard.jsp          # Main dashboard
├── dashboard1.jsp         # Extended dashboard view
├── ProcessPayment.jsp     # Payment processing logic
├── Logout.jsp             # Logout handler
└── razorpay_img.png       # Razorpay logo/image asset
```

---

## 🙏 Acknowledgements

- Original design credits go to [Razorpay](https://razorpay.com)
- This project is made purely for **educational purposes** and is not affiliated with or endorsed by Razorpay

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
