import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/products/productmodel.dart';

class ElectronicsRepository {
  static final _db = FirebaseFirestore.instance;

  static Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Product")
          .where('Category', isEqualTo:'Electronics')
          .limit(6)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}
