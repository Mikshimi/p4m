import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/loading_service.dart';
import 'prayer_event.dart';
import 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  final LoadingService loadingService;

  PrayerBloc({required this.loadingService}) : super(PrayerInitial()) {
    // Register event handlers
    on<LoadPrayerLibrary>(_onLoadPrayerLibrary);
    on<LoadUserPrayerData>(_onLoadUserPrayerData);
    on<SaveCreatedLibrary>(_onSaveCreatedLibrary);
  }

  Future<void> _onLoadPrayerLibrary(LoadPrayerLibrary event, Emitter<PrayerState> emit) async {
    emit(PrayerLibraryLoading());
    try {
      final prayers = await loadingService.loadPrayerLibrary(event.libraryName, event.prayerSize);
      emit(PrayerLibraryLoaded(prayers: prayers));
    } catch (e) {
      emit(PrayerLibraryError(message: e.toString()));
    }
  }

  Future<void> _onLoadUserPrayerData(LoadUserPrayerData event, Emitter<PrayerState> emit) async {
    emit(PrayerLoading());
    try {
      await loadingService.loadUserPrayerData();
      emit(PrayerInitial()); // Assuming user data load doesn't return prayers
    } catch (e) {
      emit(PrayerError(message: e.toString()));
    }
  }

  Future<void> _onSaveCreatedLibrary(SaveCreatedLibrary event, Emitter<PrayerState> emit) async {
    emit(PrayerLoading());
    try {
      await loadingService.saveCreatedLibrary(event.libraryName, event.prayers);
      emit(PrayerInitial());
    } catch (e) {
      emit(PrayerError(message: e.toString()));
    }
  }
}
