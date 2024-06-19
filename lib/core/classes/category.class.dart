import 'package:taller_final/core/interfaces/categories.interface.dart';

class Category implements ICategory {
  final int id;
  final String name;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['Id'] ?? 0,
      name: json['Name'] ?? '',
      description: json['Description'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, description: $description}';
  }
}
