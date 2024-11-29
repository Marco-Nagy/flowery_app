import 'package:equatable/equatable.dart';


class ForgetPasswordResponseEntity extends Equatable {
  final String? message;
  final String? info;

  const ForgetPasswordResponseEntity({this.message, this.info});

  @override
  List<Object?> get props => [message, info];

}
