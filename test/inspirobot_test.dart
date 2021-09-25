import 'package:http/http.dart' as http;
import 'package:inspirobot/inspirobot.dart';
import 'package:test/test.dart';

void main() {
  final bot = InspiroBot();
  test('Generate and download', () async => http.get(await bot.generate()));
  test('Get Mindful audio', () async {
    final mindfulMode = await bot.startMindfulnessMode();
    final mindfulSet = await bot.getMindfulnessModeSet(mindfulMode);
    await http.get(mindfulSet.audioUrl);
  });
}
