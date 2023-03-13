import 'package:flutter/material.dart';

class Tech
{
  String label;
  Color? color;
  bool isSelected;
  Tech(this.label, this.color, this.isSelected);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   bool selected = false;
  List<Tech> _chipsList = [
    Tech("India", Colors.brown, false),
    Tech("Canada", Colors.deepPurple, false),
    Tech("London", Colors.red, false),
    Tech("Paris", Colors.cyan, false),
    Tech("Japan", Colors.black54, false),
    Tech("Maldives", Colors.blueAccent, false),
    Tech("Switzerland", Colors.lightGreen, false)
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Flutter Chips"),
        ),
        body: Wrap(
          spacing: 8,
          direction: Axis.horizontal,
          children: techChips(),
        )
    );
  }
  List<Widget> techChips () {
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left:10, right: 5),
        child: FilterChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: _chipsList[i].color,
          selected: _chipsList[i].isSelected,
          onSelected: (bool value)
          {
            setState(() {
              _chipsList[i].isSelected = value;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}

