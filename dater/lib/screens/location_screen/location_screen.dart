import 'package:flutter/material.dart';

import '../../comman_modules/custom_appbar.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(text: null),
    );
  }
}
