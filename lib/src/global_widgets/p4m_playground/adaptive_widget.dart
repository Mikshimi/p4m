import 'package:flutter/material.dart';

import '../../helpers/dimensions.dart';
import 'example_responsive.dart';


//the view able pages for the end user will be built with this in mind.

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var screenWidth = mediaQuery.size.width;

    if (screenWidth > 600) {
      return _buildLargeScreenLayout();
    } else {
      return const ResponsiveWidget();
    }
  }

  Widget _buildLargeScreenLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Large Screen Layout'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Dimensions.colorPaletteWidth,
              height: Dimensions.colorPaletteHight,
              color: Colors.blue,
            ),
            SizedBox(width: Dimensions.p4mHorizontalSpaceMedium.width),
            const Text(
              'Hello, Large Screen!',
              style: TextStyle(
                // fontSize: Dimensions.prayerTextFontSizeMedium,
              ),
            ),
            SizedBox(width: Dimensions.p4mHorizontalSpaceSmall.width),
            Icon(
              Icons.star,
              size: Dimensions.iconSizeLarge,
            ),
          ],
        ),
      ),
    );
  }
}
