import 'package:hive/hive.dart';
import 'package:get/get.dart';

part 'character.g.dart';

@HiveType(typeId: 0)
class Character extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String image;

  @HiveField(6)
  final String location;

  @HiveField(7)
  bool _isFavorite; // Hive stores this as a plain bool

  RxBool isFavorite = false.obs; // UI reactive

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.location,
    bool isFavorite = false,
  })  : _isFavorite = isFavorite {
    this.isFavorite.value = isFavorite;
  }


  factory Character.fromJson(Map<String, dynamic> json) => Character(
    id: json['id'],
    name: json['name'],
    status: json['status'] ?? '',
    species: json['species'] ?? '',
    gender: json['gender'] ?? '',
    image: json['image'] ?? '',
    location: json['location']['name'] ?? '',
    isFavorite: json['isFavorite'] ?? false, // ✅ important
  );


  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'species': species,
    'gender': gender,
    'image': image,
    'location': location,
    'isFavorite': isFavorite.value, // ✅ correct for RxBool
  };

}
