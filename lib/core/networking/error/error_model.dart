class ErrorModel {
  ErrorModel({
      this.error, 
      this.stack,});

  ErrorModel.fromJson(dynamic json) {
    error = json['error'];
    stack = json['stack'];
  }
  String? error;
  String? stack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['stack'] = stack;
    return map;
  }

}