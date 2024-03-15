import 'package:gatitapp/domain/entities/cats.dart';

class CatModel extends Cat {
  const CatModel({
    required super.name,
    required super.origin,
    required super.affectionLevel,
    required super.intelligence,
    required super.imageUrl,
    required super.id,
    required super.description,
    required super.adaptability,
    required super.lifeSpan,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic>? image = json['image'];
    return CatModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      adaptability: json['adaptability'],
      origin: json['origin'],
      affectionLevel: json['affection_level'],
      intelligence: json['intelligence'],
      imageUrl: image?['url'] ?? '',
    );
  }
}
