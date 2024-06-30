part of '../home_layout_manager.dart';

class HomeLargeScreen extends StatefulWidget {
  final List<Prayer> accessingDatabase;
  const HomeLargeScreen({
    super.key,
    required this.accessingDatabase,
  });

  @override
  State<HomeLargeScreen> createState() => _HomeLargeScreenState();
}

class _HomeLargeScreenState extends State<HomeLargeScreen> {
  List<Prayer> _prayers = [];
  // ignore: prefer_final_fields
  List<Prayer> _userCreatedPrayers = [];
  late Prayer _selectedPrayer;

  @override
  void initState() {
    super.initState();
    _loadPrayers();
  }

  Future<void> _loadPrayers() async {
    final prayers = widget.accessingDatabase;
    if (mounted) {
      setState(() {
        _prayers = prayers;
        _selectedPrayer = (_prayers.isNotEmpty ? _getRandomPrayer() : null)!;
      });
    }
  }

  Prayer _getRandomPrayer() {
    final random = Random();
    final randomIndex = random.nextInt(_prayers.length);
    Prayer full = _prayers[randomIndex];
    return full;
  }

  // ignore: unused_element
  void _getUserCreatedPrayers() {
    for (var prayer in _prayers) {
      if (prayer.userCreation &&
          (_userCreatedPrayers.contains(prayer) == false)) {
        return _userCreatedPrayers.add(prayer);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int displayedImage = 8;
    bool loadWidgets = true;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome Home Friend :)'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Container(
            width: Dimensions.p4mScreenWidth,
            height: Dimensions.p4mScreenHeight,
            // decoration: const BoxDecoration(color: Colors.black),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, stops: const [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),
            child: Container(
              padding: Dimensions.p4mPaddingHorizontalMedium,
              height: Dimensions.colorPaletteHight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(backgroundImagesList[displayedImage]),
                    fit: BoxFit.fill),
              ),
              child: ad2(loadWidgets),
            )));
  }

  Widget ad2(loadWidgets) {
    if (loadWidgets == true) {
      return prayerOfTheDay(context);
    }
    return Container(
      alignment: Alignment.bottomCenter,
      child: AnimatedTextKit(
        pause: Durations.extralong4,
        animatedTexts: [
          FadeAnimatedText('P 4 M_Large'),
        ],
        repeatForever: true,
      ),
    );
  }

  Padding prayerOfTheDay(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              // decoration: BoxDecoration(
              //   color: Theme.of(context).primaryColor,
              //   borderRadius: const BorderRadius.all(
              //     Radius.circular(8),
              //   ),
              // ),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(20, 20),
                      bottomRight: Radius.elliptical(20, 20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      stops: const [
                        .2,
                        .9
                      ],
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.5),
                      ])),
            ),
          ),
          Positioned(
            top: 33,
            left: 15,
            child: Text(
              _selectedPrayer.title,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Positioned(
            top: 33,
            right: 15,
            child: Container(
              height: 28,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "MORE",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.surface,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Icon(Icons.expand_more_outlined),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 47),
              child: Container(
                height: 25,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.5), width: 1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.share_outlined,
                          // color: Theme.of(context).colorScheme.tertiary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "SHARE",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.surface,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 30),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "${_selectedPrayer.description}\n",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      "'${_selectedPrayer.body}'",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
