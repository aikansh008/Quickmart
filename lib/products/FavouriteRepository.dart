import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/products/productmodel.dart';

class FavouriteRepository {
 static final _db = FirebaseFirestore.instance;
   static Future<void> updateproduct(
    
      ProductModel product,bool value) async {
    await _db
        .collection("Product")
        .doc(product.id)
        .update(product.toJson2("isFavourite", value));
  }
   static Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Product")
          .where('isFavourite', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
