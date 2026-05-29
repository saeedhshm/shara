# Shara - Loyalty & Rewards Mobile App

## Download APK

**[Download the latest APK](https://drive.google.com/file/d/1mhgmBmB4gFTrmoaWlGCVnOBrt0gjBYnQ/view?usp=sharing)**

---

## Screenshots

| Home | Buy Points | Contacts |
|------|-----------|----------|
| ![Home](screenshots/home.png) | ![Buy Points](screenshots/buy_points.png) | ![Contacts](screenshots/contacts.png) |

| Phone Verification | Transactions | Finance |
|-------------------|-------------|---------|
| ![Phone Verification](screenshots/phone_verification.png) | ![Transactions](screenshots/transactions.png) | ![Finance](screenshots/finance.png) |

| Promo Codes | Profile |
|------------|---------|
| ![Promo Codes](screenshots/promo_codes.png) | ![Profile](screenshots/profile.png) |

---

## Overview

**Shara** is a loyalty and rewards mobile application built with Flutter for Android. It allows users to earn and spend points across a network of partner stores, redeem promo codes, transfer points, and manage their wallet. The app supports Arabic (RTL) and English with a gold/white brand theme.

---

## Tech Stack

| Technology | Version |
|-----------|---------|
| Flutter | 3.41.1 |
| Dart | 3.11.0 |
| Android Gradle Plugin | 8.9.1 |
| Gradle | 8.11.1 |
| Kotlin | 2.1.0 |
| Minimum SDK | 21 (Android 5.0) |
| Target SDK | 34 |

---

## Key Dependencies

| Package | Purpose |
|---------|---------|
| `get` | State management, routing, dependency injection |
| `http` | API communication |
| `shared_preferences` | Local storage |
| `webview_flutter` | In-app web pages and payment flows |
| `video_player` | Splash screen video |
| `cached_network_image` | Network image caching |
| `flutter_svg` | SVG asset rendering |
| `fast_contacts` | Device contacts access for point transfers |
| `permission_handler` | Runtime permission requests |
| `urwaypayment` | Payment gateway integration |
| `firebase_core` / `firebase_messaging` | Push notifications |
| `dropdown_button2` | Custom dropdown widgets |
| `html` | HTML content parsing |
| `url_launcher` | Opening external links |
| `email_validator` | Email input validation |
| `smooth_page_indicator` | Onboarding page indicators |

---

## Project Structure

```
shara/
├── lib/
│   ├── main.dart                          # App entry point, controller registration
│   ├── controllers/                       # GetX controllers (business logic)
│   │   ├── init_app_controller.dart       # Core app state (user data, profile, language)
│   │   ├── home_controller.dart           # Home page data
│   │   ├── all_offers_controller.dart     # Offers list
│   │   ├── offer_details_controller.dart  # Single offer details
│   │   ├── partners_controller.dart       # Partner stores
│   │   ├── membership_controller.dart     # Membership plans
│   │   ├── membership_details.dart        # Single membership details
│   │   ├── calculate_points.dart          # Points calculator
│   │   ├── discount_coupon_controller.dart# Discount coupons
│   │   ├── transactions_controller.dart   # Transaction history
│   │   ├── my_coupons_controller.dart     # User's redeemed coupons
│   │   ├── promo_codes_controller.dart    # Promo codes catalog
│   │   ├── inner_transfer.dart            # Inner point transfers
│   │   ├── transfer_points_controller.dart# Contact-based transfers
│   │   ├── buy_points_controller.dart     # Points purchase flow
│   │   ├── sign_up_controller.dart        # Registration
│   │   ├── reset_password_controller.dart # Password reset
│   │   └── change_account_information.dart# Profile editing
│   ├── models/                            # Data models
│   │   ├── home_model.dart
│   │   ├── offer.dart
│   │   ├── partner.dart
│   │   ├── membership.dart
│   │   ├── membership_ervice.dart         # Membership API service
│   │   ├── promo_code.dart
│   │   ├── promo_code_type.dart
│   │   ├── transaction_service.dart
│   │   ├── discount_coupon.dart
│   │   ├── app_contact.dart
│   │   └── operations_manager.dart
│   ├── helpers/
│   │   ├── app_colors.dart                # Color constants
│   │   ├── apis_urls/
│   │   │   ├── api.dart                   # Original AppApiHandler (untouched)
│   │   │   ├── api_config.dart            # Mock/real mode toggle
│   │   │   ├── api_handler.dart           # Wrapper dispatching to mock or real API
│   │   │   └── app_urls.dart              # All API endpoint URL constants
│   │   ├── mock/
│   │   │   ├── mock_data_provider.dart    # Hardcoded JSON for all 20+ endpoints
│   │   │   └── mock_api_handler.dart      # Mock handler with Future.delayed
│   │   ├── utils/
│   │   │   ├── printutils.dart            # Debug print helpers
│   │   │   ├── storage/                   # SharedPreferences utilities
│   │   │   └── validation/                # Form validation helpers
│   │   └── navigation.dart                # Navigation helpers
│   ├── features/
│   │   └── auth/                          # Clean Architecture auth module
│   │       ├── data/
│   │       │   ├── datasources/           # Auth data sources (remote, mock)
│   │       │   ├── models/                # UserDataModel
│   │       │   └── repositories/          # AuthRepositoryImpl
│   │       ├── domain/
│   │       │   ├── entities/              # User entity
│   │       │   ├── repositories/          # AuthRepository interface
│   │       │   └── usecases/              # LoginUseCase, SendConfirmCodeUseCase
│   │       └── presentation/
│   │           └── controllers/           # LoginController
│   ├── core/
│   │   ├── di/                            # Dependency injection setup
│   │   └── error/                         # Either, Failure classes
│   └── views/
│       ├── screens/
│       │   ├── splash/                    # Splash + intro screens
│       │   ├── home/
│       │   │   ├── main_home_screen.dart  # Bottom nav bar container
│       │   │   └── pages/
│       │   │       ├── home_page/         # Dashboard with account card, finance actions, offers
│       │   │       ├── finance/           # Finance page, contacts, transfers, payment
│       │   │       ├── memberships.dart   # Membership tiers
│       │   │       ├── promo_codes/       # Promo code catalog + variants
│       │   │       ├── discount_coupons/  # Discount coupons
│       │   │       ├── last_ops/          # Recent transactions
│       │   │       ├── profile.dart       # Profile page
│       │   │       ├── settings/          # Language settings
│       │   │       └── notifications_page.dart
│       │   ├── account/
│       │   │   ├── login/                 # Login, phone verification
│       │   │   ├── signin_pages/          # Sign up, password, code verification
│       │   │   ├── account_settings.dart  # Account settings menu
│       │   │   ├── account_information.dart# Personal info display
│       │   │   ├── my_coupons.dart        # User's redeemed coupons
│       │   │   ├── invoices_processes.dart # Invoice history
│       │   │   └── send_message.dart      # Contact/support form
│       │   ├── all_offers/                # Offers listing + single offer details
│       │   ├── partners/                  # Partner stores listing
│       │   └── verfy_id/                  # ID verification
│       └── widgets/                       # Reusable widgets
│           ├── leading_back_arrow.dart     # Back arrow button
│           ├── custom_text_form_field.dart # Custom form field
│           ├── image_from_server.dart     # Network image wrapper
│           ├── list_offers_items.dart     # Offer grid item
│           ├── offer_item_widget.dart     # Offer card
│           ├── offers_title_show_all.dart # Section header with "show all"
│           ├── main_button.dart           # Primary button
│           ├── flat_botton.dart           # Flat button
│           ├── web_page.dart              # In-app WebView page
│           └── login_header.dart          # Login page header
├── android/                               # Android native config
├── assets/
│   ├── images/                            # App images, icons, backgrounds
│   ├── fonts/                             # Almarai font family (Arabic)
│   └── video/                             # Splash screen video
└── screenshots/                           # App screenshots for README
```

---

## Features

### Home Screen
- User account card showing name, membership tier, and points balance
- Finance action buttons: Add Balance, Transfer Points, Local Transfer, International Transfer
- Promo codes catalog with category filters
- Points calculator
- Recent transaction history

### Finance & Transfers
- Add wallet balance via payment gateway (Visa, Mastercard, Mada, STC Pay, Apple Pay)
- Transfer points to registered contacts
- Transfer points to unregistered phone numbers
- Local bank transfers
- International transfers

### Promo Codes & Offers
- Browse promo codes by category (Facebook, Up Store, Jujel Baladi, etc.)
- View promo code details and variants
- Purchase promo codes
- Browse partner offers with details

### Memberships
- View membership tiers (Platinum, Gold, Silver, etc.)
- Membership details with benefits

### Profile & Account
- Personal information display
- Account settings (name, phone, email, password)
- ID verification
- Transaction and invoice history
- My redeemed coupons
- Send support message
- Language switching (Arabic/English)
- Logout

### Authentication
- Phone number registration
- SMS verification code
- Password setup
- Login with phone
- Password reset via phone or email

---

## Mock Data Mode

The app runs in **mock mode by default** — all API calls return hardcoded JSON data with simulated network delay (800ms). No real server connection is needed.

### To switch to real APIs:

1. Open `lib/helpers/apis_urls/api_config.dart`
2. Set `static bool useMock = false;`

```dart
class ApiConfig {
  static bool useMock = false; // Set to false for real APIs
  static int mockDelayMilliseconds = 800;
}
```

### Architecture

```
Controllers → ApiHandler → [ApiConfig.useMock?]
                              ├── true  → MockApiHandler → MockDataProvider (hardcoded JSON)
                              └── false → AppApiHandler  → Real HTTP APIs
```

The original `AppApiHandler` in `lib/helpers/apis_urls/api.dart` is preserved untouched for future real API integration.

---

## Build & Run

### Prerequisites
- Flutter SDK 3.41.1+
- Android Studio or VS Code with Flutter plugin
- Android emulator or physical device (API 21+)

### Commands

```bash
# Get dependencies
flutter pub get

# Run in debug mode
flutter run

# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Clean build artifacts
flutter clean
```

### Build Configuration
- **Package name:** `com.traffic.saeed.shara`
- **Signing:** Debug and Release keystores configured
- **Gradle:** 8.11.1 with Java 21
- **NDK:** 26.1.10909125

---

## Android Configuration

| Setting | Value |
|---------|-------|
| compileSdk | 36 |
| minSdk | 21 |
| targetSdk | 34 |
| Kotlin | 2.1.0 |
| AGP | 8.9.1 |
| Gradle | 8.11.1 |
| Java | 21 |

---

## Known Issues

- Some SVG assets in the project are malformed and produce `XmlParserException` warnings at runtime. These are pre-existing asset issues and do not crash the app.
- The debug APK is approximately 160 MB due to debug symbols and unoptimized assets.

---

## License

Private project. All rights reserved.
