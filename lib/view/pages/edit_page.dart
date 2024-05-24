import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tnm2/controllers/edit_controller.dart';
import 'package:tnm2/view/pages/detail_news_page.dart';
import 'package:tnm2/view/pages/main_page.dart';

class EditPage extends GetView<EditController> {
  const EditPage({super.key});
  static const route = '/edit';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        Get.arguments != null ? Get.arguments as Map<String, dynamic> : {};

    String headline = arguments['headline'] ?? '';
    String picture = arguments['picture'] ?? '';
    String content = arguments['content'] ?? '';
    String documentId = arguments['documentId'] ?? '';
    String dateTime = arguments['dateTime'] ?? '';
    bool isEditing = arguments['isEditing'] ?? false;

    controller.textEditingController1.text = headline;
    controller.textEditingController2.text = content;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Page' : 'Post Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(alignment: Alignment.centerLeft, child: Text('제목')),
                TextField(
                  maxLines: 1,
                  controller: controller.textEditingController1,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    hintText: 'Write something...',
                  ),
                ),
                // const SizedBox(height: 20),
                // const Align(alignment: Alignment.centerLeft, child: Text('사진')),
                // GestureDetector(
                //   onTap: () {
                //     controller.getImage();
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                //     width: MediaQuery.of(context).size.width,
                //     height: MediaQuery.of(context).size.width / 3 * 2,
                //     child: Obx(() {
                //       if (controller.image.value != null) {
                //         return Image.file(File(controller.image.value!.path), fit: BoxFit.cover);
                //       } else if (picture.isNotEmpty) {
                //         return Image.network(picture, fit: BoxFit.cover);
                //       } else {
                //         return Icon(Icons.add);
                //       }
                //     }),
                //   ),
                // ),
                const SizedBox(height: 20),
                const Align(
                    alignment: Alignment.centerLeft, child: Text('글쓰기')),
                TextField(
                  maxLines: 10,
                  controller: controller.textEditingController2,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    hintText: 'Write something...',
                  ),
                ),
                const SizedBox(height: 20),
                const Align(alignment: Alignment.centerLeft, child: Text('사진')),
                GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 3 * 2,
                    child: Obx(() {
                      if (controller.image.value != null) {
                        return Image.file(File(controller.image.value!.path),
                            fit: BoxFit.cover);
                      } else if (picture.isNotEmpty) {
                        return Image.network(picture, fit: BoxFit.cover);
                      } else {
                        return Icon(Icons.add);
                      }
                    }),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                activeColor: Colors.black,
                                value: controller.isChecked.value,
                                onChanged: (bool? newValue) {
                                  if (newValue != null) {
                                    controller.isChecked.value = newValue;
                                  }
                                },
                              )),
                          const Text('주요 뉴스'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          String? imagePath = controller.selectedImagePath;
                          RxString titleValue =
                              controller.textEditingController1.text.obs;
                          RxString contentValue =
                              controller.textEditingController2.text.obs;
                          bool mainNews = controller.isChecked.value;

                          if (titleValue.isNotEmpty &&
                              contentValue.isNotEmpty) {
                            if (isEditing) {
                              await controller.updateDoc(
                                titleValue.value,
                                contentValue.value,
                                imagePath ?? picture, // 이미지가 없으면 기존 이미지를 사용
                                mainNews,
                                documentId,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('성공적으로 업데이트되었습니다.')),
                              );
                              Get.back();
                              Get.back();
                              Get.toNamed(DetailNewsPage.route, arguments: [
                                titleValue.value,
                                imagePath != null
                                    ? imagePath
                                    : picture, // 이미지가 선택되었으면 새 이미지, 아니면 기존 이미지 사용
                                contentValue.value,
                                dateTime,
                                documentId,
                              ]);
                            } else {
                              if (imagePath != null) {
                                String? imageUrl = await controller
                                    .uploadImage(File(imagePath));
                                if (imageUrl != null) {
                                  await controller.addDoc(
                                    titleValue.value,
                                    contentValue.value,
                                    imageUrl,
                                    mainNews,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('성공적으로 게시되었습니다.')),
                                  );
                                  Get.back();
                                  Get.back();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('이미지 업로드 실패')),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('이미지를 선택해주세요')),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('제목 또는 내용을 입력해주세요')),
                            );
                          }
                        },
                        child: Text(isEditing ? '저장하기' : '게시하기'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
