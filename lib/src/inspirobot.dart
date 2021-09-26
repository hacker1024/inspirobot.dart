import 'dart:convert';

import 'package:http/http.dart';
import 'package:inspirobot/src/entities/mindfulness_mode.dart';
import 'package:inspirobot/src/entities/mindfulness_mode_items.dart';
import 'package:inspirobot/src/entities/mindfulness_mode_set.dart';

/// An InspiroBot API client.
///
/// Use this to receive images and mindfulness mode data.
/// Call [close] when the object is no longer in use to close open connections.
class InspiroBot {
  final _client = Client();

  /// Closes the client, closes any open connections.
  void close() => _client.close();

  /// Makes an InspiroBot API request with the given [parameters].
  ///
  /// May throw a [SocketException] when network connectivity issues occur.
  Future<String> _makeApiRequest(Map<String, String> parameters) =>
      _client.read(Uri(
        scheme: 'https',
        host: 'inspirobot.me',
        path: 'api',
        queryParameters: parameters,
      ));

  /// Generates an InspiroBot image, completing with the image URL as a
  /// [String].
  ///
  /// May throw a [SocketException] when network connectivity issues occur.
  Future<String> generateString({bool christmas = false}) => _makeApiRequest({
        'generate': 'true',
        if (christmas) 'season': 'xmas',
      });

  /// Generates an InspiroBot image, completing with the image URL as a [Uri].
  ///
  /// May throw a [SocketException] when network connectivity issues occur.
  Future<Uri> generate({bool christmas = false}) async =>
      Uri.parse(await generateString(christmas: christmas));

  /// Starts a Mindfulness Mode session.
  ///
  /// May throw a [SocketException] when network connectivity issues occur.
  Future<MindfulnessMode> startMindfulnessMode() async =>
      MindfulnessMode.fromSessionId(
          await _makeApiRequest({'getSessionID': '1'}));

  /// Retrieves a set of Mindfulness Mode instructions.
  ///
  /// May throw a [SocketException] when network connectivity issues occur.
  /// May throw a [FormatException] when invalid data is received.
  Future<MindfulnessModeSet> getMindfulnessModeSet(
      MindfulnessMode mindfulnessMode) async {
    final response = jsonDecode(await _makeApiRequest({
      'generateFlow': '1',
      'sessionID': mindfulnessMode.sessionId,
    }));
    if (response is! Map<String, dynamic>) {
      throw FormatException(
          'Could not parse mindfulness mode set JSON!', response);
    }
    return MindfulnessModeSet.fromJson(response);
  }
}

extension MindefulnessModeImageApi on MindfulnessModeTransition {
  /// Generate a Mindfulness Mode image URL from the [MindfulnessModeTransition].
  ///
  /// The image will be cropped based on the [width] and [height] values.
  /// These values must be greater than 1.
  /// Default values are used by the InspiroBot Web app.
  Uri buildImageUrl({
    int width = 1600,
    int height = 900,
  }) {
    assert(width > 1 && height > 1, 'Image dimensions must be greater than 1!');
    return Uri(
      scheme: 'https',
      host: 'source.unsplash.com',
      pathSegments: [
        imageCode,
        '${width}x$height',
      ],
    );
  }
}
