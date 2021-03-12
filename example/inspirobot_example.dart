import 'package:inspirobot/inspirobot.dart';

Future<void> main() async {
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
}
