# 🛒 Ecommerce Mobile Application (Flutter)

A production-level **Ecommerce Mobile Application** built using Flutter, following **feature-based clean architecture** and **GetX state management**.  
This project simulates a real-world shopping experience with complete user flow including authentication, product browsing, cart, wishlist, reviews, and payment integration.

---

## 📌 Overview

This application is designed to demonstrate a scalable and modular ecommerce system with real API integration and clean architecture principles.  
It is built to reflect **industry-level production app structure**, making it suitable for portfolio and job applications.

---

## 🚀 Key Features

### 🔐 Authentication System
- User Sign In / Sign Up
- OTP Verification
- Token-based authentication
- Auto login using saved session
- Secure logout handling

---

### 🏠 Home & Product Discovery
- Dynamic category listing (API-based)
- Product sections:
  - Popular Products
  - Special Products
  - New Arrivals
- Banner carousel slider
- Search UI (frontend ready)
- Horizontal product listing

---

### 🛍 Product System
- Category-wise product listing
- Tag-based product filtering system
- Product details page:
  - Image carousel slider
  - Color selection
  - Size selection
  - Quantity update
  - Dynamic price calculation
- Add to Cart functionality

---

### 🛒 Cart System
- Cart item listing
- Quantity increase/decrease
- Remove item with per-item loading state
- Real-time total price calculation
- Optimized GetX state management

---

### ❤️ Wishlist System
- Add / remove wishlist items
- Real-time UI updates
- API synced state
- Integrated across product screens

---

### ⭐ Review System
- Product review listing
- Pagination support
- Create review functionality
- Total review counter
- Navigation between review screens

---

### 💳 Payment Integration
- SSLCommerz payment gateway
- Transaction ID generation (UUID)
- Payment status handling:
  - Success
  - Failed
  - Closed
- Loading state during payment process

---

## ⚙️ Architecture

The project follows **Feature-Based Clean Architecture**:
- features/
- ├── auth/
- ├── home/
- ├── product/
- ├── cart/
- ├── wish/
- ├── review/
- └── common/
---

Each feature contains:
- UI Layer
- GetX Controller
- Data Models
- API Integration Layer

---

## 🌐 Networking Layer

- Centralized API handler (`NetworkCaller`)
- Supports:
  - GET
  - POST
  - DELETE
  - PUT / PATCH
- Standard response model
- Central error handling
- Token-based authentication
- Auto logout on 401 error

---

## 🧠 State Management (GetX)

- Reactive state management
- Optimized controller updates
- Separate loading states:
  - Initial loading
  - Pagination loading
  - Item-level loading (cart delete)
- Efficient UI rebuild handling

---

## 📸 Screenshots

## 🏠 Home Screen
![Home Screen](ADD_YOUR_IMAGE_URL_HERE)

---

## 🔐 Authentication Screens
![Login Screen](ADD_YOUR_IMAGE_URL_HERE)
![Sign Up Screen](ADD_YOUR_IMAGE_URL_HERE)
![OTP Screen](ADD_YOUR_IMAGE_URL_HERE)

---

## 🏷️ Category & Product List
![Category Screen](ADD_YOUR_IMAGE_URL_HERE)
![Product List](ADD_YOUR_IMAGE_URL_HERE)

---

## 🛍️ Product Details Screen
![Product Details](ADD_YOUR_IMAGE_URL_HERE)

---

## 🛒 Cart Screen
![Cart Screen](ADD_YOUR_IMAGE_URL_HERE)

---

## ❤️ Wishlist Screen
![Wishlist Screen](ADD_YOUR_IMAGE_URL_HERE)

---

## ⭐ Review System
![Review List](ADD_YOUR_IMAGE_URL_HERE)
![Create Review](ADD_YOUR_IMAGE_URL_HERE)

---

## 💳 Payment Screen
![Payment Screen](ADD_YOUR_IMAGE_URL_HERE)

---

## 📊 Project Highlights

- Real-world ecommerce flow implementation
- Modular and scalable architecture
- API-driven dynamic UI
- Production-level state management
- Payment gateway integration
- Clean and reusable code structure

---

## 🔮 Future Improvements

- Order tracking system
- Admin dashboard
- Push notifications
- Advanced search & filtering
- Analytics dashboard

---

## 🧾 Tech Stack

- Flutter
- GetX
- REST API
- SharedPreferences
- SSLCommerz Payment Gateway
- Custom Networking Layer

---

## 🏁 Summary

This project represents a **real-world scalable ecommerce mobile application**, built with industry-standard architecture and best practices.  
It is optimized for **portfolio presentation and job applications**.