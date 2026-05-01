# ⚡ Iron Pulse - Ultimate Fitness Companion
--------------------------------------------

<p align="center">
  <img
    src="assets/images/readme/iron_pulse_banner.png"
    alt="Iron Pulse Banner"
    width="100%"
  />
</p>

---

## 🏋️‍♂️ Unleash Your Potential with Iron Pulse ! 🔥✨
Iron Pulse is your all-in-one fitness ecosystem designed to push your limits. Whether you're a beginner or a pro athlete, Iron Pulse provides the tools you need to track your progress, follow expertly crafted workout plans, and connect with top-tier trainers. 🏃‍♂️💨 From personalized training programs 📋 to real-time performance tracking 📊, we've got everything you need to transform your body and mind! 🌟

**Key Features:**
- 🔐 **Auth Flow** — Sign up, log in, OTP verification & password reset.
- 🏠 **Home** — Discover featured plans and quick access to everything.
- 📋 **Plans** — Browse and view detailed workout plans.
- 🧑‍🏫 **Trainers** — Find and connect with professional trainers.
- ❤️ **Favorites** — Save plans you love for quick access.
- 👤 **Profile** — Manage your account and personal information.
- 🌓 **Dark & Light Theme** — Switch between modes instantly.
- 🦴 **Skeleton Loading** — Smooth loading states throughout the app.

---

## ⚫️ App Screens In Dark mode:

<!-- TO THE USER: Replace the 'src' in the table below with your Dark Mode screenshots after uploading them to GitHub -->

<table>
<tr>
  <td><img width="200" alt="Splash Screen" src="PLACEHOLDER_DARK_SPLASH" /></td>
  <td><img width="200" alt="Onboarding 1" src="PLACEHOLDER_DARK_ONBOARDING_1" /></td>
  <td><img width="200" alt="Onboarding 2" src="PLACEHOLDER_DARK_ONBOARDING_2" /></td>
  <td><img width="200" alt="Onboarding 3" src="PLACEHOLDER_DARK_ONBOARDING_3" /></td>
</tr>
<tr>
  <td align="center">Splash Screen</td>
  <td align="center">Onboarding 1</td>
  <td align="center">Onboarding 2</td>
  <td align="center">Onboarding 3</td>
</tr>

<tr>
  <td><img width="200" alt="Login Screen" src="PLACEHOLDER_DARK_LOGIN" /></td>
  <td><img width="200" alt="Sign Up Screen" src="PLACEHOLDER_DARK_SIGNUP" /></td>
  <td><img width="200" alt="OTP Screen" src="PLACEHOLDER_DARK_OTP" /></td>
  <td><img width="200" alt="Forgot Password" src="PLACEHOLDER_DARK_FORGOT_PWD" /></td>
</tr>
<tr>
  <td align="center">Login Screen</td>
  <td align="center">Sign Up Screen</td>
  <td align="center">OTP Verification</td>
  <td align="center">Forgot Password</td>
</tr>

<tr>
  <td><img width="200" alt="Home Screen" src="PLACEHOLDER_DARK_HOME" /></td>
  <td><img width="200" alt="Plans Screen" src="PLACEHOLDER_DARK_PLANS" /></td>
  <td><img width="200" alt="Plan Details" src="PLACEHOLDER_DARK_PLAN_DETAILS" /></td>
  <td><img width="200" alt="Trainers Screen" src="PLACEHOLDER_DARK_TRAINERS" /></td>
</tr>
<tr>
  <td align="center">Home Screen</td>
  <td align="center">Plans Screen</td>
  <td align="center">Plan Details</td>
  <td align="center">Trainers Screen</td>
</tr>

<tr>
  <td><img width="200" alt="Favorites Screen" src="PLACEHOLDER_DARK_FAVORITES" /></td>
  <td><img width="200" alt="Profile Screen" src="PLACEHOLDER_DARK_PROFILE" /></td>
  <td><img width="200" alt="Edit Profile" src="PLACEHOLDER_DARK_EDIT_PROFILE" /></td>
  <td><img width="200" alt="Theme Selection" src="PLACEHOLDER_DARK_THEME" /></td>
</tr>
<tr>
  <td align="center">Favorites Screen</td>
  <td align="center">Profile Screen</td>
  <td align="center">Edit Profile</td>
  <td align="center">Theme Selection</td>
</tr>
</table>

---

## ⚪️ App Screens In Light mode:

<!-- TO THE USER: Replace the 'src' in the table below with your Light Mode screenshots after uploading them to GitHub -->

<table>
<tr>
  <td><img width="200" alt="Splash Screen Light" src="PLACEHOLDER_LIGHT_SPLASH" /></td>
  <td><img width="200" alt="Onboarding 1 Light" src="PLACEHOLDER_LIGHT_ONBOARDING_1" /></td>
  <td><img width="200" alt="Onboarding 2 Light" src="PLACEHOLDER_LIGHT_ONBOARDING_2" /></td>
  <td><img width="200" alt="Onboarding 3 Light" src="PLACEHOLDER_LIGHT_ONBOARDING_3" /></td>
</tr>
<tr>
  <td align="center">Splash Screen</td>
  <td align="center">Onboarding 1</td>
  <td align="center">Onboarding 2</td>
  <td align="center">Onboarding 3</td>
</tr>

<tr>
  <td><img width="200" alt="Login Light" src="PLACEHOLDER_LIGHT_LOGIN" /></td>
  <td><img width="200" alt="Sign Up Light" src="PLACEHOLDER_LIGHT_SIGNUP" /></td>
  <td><img width="200" alt="Home Light" src="PLACEHOLDER_LIGHT_HOME" /></td>
  <td><img width="200" alt="Plans Light" src="PLACEHOLDER_LIGHT_PLANS" /></td>
</tr>
<tr>
  <td align="center">Login Screen</td>
  <td align="center">Sign Up Screen</td>
  <td align="center">Home Screen</td>
  <td align="center">Plans Screen</td>
</tr>
</table>

---

# 🏛️ Architecture & Modularization
<p align="center">
  <img width="100%" alt="Modular Architecture" src="assets/images/readme/iron_pulse_architecture.png" />
</p>

Iron Pulse is built following **Clean Architecture** principles with a strict **feature-first** folder structure. Each feature is fully isolated with its own `domain`, `data`, and `presentation` layers.

```
lib/
├── core/
│   ├── networking/
│   ├── errors/
│   ├── widgets/
│   ├── theme/
│   ├── services/
│   ├── usecases/
│   ├── enums/
│   └── entities/
│
└── features/
    ├── auth/
    ├── home/
    ├── plans/
    ├── trainers/
    ├── favorites/
    └── profile/
```

---

# 🗺️ App Navigation Flow

```mermaid
flowchart TD
    A([Launch]) --> B[Splash Screen]
    B --> C{First time?}
    C -- Yes --> D[Onboarding]
    C -- No --> E{Logged in?}
    D --> E
    E -- No --> F[Login / Sign Up]
    F --> G[OTP Verification]
    F --> H[Forgot Password]
    H --> I[Reset Password]
    G --> J
    E -- Yes --> J

    J[Main Shell] --> K[🏠 Home]
    J --> L[📋 Plans]
    J --> M[🧑‍🏫 Trainers]
    J --> N[❤️ Favorites]
    J --> O[👤 Profile]

    K --> P[Plan Details]
    L --> P
    O --> Q[Edit Profile]
    O --> R[Theme Selection]
```

---

# 🛠️ Tech Stack & Key Libraries

| Category | Technology / Library |
| :--- | :--- |
| **Language** | Dart |
| **Framework** | Flutter |
| **Architecture** | Clean Architecture, Feature-First |
| **State Management** | flutter_bloc (Cubit) |
| **Navigation** | go_router |
| **Backend / BaaS** | Supabase |
| **Dependency Injection** | get_it |
| **Error Handling** | dartz (Either) |
| **Local Storage** | flutter_secure_storage, hydrated_bloc |
| **Image Loading** | cached_network_image |
| **SVG Support** | flutter_svg |
| **Splash Screen** | flutter_native_splash |
| **Skeleton Loading** | skeletonizer |
| **Dialogs** | awesome_dialog |
| **Image Picker** | image_picker |
| **Toast Notifications** | fluttertoast |
| **Env Variables** | flutter_dotenv |
| **State Equality** | equatable |
| **Font** | Lexend |

---

# 🚀 Getting Started

Follow these steps to clone and run the **Iron Pulse** app on your local machine.

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/Eslam-Hossam1/fitness_app.git
```

### 2️⃣ 🔐 Configure Environment Variables
Create a `.env` file at the project root with the following variables:
```env
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

### 3️⃣ Install & Run
```bash
flutter pub get
dart run flutter_native_splash:create
flutter run
```

---

# 👥 Lead Contributors
- **[Eslam Hossam](https://github.com/Eslam-Hossam1)** - Lead Developer

---

<p align="center">Made with ❤️ and Flutter 💙</p>