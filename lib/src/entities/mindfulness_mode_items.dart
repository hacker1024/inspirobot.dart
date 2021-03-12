import 'package:json_annotation/json_annotation.dart';

part 'mindfulness_mode_items.g.dart';

/// A Mindfulness Mode instruction.
abstract class MindfulnessModeItem {
  /// The time to use the item at.
  @JsonKey(name: 'time', fromJson: _readDuration)
  final Duration time;

  const MindfulnessModeItem({
    required this.time,
  });

  static Duration _readDuration(num seconds) => Duration(
      microseconds: (seconds * Duration.microsecondsPerSecond).round());

  factory MindfulnessModeItem.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'transition':
        return MindfulnessModeTransition.fromJson(json);
      case 'quote':
        return MindfulnessModeQuote.fromJson(json);
      case 'stop':
        return MindfulnessModeStopItem.fromJson(json);
      default:
        throw FormatException('Unrecognised mindful mind item type!', json);
    }
  }

  @override
  String toString() => 'MindfulnessModeItem{time: $time}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MindfulnessModeItem &&
          runtimeType == other.runtimeType &&
          time == other.time;

  @override
  int get hashCode => time.hashCode;
}

/// A Mindfulness Mode instruction that can be displayed.
abstract class MindfulnessModeDisplayItem extends MindfulnessModeItem {
  /// The duration to display the item for.
  @JsonKey(name: 'duration', fromJson: MindfulnessModeItem._readDuration)
  final Duration duration;

  const MindfulnessModeDisplayItem({
    required this.duration,
    required Duration time,
  }) : super(
          time: time,
        );

  @override
  String toString() =>
      'MindfulnessModeDisplayItem{duration: $duration, time: $time}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is MindfulnessModeDisplayItem &&
          runtimeType == other.runtimeType &&
          duration == other.duration;

  @override
  int get hashCode => super.hashCode ^ duration.hashCode;
}

/// A Mindfulness Mode transition instruction.
@JsonSerializable()
class MindfulnessModeTransition extends MindfulnessModeDisplayItem {
  /// The image code to transition to.
  ///
  /// A URL can be generated with [buildImageUrl].
  @JsonKey(name: 'image')
  final String imageCode;

  const MindfulnessModeTransition({
    required this.imageCode,
    required Duration duration,
    required Duration time,
  }) : super(
          duration: duration,
          time: time,
        );

  factory MindfulnessModeTransition.fromJson(Map<String, dynamic> json) =>
      _$MindfulnessModeTransitionFromJson(json);

  @override
  String toString() =>
      'MindfulnessModeTransition{imageCode: $imageCode, duration: $duration, time: $time}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is MindfulnessModeTransition &&
          runtimeType == other.runtimeType &&
          imageCode == other.imageCode;

  @override
  int get hashCode => super.hashCode ^ imageCode.hashCode;
}

/// A Mindfulness Mode quote.
@JsonSerializable()
class MindfulnessModeQuote extends MindfulnessModeDisplayItem {
  /// The quote text.
  @JsonKey(name: 'text')
  final String text;

  const MindfulnessModeQuote({
    required this.text,
    required Duration duration,
    required Duration time,
  }) : super(
          duration: duration,
          time: time,
        );

  factory MindfulnessModeQuote.fromJson(Map<String, dynamic> json) =>
      _$MindfulnessModeQuoteFromJson(json);

  @override
  String toString() =>
      'MindfulnessModeQuote{text: $text, duration: $duration, time: $time}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is MindfulnessModeQuote &&
          runtimeType == other.runtimeType &&
          text == other.text;

  @override
  int get hashCode => super.hashCode ^ text.hashCode;
}

/// A Mindfulness Mode stop instruction.
@JsonSerializable()
class MindfulnessModeStopItem extends MindfulnessModeItem {
  const MindfulnessModeStopItem({
    required Duration time,
  }) : super(
          time: time,
        );

  factory MindfulnessModeStopItem.fromJson(Map<String, dynamic> json) =>
      _$MindfulnessModeStopItemFromJson(json);
}
