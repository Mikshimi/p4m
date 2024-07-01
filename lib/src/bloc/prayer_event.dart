import 'package:equatable/equatable.dart';
import '../data/models/prayer.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();

  @override
  List<Object?> get props => [];
}

class LoadPrayerLibrary extends PrayerEvent {
  const LoadPrayerLibrary(
      {required this.libraryName, required this.prayerSize});

  final String libraryName;
  final String prayerSize;

  @override
  List<Object?> get props => [libraryName, prayerSize];
}

class LoadUserLibrary extends PrayerEvent {
  const LoadUserLibrary({required this.libraryName});

  final String libraryName;

  @override
  List<Object?> get props => [libraryName];
}

class LoadUserPrayerData extends PrayerEvent {}

class SaveUserLibrary extends PrayerEvent {
  const SaveUserLibrary({required this.libraryName, required this.prayers});

  final String libraryName;
  final List<Prayer> prayers;

  @override
  List<Object?> get props => [libraryName, prayers];
}
