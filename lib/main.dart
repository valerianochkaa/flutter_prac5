import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'android_screen.dart';
import 'web_screen.dart';
import 'windows_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String platformMessage;
    if (kIsWeb) {
      platformMessage = "Web";
    } else if (Platform.isAndroid) {
      platformMessage = "Android";
    } else if (Platform.isWindows) {
      platformMessage = "Windows";
    } else {
      platformMessage = "Неизвестная платформа!";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Платформы приложения"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Главная страница запушенная на $platformMessage",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 26),

            ElevatedButton(
              onPressed: () {
                if (kIsWeb) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WebScreen()),
                  );
                } else if (Platform.isAndroid) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AndroidScreen()),
                  );
                } else if (Platform.isWindows) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WindowsScreen()),
                  );
                } else {
                  platformMessage = "Неизвестная платформа!";
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Далее"),
            ),
          ],
        ),
      ),
    );
  }
}
