import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/products/BrandModel.dart';

class ProductModel {
  String id;
  int stock;
  String sku;
  String price;
  String title;
  String thumbnail;
  bool isFeatured;
  double salePrice;
  String description;
  String categoryId;
  List<String> images;
  String productType;
  String image;
  String discount;
  String category;
  BrandModel? brand;
  bool isfav;

  ProductModel({
    required this.brand,
    required this.id,
    required this.image,
    required this.sku,
    required this.price,
    required this.title,
    required this.stock,
    required this.thumbnail,
    required this.isFeatured,
    required this.salePrice,
    required this.categoryId,
    required this.description,
    required this.productType,
    required this.images,
    required this.discount,
    required this.category,
    required this.isfav,
  });

  Map<String, dynamic> toJson2(String field, bool value) {
    return {field: value};
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      brand: data['Brand'] != null ? BrandModel.fromSnapshot(data['Brand']) : null,
      isFeatured: data['IsFeatured'] ?? false,
      sku: data['SKU'] ?? '',
      price: data['Price'] ?? '',
      stock: data['Stock'] ?? 0,
      salePrice: (data['SalePrice'] as num?)?.toDouble() ?? 0.0,
      thumbnail: data['thumbnail'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      image: data['Image'] ?? '',
      title: data['Title'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      discount: data['discount'] ?? '',
      category: data['Category'] ?? '',
      images: (data['Images'] as List?)!.map((item) => item as String).toList(),
      isfav: data['isFavourite'] ?? false,
    );
  }
}
