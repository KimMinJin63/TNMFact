import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tnm2/models/news.dart';

class EditController extends GetxController {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  News news = News();
  Rx<XFile?> image = Rx<XFile?>(null);
  final ImagePicker picker = ImagePicker();
  RxBool isChecked = false.obs;
  String? selectedImagePath;
  String imageUrl = '';

  Future<void> getImage() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = pickedFile;
      selectedImagePath = pickedFile.path;
      print('이미지 경로: $selectedImagePath');
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      String imageName = textEditingController1.text;
      Reference ref = storage.ref().child('images/$imageName');
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      print('다운로드 URL: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      print('이미지 업로드 실패: $e');
      return null;
    }
  }

  Future<void> addDoc(String title, String content, String picture, bool mainNews) async {
    try {
      DocumentReference docRef = await FirebaseFirestore.instance.collection('posts').add({
        'title': title,
        'content': content,
        'image': picture,
        'mainNews': mainNews,
        'timestamp': DateTime.now(),
      });

      String newDocumentId = docRef.id;
      await FirebaseFirestore.instance.collection('posts').doc(newDocumentId).update({
        'documentId': newDocumentId
      });
      news.documentId = newDocumentId;
      print('새로운 문서가 추가되었습니다. Document ID: $newDocumentId');
    } catch (e) {
      print('문서 추가 중 오류 발생: $e');
    }
  }

  Future<void> updateDoc(String title, String content, String? imagePath, bool mainNews, String docId) async {
    try {
      if (imagePath != null && imagePath.isNotEmpty && File(imagePath).existsSync()) {
        String? downloadUrl = await uploadImage(File(imagePath));
        if (downloadUrl != null) {
          imageUrl = downloadUrl;
        } else {
          print('이미지 업로드 실패로 인해 업데이트 중단');
          return;
        }
      }

      Map<String, dynamic> updateData = {
        'title': title,
        'content': content,
        'mainNews': mainNews,
      };

      if (imageUrl.isNotEmpty) {
        updateData['image'] = imageUrl;
        print('왜 자꾸 문제냐!! : $imageUrl');
      }

      await FirebaseFirestore.instance.collection('posts').doc(docId).update(updateData);
      update();
      print('성공적으로 업데이트되었습니다. Document ID: $docId');
    } catch (e) {
      print('업데이트 중 오류 발생: $e');
    }
  }
}
