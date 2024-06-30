import 'package:flutter/material.dart';
import 'package:pray_for_me/src/models/prayer.dart';
import '../../global_widgets/p4m_playground/animations/ellipses_animation.dart';
import '../../global_widgets/p4m_playground/animations/line_animation.dart';
import '../../services/loading_service.dart';
import '../home/home_layout_manager.dart';

//Loading a new Library should trigger splash and route home.
//reason being that perhaps the user does not wish to load the default library
class SplashView extends StatefulWidget {
  final String libraryName;
  final String librarySize;
  final LoadingService loadingService;

  const SplashView(
      {super.key,
      required this.loadingService,
      required this.libraryName,
      required this.librarySize});

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

  Future<void> _loadData() async {
    // if (kDebugMode) {
    //   print("splash loaded here is the library name: ${widget.libraryName}");
    // }
    prayerDatabase = (await widget.loadingService
        .loadPrayerLibrary(widget.libraryName, widget.librarySize));
    //This test is loading user saved library without p4m_library_seed
    //i.e. the default p4m library
    // prayerDatabase =(await widget.loadingService.onlyLoadUserLibrary("TestLibraryStorage"));
    setState(() {
      dataLoaded = true;
    });
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
      body: SizedBox(
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
            EllipsesAnimation(
                onAnimationComplete: _onEllipsesAnimationComplete),
          ],
        ),
      ),
    );
  }
}
