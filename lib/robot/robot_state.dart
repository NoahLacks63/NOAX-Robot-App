enum RobotState {
  disabled(0),
  enabled(1),
  autonomous(2);

  final int value;

  const RobotState(this.value);
}