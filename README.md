# Kapda

An E-commerce clothing store app connected to Google sheets as backend for storing userdata and products data.

## packages 

1. Gsheets for interacting with google sheets thorough google cloud.
2. Provider for state management
3. uuid for different user id.
4. shared prefs for managing user login state on their will. 
5. firebase_auth for phone number authentication.

## Features and some screens 

<img src="https://github.com/Noob-2-pro/kapda-app/blob/main/app_screenshots/login_screen.png" width="350">   <img src="https://github.com/Noob-2-pro/kapda-app/blob/main/app_screenshots/otp_with_error.png" width="350">


1) Phone Authentication :
- login and signup through OTP,
- save user logged in state, show home screen and skip login if user wants to,
- user details are stored in Google sheets, when signed up first time.

<img src="https://github.com/Noob-2-pro/kapda-app/blob/main/app_screenshots/home.png" width="350">    <img src="https://github.com/Noob-2-pro/kapda-app/blob/main/app_screenshots/product_description.png" width="350">

2)Products and Homescreen
- products could be added through google sheets easily and will reflect on the app,
- Add favourite in wishlist (not user specific yet),
- number of products added in cart  show on homescreen.
- choose male female catagory.
- product description page

<img src="https://github.com/Noob-2-pro/kapda-app/blob/main/app_screenshots/cart.png" width="350">

3) Products Cart
- Added products show in cart with price ,quantity and size selected.
- dismissible list to remove products from cart
- total price which is forwared to payment dialog when checkout.

(Note : I wouldn't recommed to follow this app's architcture as it is old and I follow a much better one using MVVM )

### Required updates if you want to use this code (priority wise)

- setup firebase project and SHA-1 keys for phone auth.
- add Json key in GSheetsAPI class inside services/gsheets.dart to setup googlesheets or move them to an .env file.
- Loading indicator could be added while API calls are made.
- Gsheets could be checked to contain the defined spreadsheet and worksheets for null.
- App could be migrated to null safety (although you will need patience while doing this)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
