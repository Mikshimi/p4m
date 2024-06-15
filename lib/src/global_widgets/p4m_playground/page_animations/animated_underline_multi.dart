import 'package:flutter/material.dart';

class AnimatedUnderlineList extends StatefulWidget {
  final List<String> categories;
  final int selectedIndex;
  final Function(int) onCategorySelected;

  // ignore: use_super_parameters
  const AnimatedUnderlineList({
    Key? key,
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedUnderlineListState createState() => _AnimatedUnderlineListState();
}

class _AnimatedUnderlineListState extends State<AnimatedUnderlineList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.categories.asMap().entries.map((entry) {
        int idx = entry.key;
        String category = entry.value;
        bool isSelected = widget.selectedIndex == idx;

        return GestureDetector(
          onTap: () => widget.onCategorySelected(idx),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(top: 5.0),
                  height: 2.0,
                  width: isSelected ? _calculateTextWidth(category) : 0.0,
                  color: isSelected ? Colors.blue : Colors.transparent,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  double _calculateTextWidth(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: const TextStyle(fontSize: 16.0)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size.width;
  }
}
