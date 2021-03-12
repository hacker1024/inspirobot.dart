# InspiroBot for Dart
An InspiroBot API client for Dart.

## About
This Dart package can retrieve images and Mindfulness Mode data from the API
provided by https://inspirobot.me.

## Usage
From [the example](example/inspirobot_example.dart):
```dart
import 'package:inspirobot/inspirobot.dart';
```
```dart
// Create a client.
final inspiroBot = InspiroBot();

// Generate an image.
final imageUrl = await inspiroBot.generate();

// Enter Mindfulness Mode, and get the first set.
final mindfulnessMode = await inspiroBot.startMindfulnessMode();
final mindfulnessModeSet =
  await inspiroBot.getMindfulnessModeSet(mindfulnessMode);

// Close the client.
inspiroBot.close();
```