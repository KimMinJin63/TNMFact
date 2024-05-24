import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  
  CollectionReference<Map<String, dynamic>> collectionReference =
        FirebaseFirestore.instance.collection("posts");

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.get();
    
    List<QueryDocumentSnapshot<Map<String, dynamic>>> dataList =
        querySnapshot.docs;
    
    return dataList;
  }
}
