import 'package:equatable/equatable.dart';

class GenericResponseEntity extends Equatable {
  GenericResponseEntity({
    this.message,
    this.metadata,
    this.items,
  });

  final String? message;
  final Metadata? metadata;
  final List<Items>? items;

  @override
  List<Object?> get props => [message, metadata, items];
}

class Items extends Equatable {
  Items({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  @override
  List<Object?> get props => [id, name, slug, image, createdAt, updatedAt];
}

class Metadata extends Equatable {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit];
}
