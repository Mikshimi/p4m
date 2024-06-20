/*
  the purpose of this class is to turn each prayer from raw data into an object
*/
class Prayer {
  String prayerCode;
  String prayerTitle;
  String prayerCategory;
  String prayerSubCategory;
  String prayerDescription;
  String prayerBody;
  String prayerAuthor;
  int prayerWordcount;
  String prayerFaith;
  String prayerDateCreated;
  int prayerResonate;
  String prayerAnswered;
  bool prayerRead;
  List<String> prayerAttachments;
  List<String> prayerComments;

  Prayer({
    required this.prayerCode,
    required this.prayerTitle,
    required this.prayerCategory,
    required this.prayerSubCategory,
    required this.prayerDescription,
    required this.prayerBody,
    required this.prayerAuthor,
    required this.prayerWordcount,
    required this.prayerFaith,
    required this.prayerDateCreated,
    required this.prayerResonate,
    required this.prayerAnswered,
    required this.prayerAttachments,
    required this.prayerComments,
    required this.prayerRead
  });

  Map<String, dynamic> toMap() {
    return {
      'prayerCode': prayerCode,
      'prayerTitle': prayerTitle,
      'prayerCategory': prayerCategory,
      'prayerSubCategory': prayerSubCategory,
      'prayerDescription': prayerDescription,
      'prayerBody': prayerBody,
      'prayerAuthor': prayerAuthor,
      'prayerWordcount': prayerWordcount,
      'prayerFaith': prayerFaith,
      'prayerDateCreated': prayerDateCreated,
      'prayerResonate': prayerResonate,
      'prayerAnswered': prayerAnswered,
      'prayerAttachments': prayerAttachments,
      'prayerComments': prayerComments,
      'prayerRead': prayerRead
    };
  }

  factory Prayer.fromMap(Map<String, dynamic> map) {
    return Prayer(
      prayerCode: map['prayerCode'],
      prayerTitle: map['prayerTitle'],
      prayerCategory: map['prayerCategory'],
      prayerSubCategory: map['prayerSubCategory'],
      prayerDescription: map['prayerDescription'],
      prayerBody: map['prayerBody'],
      prayerAuthor: map['prayerAuthor'],
      prayerWordcount: map['prayerWordcount'],
      prayerFaith: map['prayerFaith'],
      prayerDateCreated: map['prayerDateCreated'],
      prayerResonate: map['prayerResonate'],
      prayerAnswered: map['prayerAnswered'],
      prayerAttachments: List<String>.from(map['prayerAttachments']),
      prayerComments: List<String>.from(map['prayerComments']),
      prayerRead: map['prayerRead']
    );
  }
}
