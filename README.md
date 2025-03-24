# 🔐 Authentication App

🚀 A **Flutter-based Authentication App** using **Firebase Authentication** and **Shared Preferences** for user session management. The app includes **SignIn, SignUp, Forgot Password, and Splash Screen** features.

---

## 📱 **Screenshots**
| SignIn | SignUp | Forgot Password | Splash Screen |
|--------|--------|----------------|---------------|
| <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgnxPNvRWPNVOEUXv_wxPY16jKKt8L4fyb1nWntyMVBtoVmQxsGAu6lhCIRerCMYKjihcnjcz8YmH_LHpbN0IjzfNWHHuaLfxyTUz9ALdmy9oelSTUywSswln4GVZj6NFuhBpVERDhJ3Xk8Me5M0JPvUuRSfv285NviIa7HoLWT7uqporb3r0tB3-9Uo04N/s808/Screenshot%202025-03-24%20115835.png"> | <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhtyvOqXtZlpTmmkXOP4Iqg0z2n_xYzMRBMx6QVFuJBsDg_Aug03HRC4ByJgYja87_K3XlyaxI2P7dqX4A3wpHbdUcXUILzW9j5qzSKAnMHlqfiPpFxEJN-0tdOoLNVKe7AhBJXTc6R2E99pCWkwDN2alC_84s_WFNv2xHYWuo-7JZ2IG1H7f0vCJWGnjyg/s772/Screenshot%202025-03-24%20115819.png"> | <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhrUFCd0XgbbZo_ApJa9Cg4xdv8rHxqLkAlZWLAMdudLz-I4e7t39_5dKUUO0kllQgpY0bKa_ooJhGMQwxc62eBQs1vg7qnAYj97LMJr9paWeqvomKejLLWK1C7p1cpuHPa4zPaSlg_xQiNY5pe19OWrrZh1rVVB_qvXvHZAPYEFxFW5LBkvM3d0YNsdj0S/s782/Screenshot%202025-03-24%20115850.png"> | <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjgOFGCqQL80AMyCP5rPyzItFru43hWalGg25foQhrAElDQdTEPPjgQJosuBI67oxK-pCQI9riol9o0lEV5kT6eGsJO6YEO6yMBm9Kzct6lR6fw8iHqczqQb71Zq4cdmtaJNtG26-1tnbdzhkZW44XOHDTqy6CZYNkZmzhrjXOEOc0EuF6QrRVmo_9_5o9n/s820/Screenshot%202025-03-24%20115805.png"> | | <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgt7VWAdtOSTnAMeH_nmcpYkRQecHhY3QaOSvWZiqsp3Wnqfwn3ksweVvS-OokcoOedJSB97aJyV6-SuVJF4flnFKsI1m3UXpoRskCL_67FgLWXFGUKHbxyS_FYtiL7iFOvjQORmdKUDNkvTPmZaEjSSpHwkQfaPELML3g7hI4xNjt3xvoFYZYOXsT561dd/s470/Screenshot%202025-03-24%20120025.png"> |


---

## ✨ **Features**
✅ Firebase Authentication (Email & Password)  
✅ Sign Up, Sign In & Forgot Password  
✅ Firebase Firestore Integration  
✅ Shared Preferences for User Session  
✅ Responsive UI with Modern Design  
✅ Bloc State Management (Optional)  

---

## 📂 **Project Structure**
lib/ │── auth/ │ ├── data/ │ │ ├── datasource/ │ │ │ ├── user_data_source.dart │ │ ├── models/ │ │ │ ├── user_model.dart │ ├── domain/ │ │ ├── entities/ │ │ │ ├── user.dart │ │ ├── usecases/ │ │ │ ├── signin_usecase.dart │ │ │ ├── signup_usecase.dart │ │ │ ├── forgotpassword_usecase.dart │ ├── presentation/ │ │ ├── screens/ │ │ │ ├── splash_screen.dart │ │ │ ├── signin_screen.dart │ │ │ ├── signup_screen.dart │ │ │ ├── forgotpassword_screen.dart │ │ ├── bloc/ │ │ │ ├── user_bloc.dart │ │ │ ├── user_event.dart │ │ │ ├── user_state.dart │── main.dart

yaml
Copy
Edit

---

## 🛠 **Technologies Used**
- **Flutter** (Dart)
- **Firebase Authentication**
- **Firebase Firestore**
- **Shared Preferences** (Session Management)
- **BLoC (Optional, for State Management)**
