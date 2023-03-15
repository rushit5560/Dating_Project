// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
//
// class DemoScreen extends StatelessWidget {
//   DemoScreen({Key? key}) : super(key: key);
//
//   final CardSwiperController controller = CardSwiperController();
//
//   // final cards = candidates.map((candidate) => ExampleCard(candidate)).toList();
//
//   @override
//   Widget build(BuildContext context) {
//     return Sca
//     ffold(
//       body: Column(
//         children: [
//           Flexible(
//             child: CardSwiper(
//               controller: controller,
//               cards: cards,
//               onSwipe: _swipe,
//               padding: const EdgeInsets.all(24.0),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 FloatingActionButton(
//                   onPressed: controller.swipe,
//                   child: const Icon(Icons.rotate_right),
//                 ),
//                 FloatingActionButton(
//                   onPressed: controller.swipeLeft,
//                   child: const Icon(Icons.keyboard_arrow_left),
//                 ),
//                 FloatingActionButton(
//                   onPressed: controller.swipeRight,
//                   child: const Icon(Icons.keyboard_arrow_right),
//                 ),
//                 FloatingActionButton(
//                   onPressed: controller.swipeTop,
//                   child: const Icon(Icons.keyboard_arrow_up),
//                 ),
//                 FloatingActionButton(
//                   onPressed: controller.swipeBottom,
//                   child: const Icon(Icons.keyboard_arrow_down),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   void _swipe(int index, CardSwiperDirection direction) {
//     debugPrint('the card $index was swiped to the: ${direction.name}');
//   }
//
// }
