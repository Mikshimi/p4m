import 'package:equatable/equatable.dart';
import '../data/models/prayer.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object?> get props => [];
}

class PrayerInitial extends PrayerState {}

class PrayerLibraryLoading extends PrayerState {}

class UserLibraryLoading extends PrayerState {}


class PrayerLibraryLoaded extends PrayerState {
  const PrayerLibraryLoaded({required this.prayers});

  final List<Prayer> prayers;

  @override
  List<Object?> get props => [prayers];
}

class PrayerLibraryError extends PrayerState {
  const PrayerLibraryError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class OnlyUserLibraryLoaded extends PrayerState {
  const OnlyUserLibraryLoaded({required this.prayers});

  final List<Prayer> prayers;

  @override
  List<Object?> get props => [prayers];
}

class OnlyUserLibraryError extends PrayerState {
  const OnlyUserLibraryError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

class PrayerLoading extends PrayerState {}

class PrayerError extends PrayerState {
  const PrayerError({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
