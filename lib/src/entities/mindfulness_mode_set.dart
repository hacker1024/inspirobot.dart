import 'package:collection/collection.dart';
import 'package:inspirobot/src/entities/mindfulness_mode_items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mindfulness_mode_set.g.dart';

/// A set of Mindfulness Mode instructions, with the audio URL to play.
@JsonSerializable()
class MindfulnessModeSet {
  /// The instructions to use.
  @JsonKey(name: 'data')
  final List<MindfulnessModeItem> items;

  /// The audio URL to play.
  @JsonKey(name: 'mp3')
  final Uri audioUrl;

  const MindfulnessModeSet({
    required this.items,
    required this.audioUrl,
  });

  factory MindfulnessModeSet.fromJson(Map<String, dynamic> json) =>
      _$MindfulnessModeSetFromJson(json);

  @override
  String toString() => 'MindfulnessModeSet{items: $items, audioUrl: $audioUrl}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MindfulnessModeSet &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(items, other.items) &&
          audioUrl == other.audioUrl;

  @override
  int get hashCode => const ListEquality().hash(items) ^ audioUrl.hashCode;
}
