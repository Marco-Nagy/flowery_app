import 'package:equatable/equatable.dart';

class ChangePasswordResponseEntity extends Equatable{
  final String? token;

  const ChangePasswordResponseEntity({this.token});

  @override
  List<Object?> get props => [token];
}
