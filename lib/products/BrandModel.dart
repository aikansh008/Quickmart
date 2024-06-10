
class BrandModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  int productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    required this.productsCount,
  });

  factory BrandModel.fromSnapshot(Map<String, dynamic> document) {
    final data = document;
    return BrandModel(
      id: data['Id'] ?? '', 
      name: data['Name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: data['ProductCount'] ?? 0, 
    );
  }
}
