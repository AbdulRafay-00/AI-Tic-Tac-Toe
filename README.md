Smart Tic-Tac-Toe

An AI-powered Tic-Tac-Toe game built with Flutter. Log in, pick a mode, and play against a friend or take on an unbeatable opponent powered by the Minimax algorithm. Every match result is tracked so you can see your history as you play.

Demo

🎥 Watch the video demo

Screenshots
Login	Welcome	Mode Select
<img src="screenshots/login.png" width="240">	<img src="screenshots/welcome.png" width="240">	<img src="screenshots/mode_select.png" width="240">
Gameplay	Result
<img src="screenshots/gameplay.png" width="240">	<img src="screenshots/result.png" width="240">
Features
User accounts: sign up and log in with email and password, or sign in with a mobile number
Two game modes: Two Players or Play With AI
Unbeatable AI: uses the Minimax algorithm, so the best you can do against it is a draw
Complete game logic: turn-based state management that handles wins, draws, and invalid moves
Match tracking: a match counter, a result page with your match history, a "Next Round" flow, and a score reset option
Real-time game history: results and progress are stored in Cloud Firestore
Cross-platform: built with Flutter, runs on Android and iOS
How the AI Works

The computer opponent uses Minimax, a decision algorithm for two-player turn-based games. It explores every possible future board state, assumes both players play perfectly, and picks the move that gives the best guaranteed outcome:

+1 if the AI wins
0 for a draw
-1 if the human wins

The AI maximizes its score on its own turn and minimizes yours on yours, which is why it never makes a losing move.

Tech Stack
Area	Technology
Framework	Flutter
Language	Dart
Backend	Firebase (Cloud Firestore)
AI	Minimax algorithm
Getting Started
Prerequisites
Flutter SDK
A Firebase project with Firestore enabled
Run locally
bash
# Clone the repository
git clone https://github.com/AbdulRafay-00/AI-Tic-Tac-Toe.git
cd AI-Tic-Tac-Toe

# Install dependencies
flutter pub get

# Run the app
flutter run
Firebase setup
Create a project in the Firebase Console.
Enable Cloud Firestore and the sign-in methods the app uses (email/password and phone).
Connect the app to your project (for example with flutterfire configure), which adds the config files the app needs.
Author

Abdul Rafay Software Engineering student, University of Karachi

GitHub · LinkedIn
