import 'package:equatable/equatable.dart';

class ForgetPasswordRequestEntity extends Equatable {
  final String? email;

  ForgetPasswordRequestEntity({this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email];
}
