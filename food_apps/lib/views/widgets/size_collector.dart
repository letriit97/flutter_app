import 'package:flutter/material.dart';

class SizeCollector extends StatefulWidget {
  const SizeCollector({super.key});

  @override
  State<SizeCollector> createState() => _SizeCollectorState();
}

class _SizeCollectorState extends State<SizeCollector> {
  int selectedSizeIndex = 0;
  final sizes = ["S", "M", "L"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        sizes.length,
        (index) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: ChoiceChip(
            label: Text(sizes[index]),
            selected: selectedSizeIndex == index,
            onSelected: (bool selected) {
              setState(() {
                selectedSizeIndex = selected ? index : selectedSizeIndex;
              });
            },
            selectedColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(
              color: selectedSizeIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
