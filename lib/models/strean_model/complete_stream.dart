class CompletedStage {
  final String? type;
  final String? status;

  CompletedStage({this.type,this.status});

  factory CompletedStage.fromJson(Map<String, dynamic> json) {
    return CompletedStage(
      type: json["type"],
      status: json["status"],
    );
  }
}