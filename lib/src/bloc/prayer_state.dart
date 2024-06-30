import 'package:equatable/equatable.dart';
import '../models/prayer.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object?> get props => [];
}

class PrayerInitial extends PrayerState {}

class PrayerLibraryLoading extends PrayerState {}

class PrayerLibraryLoaded extends PrayerState {
  final List<Prayer> prayers;

  const PrayerLibraryLoaded({required this.prayers});

  @override
  List<Object?> get props => [prayers];
}

class PrayerLibraryError extends PrayerState {
  final String message;

  const PrayerLibraryError({required this.message});

  @override
  List<Object?> get props => [message];
}

class PrayerLoading extends PrayerState {}

class PrayerError extends PrayerState {
  final String message;

  const PrayerError({required this.message});

  @override
  List<Object?> get props => [message];
}
