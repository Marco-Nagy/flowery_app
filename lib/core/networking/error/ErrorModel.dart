/// message : "incorrect email or password"
/// code : 401
/// stack : "Error: incorrect email or password\n    at file:///home/exam/htdocs/exam.elevateegy.com/src/modules/auth/controller/auth.controller.js:34:8\n    at process.processTicksAndRejections (node:internal/process/task_queues:95:5)"

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
      message: map['message'] as String,
      code: map['code'] as int,
      stack: map['stack'] as String,
    );
  }
}