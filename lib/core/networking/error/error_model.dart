class ErrorModel {
  ErrorModel({
    this.error,
    this.stack,});

  String? error;
  String? stack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['stack'] = stack;
    return map;
  }



  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    return ErrorModel(
      error: map['error'] != null ? map['error'].toString() : 'error',
      stack: map['stack'] != null ? map['stack'].toString() : 'stack',
    );
  }
}
