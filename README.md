# 🛒 Ecommerce Project

## 📌 Overview

This is a full-stack Ecommerce application built to simulate a real-world online shopping platform. The project is being developed step-by-step with continuous tracking and documentation, focusing on clean architecture and scalability.

---

## 🎯 Project Goals

* Build a scalable ecommerce system
* Implement user authentication and authorization
* Product listing, search, and filtering
* Shopping cart and checkout system
* Order management system
* Maintain clean and maintainable architecture

---

## 🛠 Tech Stack

* Frontend: Flutter
* State Management: GetX
* Backend: REST API
* Local Storage: SharedPreferences
* Networking: HTTP + Custom Network Layer
* Architecture: Feature-based Clean Architecture

---

## 🚧 Current Status

Phase 1: Core Development (Ongoing)

* App structure completed
* UI screens implemented
* API integration ongoing
* Authentication system completed
* Category & Product modules connected with backend

---

## ✨ Features (Planned)

* User authentication system
* Product browsing & filtering
* Product details
* Cart system
* Checkout & payment integration
* Order management
* Admin panel (future scope)

---

## 📊 Project Tracking

This project is actively maintained. Each update is documented below:

---

### 📅 Day 1 Update

* Created main app entry (CraftyBay) using GetMaterialApp
* Implemented light and dark theme support structure
* Setup initial route (/) pointing to SplashScreen
* Built SplashScreen UI with:

  * App logo using reusable AppLogo widget
  * Loading indicator
  * Version text
* Created reusable SVG-based AppLogo widget

---

### 📅 Day 2 Update

* Introduced centralized routing using AppRoutes
* Added named routes (Splash, SignIn, SignUp, VerifyEmail)
* Integrated localization (EN, BN)
* Implemented Sign In Screen with validation
* Implemented Sign Up Screen with full form validation
* Implemented OTP Verification Screen with timer

---

### 📅 Day 3 Update

* Implemented Main Bottom Navigation using GetX
* Added tabs: Home, Category, Cart, Wishlist
* Built Home Screen UI:

  * Custom AppBar
  * Search bar
  * Carousel slider
  * Indicator using ValueNotifier
* Created reusable widgets

---

### 📅 Day 4 Update

* Enhanced Home Screen:

  * Categories section
  * Product sections (Popular, Special, New)
* Created reusable section header widget
* Built reusable ProductItemWidget

---

### 📅 Day 5 Update

* Implemented Category List Screen (Grid UI)
* Added custom AppBar with manual back control
* Implemented Product List Screen (grid-based)
* Improved navigation flow

---

### 📅 Day 6 Update

* Connected Category → Product List navigation
* Passed category via route arguments

---

### 📅 Day 7 Update

* Implemented Product Details Screen:

  * Image slider
  * Product info
  * Quantity selector
  * Color & size picker
  * Description section
* Added navigation from Product List
* Created interactive reusable widgets

---

### 📅 Day 8 Update

* Implemented Product Review Screen
* Implemented Create Review Screen
* Created ReviewCard widget
* Implemented Wishlist Screen
* Implemented Cart Screen with total calculation
* Improved product interaction flow

---

### 📅 Day 9 Update

* Built Network Layer (NetworkCaller):

  * GET, POST, PUT, PATCH, DELETE support
  * JSON handling
  * Centralized API calls

* Created NetworkResponse wrapper

* Added logging using Logger

* Standardized error handling

---

### 📅 Day 10 Update

* Connected Sign In & Sign Up with backend API

* Created request models:

  * SignInRequestModel
  * SignUpRequestModel
  * VerifyOtpRequestModel

* Implemented AuthController:

  * saveUserData()
  * getUserData()
  * isUserLoggedIn()
  * clearUserData()

* Stored token & user data using SharedPreferences

* Updated Splash Screen:

  * Auto login check
  * Navigation based on login state

* Upgraded Network Layer:

  * Dynamic token support
  * Auto logout on 401

* Implemented Controllers:

  * SignInController
  * SignUpController
  * VerifyEmailOtpController

* Integrated Home Slider API:

  * HomeSliderController
  * SliderModel

* Implemented Category API:

  * CategoryController
  * Pagination (page & count)
  * Infinite scrolling
  * Pull-to-refresh

* Improved architecture:

  * Clean separation (Controller, Model, Network)
  * Dependency injection using GetX Bindings

---

### 📅 Day 11 Update

* Implemented Product Model:

  * Multiple images (photos)
  * Colors & Sizes support
  * Pricing (regular + current)
  * Rating & quantity handling

* Integrated Product List API (Category-wise):

  * Created ProductListController
  * Pagination support
  * Infinite scroll
  * Pull-to-refresh

* Implemented Product Tag System:

  * Enum-based tags (new, special, popular)
  * ProductListByTagController
  * Separate API calls per tag

* Enhanced Home Screen:

  * Connected product sections with API
  * Popular, Special, New sections dynamic
  * Horizontal product lists

* Improved State Management:

  * Loading states (initial + pagination)
  * Error handling
  * Optimized UI updates

* Improved Pagination:

  * Category list
  * Product list
  * Product by tag
  * Prevented unnecessary API calls

* Codebase Improvements:

  * Cleaner JSON parsing
  * Better separation of concerns
  * Reusable components optimization

---

### 📌 Day 11 Summary

This update introduces a **fully dynamic product system with API integration**, including category-based listing, tag-based filtering, and optimized pagination.
The application now behaves closer to a real-world ecommerce platform.

---

## 🔮 Upcoming Features

* Product details API integration
* Add to cart system
* Wishlist API
* Order & checkout system
* Payment gateway integration

---

## 🧠 Notes

This project is continuously evolving with focus on:

* Clean Architecture
* Scalable codebase
* Real-world API integration
* Production-level practices

---

## 📌 Status

🚀 Portfolio-ready (In Progress)

---
