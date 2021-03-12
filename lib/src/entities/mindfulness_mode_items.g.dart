// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mindfulness_mode_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MindfulnessModeTransition _$MindfulnessModeTransitionFromJson(
    Map<String, dynamic> json) {
  return MindfulnessModeTransition(
    imageCode: json['image'] as String,
    duration: MindfulnessModeItem._readDuration(json['duration'] as num),
    time: MindfulnessModeItem._readDuration(json['time'] as num),
  );
}

MindfulnessModeQuote _$MindfulnessModeQuoteFromJson(Map<String, dynamic> json) {
  return MindfulnessModeQuote(
    text: json['text'] as String,
    duration: MindfulnessModeItem._readDuration(json['duration'] as num),
    time: MindfulnessModeItem._readDuration(json['time'] as num),
  );
}

MindfulnessModeStopItem _$MindfulnessModeStopItemFromJson(
    Map<String, dynamic> json) {
  return MindfulnessModeStopItem(
    time: MindfulnessModeItem._readDuration(json['time'] as num),
  );
}
