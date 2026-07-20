import 'package:flutter/material.dart';

/// What a release build shows where a widget crashed, instead of Flutter's
/// grey rectangle. Deliberately buildable with no localizations or theme:
/// it must render even when the tree around it is broken, so the two
/// sentences are hardcoded in both shipped languages.
class ErrorFallback extends StatelessWidget {
  const ErrorFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color(0xFF1A1A2E),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.sentiment_dissatisfied_outlined, size: 48, color: Colors.white70),
              SizedBox(height: 16),
              Text(
                'Something went wrong\nЧто-то пошло не так',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Your queue and settings are safe. Restart the app.\n'
                'Очередь и настройки целы. Перезапустите приложение.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
