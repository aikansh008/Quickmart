import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String name;
  bool isFeatured;
  String image;
  String id;

  CategoryModel({
    required this.name,
    required this.isFeatured,
    required this.image,
    required this.id,
  });

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? true,
      );
    
  }
}
