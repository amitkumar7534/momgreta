class StreamMessage {
  final String? stage;
  final Map<String, dynamic>? data;
  final String? type;
  final String? status;

  StreamMessage({
    this.stage,
    this.data,
    this.type,
    this.status,
  });

  factory StreamMessage.fromJson(Map<String, dynamic> json) {
    return StreamMessage(
      stage: json["stage"],
      data: json["data"],
      type: json["type"],
      status: json["status"],
    );
  }
}
