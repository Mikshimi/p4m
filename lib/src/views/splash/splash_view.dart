import 'package:flutter/material.dart';
import '../../services/loading_service.dart';
import '../../global_widgets/p4m_playground/animations/ellipses_animation.dart';
import '../../global_widgets/p4m_playground/animations/line_animation.dart';
import '../../global_widgets/p4m_playground/animations/page_transition_1.dart';
import '../../services/path_provider_service.dart';
import '../home/home_layout_manager.dart';

class SplashView extends StatefulWidget {
  final String libraryName;

  const SplashView({super.key, required this.libraryName});

  static const routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final LoadingService _loadingService = LoadingService(PathProviderService());
  bool dataLoaded = false;
  bool animationCompleted = false;
  bool showEllipses = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadingService.loadUserData();
    await _loadingService.loadPrayerLibrary(widget.libraryName);
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
      createRouteWithTransition(
        const HomeLayoutManager(),
        HomeLayoutManager.routeName,
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
