import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  String? headline;
  String? picture;
  String? content;
  String? author;
  String? category;
  DateTime? time;
  bool? mainNews;
  String? documentId;
  
  News({
    this.headline,
    this.picture,
    this.content,
    this.author,
    this.category,
    this.time,
    this.mainNews,
    this.documentId,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'headline': headline,
      'picture': picture,
      'content': content,
      'author': author,
      'category': category,
      'time': time?.millisecondsSinceEpoch,
      'mainNews': mainNews,
      'documentId': documentId,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      headline: map['headline'] != null ? map['headline'] as String : null,
      picture: map['picture'] != null ? map['picture'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      time: map['time'] != null ? DateTime.fromMillisecondsSinceEpoch(map['time'] as int) : null,
      mainNews: map['mainNews'] != null ? map['mainNews'] as bool : null,
      documentId: map['documentId'] != null ? map['documentId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);
}
