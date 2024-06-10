import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/Categories/categorymodel.dart';

class CategoryRepository {
  bool isLoading = false;

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _firestore.collection("Catergory").where("IsFeatured", isEqualTo: true).get();
      final list =snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return list;
    } catch (e) {
      throw Exception("Failed to fetch categories: $e");
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      isLoading = true;
      final categories = await getAllCategories();
      return categories;
    } catch (e) {
      print("Failed to fetch categories: $e");
      rethrow; // Rethrow the error for the caller to handle
    } finally {
      isLoading = false;
    }
  }
}
