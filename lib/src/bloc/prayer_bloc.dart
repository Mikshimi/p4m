import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/loading_service.dart';
import 'prayer_event.dart';
import 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  PrayerBloc({required this.loadingService}) : super(PrayerInitial()) {
    // Register event handlers
    on<LoadPrayerLibrary>(_onLoadPrayerLibrary);
    on<LoadUserLibrary>(_onOnlyLoadUserLibrary);
    on<SaveUserLibrary>(_onSaveUserCreatedLibrary);
    on<LoadUserPrayerData>(_onLoadUserPrayerData);
  }

  final LoadingService loadingService;

  Future<void> _onLoadPrayerLibrary(
      LoadPrayerLibrary event, Emitter<PrayerState> emit) async {
    emit(PrayerLibraryLoading());
    try {
      final prayers = await loadingService.loadPrayerLibrary(
          event.libraryName, event.prayerSize);
      emit(PrayerLibraryLoaded(prayers: prayers));
    } catch (e) {
      emit(PrayerLibraryError(message: e.toString()));
    }
  }

  Future<void> _onOnlyLoadUserLibrary(
      LoadUserLibrary event, Emitter<PrayerState> emit) async {
    emit(PrayerLibraryLoading());
    try {
      final prayers =
          await loadingService.onlyLoadUserLibrary(event.libraryName);
      emit(PrayerLibraryLoaded(prayers: prayers));
    } catch (e) {
      emit(PrayerLibraryError(message: e.toString()));
    }
  }

  Future<void> _onLoadUserPrayerData(
      LoadUserPrayerData event, Emitter<PrayerState> emit) async {
    emit(PrayerLoading());
    try {
      await loadingService.loadUserPrayerData();
      emit(PrayerInitial());
    } catch (e) {
      emit(PrayerError(message: e.toString()));
    }
  }

  Future<void> _onSaveUserCreatedLibrary(
      SaveUserLibrary event, Emitter<PrayerState> emit) async {
    emit(PrayerLoading());
    try {
      await loadingService.saveCreatedLibrary(event.libraryName, event.prayers);
      emit(PrayerInitial());
    } catch (e) {
      emit(PrayerError(message: e.toString()));
    }
  }
}
