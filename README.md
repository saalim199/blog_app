## Getting Started

This project is a starting point for a Flutter application.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/) for mobile development
- [Visual Studio Code](https://code.visualstudio.com/) or any other preferred IDE

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/saalim199/blog_app.git
   cd blog_app
   ```

2. Install dependencies:

   ```sh
   flutter pub get
   ```

3. Run the app:
   ```sh
   flutter run
   ```

### Project Structure

- `lib/`: Contains the main Dart code for the application.
- `android/`: Contains the Android-specific code.

### Key Files

- [pubspec.yaml](pubspec.yaml): Contains the project's dependencies and metadata.
- [README.md](README.md): This file.

### Features

- Fetches and displays a list of blog posts.
- Uses the BLoC pattern for state management.
- If you are not connected to internet you can still access your favourite saved blog.
- Used hive storage to save favourite blogs.

### Contributing

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes.
4. Commit your changes (`git commit -m 'Add some feature'`).
5. Push to the branch (`git push origin feature-branch`).
6. Open a pull request.

### Resources

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/), which offers tutorials, samples, guidance on mobile development, and a full API reference.
