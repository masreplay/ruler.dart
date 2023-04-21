// import 'package:flutter/material.dart';
// import 'package:real_ruler/ruler.dart';
// import 'package:real_ruler/src/async_snapshot.dart';

// import 'inch.dart';

// typedef InchRulerBuilder = Widget Function(
//   BuildContext context,
// );

// typedef MMRulerBuilder = Widget Function(
//   BuildContext context,
// );

// class RulerBuilder extends StatelessWidget {
//   const RulerBuilder({
//     super.key,
//     required this.rulerType,
//     required this.axis,
//     this.inchBuilder,
//     this.cmBuilder,
//   });

//   final RulerType rulerType;

//   final Axis axis;

//   final InchRulerBuilder? inchBuilder;

//   final MMRulerBuilder? cmBuilder;

//   @override
//   Widget build(BuildContext context) {
//     const orElse = SizedBox.shrink();

//     return LayoutBuilder(builder: (context, constraints) {
//       switch (rulerType) {
//         case RulerType.dynamic:
          
//         case RulerType.count:
//           return orElse;
//         case RulerType.real:
//           return FutureBuilder(
//             future: getInchWidth(context, constraints, axis),
//             builder: (context, snapshot) {
//               return snapshot.maybeWhen(
//                 orElse: SizedBox.shrink,
//                 data: (inch) {},
//               );
//             },
//           );
//       }
//     });
//   }
// }
