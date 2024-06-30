class UserJourney {
  List<String> pinnedPrayers;
  List<String> prayersRead;
  List<String> prayerResonated; //resonate means like yes :)
  List<String> favoritePrayers;
  List<String> createdPrayers;

  UserJourney({
    required this.prayersRead,
    required this.pinnedPrayers,
    required this.prayerResonated,
    required this.favoritePrayers,
    required this.createdPrayers,
  });

  Map<String, dynamic> toMap() {
    return {
      'prayersCompleted': prayersRead,
      'pinnedPrayers': pinnedPrayers,
      'favoritePrayers': favoritePrayers,
      'prayerResonated': prayerResonated,
      'createdPrayers' : createdPrayers,
    };
  }

  factory UserJourney.fromMap(Map<String, dynamic> map) {
    return UserJourney(
      prayersRead: List<String>.from(map['prayersCompleted']),
      pinnedPrayers: List<String>.from(map['pinnedPrayers']),
      favoritePrayers: List<String>.from(map['favoritePrayers']),
      prayerResonated: List<String>.from(map['prayerResonated']),
      createdPrayers: List<String>.from(map['createdPrayers']),
    );
  }
}
