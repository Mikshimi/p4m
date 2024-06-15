import 'package:flutter/material.dart';
import '../../helpers/dimensions.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: Dimensions.colorPaletteWidth,
              height: Dimensions.colorPaletteHight,
              color: Colors.blue,
            ),
            SizedBox(height: Dimensions.p4mVerticalSpaceMedium.height),
            Text(
              'Hello, World!',
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
      ),
    );
  }
}
