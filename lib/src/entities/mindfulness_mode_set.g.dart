// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mindfulness_mode_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MindfulnessModeSet _$MindfulnessModeSetFromJson(Map<String, dynamic> json) {
  return MindfulnessModeSet(
    items: (json['data'] as List<dynamic>)
        .map((e) => MindfulnessModeItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    audioUrl: Uri.parse(json['mp3'] as String),
  );
}
