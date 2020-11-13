class CreateSubLevelsModel{
  int id;
  String name;
  DateTime assignedDateTime;
  String userId;
  String customer;
  DateTime deadline;
  String remarks;
  double progress;
  bool isFinished;

  CreateSubLevelsModel(
      this.id,
      this.name,
      this.assignedDateTime,
      this.userId,
      this.customer,
      this.deadline,
      this.remarks,
      this.progress,
      this.isFinished);
}
