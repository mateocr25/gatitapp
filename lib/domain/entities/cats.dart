import 'package:equatable/equatable.dart';

class Cat extends Equatable {
  final String id;
  final String name;
  final String description;
  final int adaptability;
  final String lifeSpan;
  final String origin;
  final int affectionLevel;
  final int intelligence;
  final String imageUrl;

  const Cat({
    required this.id,
    required this.name,
    required this.description,
    required this.adaptability,
    required this.lifeSpan,
    required this.origin,
    required this.affectionLevel,
    required this.intelligence,
    required this.imageUrl,
  });

  Cat copyWith({
    String? id,
    String? name,
    String? description,
    int? adaptability,
    String? lifeSpan,
    String? origin,
    int? affectionLevel,
    int? intelligence,
    String? imageUrl,
  }) =>
      Cat(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        adaptability: adaptability ?? this.adaptability,
        lifeSpan: lifeSpan ?? this.lifeSpan,
        origin: origin ?? this.origin,
        affectionLevel: affectionLevel ?? this.affectionLevel,
        intelligence: intelligence ?? this.intelligence,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        adaptability,
        lifeSpan,
        origin,
        affectionLevel,
        intelligence,
        imageUrl,
      ];
}
