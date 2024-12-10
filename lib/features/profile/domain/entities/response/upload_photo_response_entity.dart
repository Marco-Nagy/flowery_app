import 'package:equatable/equatable.dart';

class UploadPhotoResponseEntity extends Equatable {
  final String? message;

  const UploadPhotoResponseEntity({this.message});

  @override
  List<Object?> get props => [
        message,
  ];
}
