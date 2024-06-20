class UserJourney {

  List<String> pinnedPrayers;
  List<String> prayersCompleted;
  List<String> prayerResonated;
  List<String> favoritePrayers;


  UserJourney({
    required this.prayersCompleted,
    required this.pinnedPrayers,
    required this.prayerResonated,
    required this.favoritePrayers,
  });

  Map<String, dynamic> toMap() {
    return {
      'prayersCompleted':prayersCompleted,
      'pinnedPrayers': pinnedPrayers,
      'favoritePrayers': favoritePrayers,
      'prayerResonated':prayerResonated
    };
  }

  factory UserJourney.fromMap(Map<String, dynamic> map) {
    return UserJourney(
      prayersCompleted: List<String>.from( map['prayersCompleted']),
      pinnedPrayers: List<String>.from(map['pinnedPrayers']),
      favoritePrayers: List<String>.from(map['favoritePrayers']),
      prayerResonated: List<String>.from(map['prayerResonated']),
      
    );
  }
}
