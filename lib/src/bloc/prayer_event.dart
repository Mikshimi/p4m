import 'package:equatable/equatable.dart';
import '../models/prayer.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadPrayerLibrary extends PrayerEvent {
  final String libraryName;
  final String prayerSize;

  const LoadPrayerLibrary({required this.libraryName, required this.prayerSize});

  @override
  List<Object?> get props => [libraryName, prayerSize];
}

class LoadUserPrayerData extends PrayerEvent {}

class SaveCreatedLibrary extends PrayerEvent {
  final String libraryName;
  final List<Prayer> prayers;

  const SaveCreatedLibrary({required this.libraryName, required this.prayers});

  @override
  List<Object?> get props => [libraryName, prayers];
}
