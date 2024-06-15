import 'package:flutter/material.dart';

import '../../helpers/dimensions.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var orientation = mediaQuery.orientation;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Widget'),
      ),
      body: orientation == Orientation.portrait
          ? _buildPortraitLayout()
          : _buildLandscapeLayout(),
    );
  }

  Widget _buildPortraitLayout() {
    return Center(
      child: Column(
        children: [
          Container(
            width: Dimensions.colorPaletteWidth,
            height: Dimensions.colorPaletteHight,
            color: Colors.blue,
          ),
          SizedBox(height: Dimensions.p4mVerticalSpaceMedium.height),
          Text(
            'Hello, Portrait!',
            style: TextStyle(
              fontSize: Dimensions.prayerTextFontSizeMedium,
            ),
          ),
          SizedBox(height: Dimensions.p4mVerticalSpaceSmall.height),
          Icon(
            Icons.star,
            size: Dimensions.iconSizeLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Dimensions.colorPaletteWidth,
            height: Dimensions.colorPaletteHight,
            color: Colors.blue,
          ),
          SizedBox(width: Dimensions.p4mHorizontalSpaceMedium.width),
          Text(
            'Hello, Landscape!',
            style: TextStyle(
              fontSize: Dimensions.prayerTextFontSizeMedium,
            ),
          ),
          SizedBox(width: Dimensions.p4mHorizontalSpaceSmall.width),
          Icon(
            Icons.star,
            size: Dimensions.iconSizeLarge,
          ),
        ],
      ),
    );
  }
}
