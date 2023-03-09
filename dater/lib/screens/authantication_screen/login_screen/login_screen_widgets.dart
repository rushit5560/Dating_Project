import 'package:dater/constants/button_custom.dart';
import 'package:dater/constants/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColumnWidgets extends StatelessWidget {
  const ColumnWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
              children: [



                ButtonCustom(
                  onPressed: () {},
                  text: AppMessages.completsYou,
                  size: Size(double.infinity, 50),
                )
              ],
            );
  }
}