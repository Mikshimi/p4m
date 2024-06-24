import 'package:flutter/foundation.dart';

class Prayer {
  final String prayerCode;
  final String title;
  final String category;
  final String subCategory;
  final String description;
  final String body;
  final String author;
  final int wordCount;
  final String faith;
  final String dateCreated;
  final bool resonate;
  final bool answered;
  final List<String> attachments;
  final List<String> comments;

  Prayer({
    required this.prayerCode,
    required this.title,
    required this.category,
    required this.subCategory,
    required this.description,
    required this.body,
    required this.author,
    required this.wordCount,
    required this.faith,
    required this.dateCreated,
    required this.resonate,
    required this.answered,
    required this.attachments,
    required this.comments,
  });

  factory Prayer.fromRawText(String rawText, String prayerCode) {
    final parts = rawText.split('#%*&');
    if (kDebugMode) {
      print("title: ${parts[0]}");
      print("category: ${parts[1]}");
      print("sub category: ${parts[2]}");
      print("description: ${parts[3]}");
      print("body: ${parts[4]}");
      print("Date Created: ${parts[5]}");
      print("author: ${parts[6]}");
      print("faith: ${parts[7]}");
    }
    return Prayer(
      prayerCode: prayerCode,
      title: parts[0],
      category: parts[1],
      subCategory: parts[2],
      description: parts[3],
      body: parts[4],
      author: parts[6],
      wordCount: parts[4].split(' ').length,
      faith: parts[7],
      dateCreated: parts[5],
      resonate: false,
      answered: false,
      attachments: [],
      comments: [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prayerCode': prayerCode,
      'title': title,
      'category': category,
      'subCategory': subCategory,
      'description': description,
      'body': body,
      'author': author,
      'wordCount': wordCount,
      'faith': faith,
      'dateCreated': dateCreated,
      'resonate': resonate,
      'answered': answered,
      'attachments': attachments,
      'comments': comments,
    };
  }

  factory Prayer.fromMap(Map<String, dynamic> map) {
    return Prayer(
      prayerCode: map['prayerCode'],
      title: map['title'],
      category: map['category'],
      subCategory: map['subCategory'],
      description: map['description'],
      body: map['body'],
      author: map['author'],
      wordCount: map['wordCount'],
      faith: map['faith'],
      dateCreated: map['dateCreated'],
      resonate: map['resonate'],
      answered: map['answered'],
      attachments: List<String>.from(map['attachments']),
      comments: List<String>.from(map['comments']),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory Prayer.fromJson(Map<String, dynamic> json) => Prayer.fromMap(json);
}
