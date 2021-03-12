/// A Mindfulness Mode session identifier.
class MindfulnessMode {
  /// A session identifier value.
  final String sessionId;

  const MindfulnessMode.fromSessionId(this.sessionId);

  @override
  String toString() => 'MindfulnessMode{sessionId: $sessionId}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MindfulnessMode &&
          runtimeType == other.runtimeType &&
          sessionId == other.sessionId;

  @override
  int get hashCode => sessionId.hashCode;
}
