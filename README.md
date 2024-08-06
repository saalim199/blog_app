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

3. Create a [`constant.dart`](command:_github.copilot.openSymbolFromReferences?%5B%22constant.dart%22%2C%5B%7B%22uri%22%3A%7B%22%24mid%22%3A1%2C%22fsPath%22%3A%22d%3A%5C%5Cflutter_projects%5C%5Cblog_app%5C%5Clib%5C%5Cblog_page%5C%5Cdata%5C%5Cprovider%5C%5Cdata_provider.dart%22%2C%22_sep%22%3A1%2C%22external%22%3A%22file%3A%2F%2F%2Fd%253A%2Fflutter_projects%2Fblog_app%2Flib%2Fblog_page%2Fdata%2Fprovider%2Fdata_provider.dart%22%2C%22path%22%3A%22%2Fd%3A%2Fflutter_projects%2Fblog_app%2Flib%2Fblog_page%2Fdata%2Fprovider%2Fdata_provider.dart%22%2C%22scheme%22%3A%22file%22%7D%2C%22pos%22%3A%7B%22line%22%3A0%2C%22character%22%3A38%7D%7D%2C%7B%22uri%22%3A%7B%22%24mid%22%3A1%2C%22fsPath%22%3A%22d%3A%5C%5Cflutter_projects%5C%5Cblog_app%5C%5Clib%5C%5Ccore%5C%5Csecrets%5C%5Cdemoconstant.dart%22%2C%22_sep%22%3A1%2C%22external%22%3A%22file%3A%2F%2F%2Fd%253A%2Fflutter_projects%2Fblog_app%2Flib%2Fcore%2Fsecrets%2Fdemoconstant.dart%22%2C%22path%22%3A%22%2Fd%3A%2Fflutter_projects%2Fblog_app%2Flib%2Fcore%2Fsecrets%2Fdemoconstant.dart%22%2C%22scheme%22%3A%22file%22%7D%2C%22pos%22%3A%7B%22line%22%3A0%2C%22character%22%3A29%7D%7D%5D%5D "Go to definition") file for secrets:

   ```sh
   cp lib/core/secrets/democonstant.dart lib/core/secrets/constant.dart
   ```

   Then, open [`lib/core/secrets/constant.dart`](command:_github.copilot.openRelativePath?%5B%7B%22scheme%22%3A%22file%22%2C%22authority%22%3A%22%22%2C%22path%22%3A%22%2Fd%3A%2Fflutter_projects%2Fblog_app%2Flib%2Fcore%2Fsecrets%2Fconstant.dart%22%2C%22query%22%3A%22%22%2C%22fragment%22%3A%22%22%7D%5D "d:\\flutter_projects\blog_app\lib\core\secrets\constant.dart") and add your admin secret.

4. Run the app:
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
