import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pray_for_me/src/bloc/prayer_bloc.dart';
import 'package:pray_for_me/src/bloc/prayer_event.dart';
import 'package:pray_for_me/src/bloc/prayer_state.dart';
import 'package:pray_for_me/src/models/prayer.dart';
import '../home/home_layout_manager.dart';
import '../../global_widgets/p4m_playground/animations/ellipses_animation.dart';
import '../../global_widgets/p4m_playground/animations/line_animation.dart';

class SplashView extends StatefulWidget {
  final String libraryName;
  final String librarySize;

  const SplashView({super.key, required this.libraryName, required this.librarySize});

  static const routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool dataLoaded = false;
  bool animationCompleted = false;
  bool showEllipses = true;
  List<Prayer> prayerDatabase = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    context.read<PrayerBloc>().add(LoadPrayerLibrary(libraryName: widget.libraryName, prayerSize: widget.librarySize));
  }

  void _onEllipsesAnimationComplete() {
    setState(() {
      showEllipses = false;
    });
  }

  void _onAnimationComplete() {
    setState(() {
      animationCompleted = true;
      if (dataLoaded) {
        _navigateToHome();
      }
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeLayoutManager(
          loadedDatabase: prayerDatabase,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PrayerBloc, PrayerState>(
        listener: (context, state) {
          if (state is PrayerLibraryLoaded) {
            setState(() {
              prayerDatabase = state.prayers;
              dataLoaded = true;
              if (animationCompleted) {
                _navigateToHome();
              }
            });
          } else if (state is PrayerLibraryError) {
            // Handle error state if needed
          }
        },
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (dataLoaded)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LineAnimation(
                      letter: 'P',
                      onAnimationComplete: _onAnimationComplete,
                    ),
                    const SizedBox(width: 10),
                    LineAnimation(
                      letter: '4',
                      onAnimationComplete: _onAnimationComplete,
                    ),
                    const SizedBox(width: 10),
                    LineAnimation(
                      letter: 'M',
                      onAnimationComplete: _onAnimationComplete,
                    ),
                  ],
                ),
              const SizedBox(height: 20),
              EllipsesAnimation(onAnimationComplete: _onEllipsesAnimationComplete),
            ],
          ),
        ),
      ),
    );
  }
}
