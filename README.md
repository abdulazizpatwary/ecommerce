# Ecommerce Project

## Overview

This is a full-stack Ecommerce application built to simulate a real-world online shopping platform. The project is being developed step-by-step with continuous tracking and documentation.

## Project Goals

* Build a scalable ecommerce system
* Implement user authentication and authorization
* Product listing, search, and filtering
* Shopping cart and checkout system
* Order management system
* Clean architecture for future scaling

## Tech Stack (To Be Updated)

* Frontend: TBD
* Backend: TBD
* Database: TBD
* Authentication: TBD

## Current Status

**Phase 1: Initialization**

* Project setup started
* Basic app structure created
* Splash screen UI implemented
* App routing initialized using GetX

## Features (Planned)

* User registration & login
* Product browsing
* Product details page
* Cart system
* Payment integration
* Admin dashboard

## Project Tracking

This project is actively maintained. Each update will be documented here with versioned progress notes.

### Day 1 Update

* Created main app entry (`CraftyBay`) using GetMaterialApp
* Implemented light and dark theme support structure
* Setup initial route (`/`) pointing to SplashScreen
* Built SplashScreen UI with:

  * Centered logo using reusable `AppLogo` widget
  * Loading indicator (CircularProgressIndicator)
  * Version text display
* Created reusable `AppLogo` widget using SVG asset

### Day 2 Update

* Introduced centralized routing using `AppRoutes` with `onGenerateRoute`
* Added named routes for screens (Splash, SignIn, SignUp, VerifyEmail)
* Integrated localization (EN, BN) using `AppLocalizations` + Flutter delegates
* Set default locale to English and configured supported locales
* Implemented **Sign In Screen**:

  * Form validation (email via `email_validator`, password length)
  * Navigation to Sign Up screen
* Implemented **Sign Up Screen**:

  * Multi-field form (email, name, phone, password, address)
  * Validation including BD phone regex
  * Navigation to Verify Email screen
* Implemented **Verify Email (OTP) Screen**:

  * 4-digit PIN input using `pin_code_fields`
  * Countdown timer with GetX (`RxInt`) for resend logic
  * OTP validation and navigation to Sign In

### Day 3 Update

* Implemented Main Bottom Navigation using GetX (`MainBottomNavController`)
* Added 4 tabs: Home, Category, Cart, Wishlist
* Created `MainBottomNavScreen` with dynamic screen switching
* Implemented **Home Screen UI**:

  * Custom AppBar with SVG logo and action buttons (profile, call, notifications)
  * Reusable `AppBarActionButton` widget
  * Product search bar (`ProductSearchBar`)
  * Carousel slider using `carousel_slider`
  * Indicator using `ValueNotifier` + `ValueListenableBuilder`
* Structured reusable widgets for scalability (SearchBar, Carousel, AppBar buttons)

### Day 4 Update

* Enhanced Home Screen with structured sections:

  * Categories section with horizontal scroll (`CategoryItem`)
  * Multiple product sections: Popular, Special, New
* Created reusable `HomeSectionHeader` widget with "See All" action
* Implemented horizontal product list using `ListView.builder`
* Built reusable `ProductItemWidget`:

  * Product image, title, price, rating, wishlist icon
* Improved UI composition and reusability across home screen

---

## Notes

This README will be continuously updated as the project evolves.
