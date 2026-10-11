# Smart Tic-Tac-Toe

An AI-powered Tic-Tac-Toe game built with Flutter. Log in, pick a mode, and play against a friend or take on an unbeatable opponent powered by the **Minimax algorithm**. Every match result is tracked so you can see your history as you play.

## Demo

🎥 **[Watch the video demo](https://drive.google.com/file/d/1xJJ3a9gfc6gkC0Ip1ZO7NtLHG7b7GDS4/view?usp=drivesdk)**

## Screenshots

| Login | Welcome | Mode Select |
|:-----:|:-------:|:-----------:|
| <img width="1080" height="2436" alt="WhatsApp Image 2026-10-12 at 1 24 36 AM" src="https://github.com/user-attachments/assets/ad539a8b-48d3-48b8-aa6b-a58057fd34ed" />
 | <img width="1080" height="2436" alt="WhatsApp Image 2026-10-12 at 1 24 38 AM" src="https://github.com/user-attachments/assets/34a6da95-bc30-4807-9c7a-2947adf22459" />
| <img width="1080" height="2436" alt="WhatsApp Image 2026-10-12 at 1 24 39 AM" src="https://github.com/user-attachments/assets/3db296db-d986-4b37-9224-155c50781f00" />
 |

| Gameplay | Result |
|:--------:|:------:|
| <img width="1080" height="2436" alt="WhatsApp Image 2026-10-12 at 1 24 37 AM (1)" src="https://github.com/user-attachments/assets/e19639bf-004f-43af-81de-96fa060f9203" />
 | <img width="1080" height="2436" alt="WhatsApp Image 2026-10-12 at 1 24 37 AM" src="https://github.com/user-attachments/assets/1591b491-886e-4126-b75c-6deec507accf" />
 |

## Features

- **User accounts:** sign up and log in with email and password, or sign in with a mobile number
- **Two game modes:** Two Players or Play With AI
- **Unbeatable AI:** uses the Minimax algorithm, so the best you can do against it is a draw
- **Complete game logic:** turn-based state management that handles wins, draws, and invalid moves
- **Match tracking:** a match counter, a result page with your match history, a "Next Round" flow, and a score reset option
- **Real-time game history:** results and progress are stored in Cloud Firestore
- **Cross-platform:** built with Flutter, runs on Android and iOS

## How the AI Works

The computer opponent uses **Minimax**, a decision algorithm for two-player turn-based games. It explores every possible future board state, assumes both players play perfectly, and picks the move that gives the best guaranteed outcome:

- **+1** if the AI wins
- **0** for a draw
- **-1** if the human wins

The AI maximizes its score on its own turn and minimizes yours on yours, which is why it never makes a losing move.

## Tech Stack

| Area | Technology |
|------|-----------|
| Framework | Flutter |
| Language | Dart |
| Backend | Firebase (Cloud Firestore) |
| AI | Minimax algorithm |

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- A Firebase project with Firestore enabled

### Run locally

```bash
# Clone the repository
git clone https://github.com/AbdulRafay-00/AI-Tic-Tac-Toe.git
cd AI-Tic-Tac-Toe

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Firebase setup

1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable **Cloud Firestore** and the sign-in methods the app uses (email/password and phone).
3. Connect the app to your project (for example with `flutterfire configure`), which adds the config files the app needs.

## Author

**Abdul Rafay**
Software Engineering student, University of Karachi

[GitHub](https://github.com/AbdulRafay-00) · [LinkedIn](https://www.linkedin.com/in/AbdulRafay)
