import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  CustomBottomNavigationBar() : super();

  var _index;

  change(indexSelected) {
    _index = indexSelected;
  }

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black),
          label: "Frigo",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.all_inclusive, color: Colors.black),
          label: "Recette",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin_sharp, color: Colors.black),
          label: "Profil",
        ),
      ],
      onTap: (index) {
        widget.change(index);
        BlocProvider.of<SessionBloc>(context).add(SessionPageSelectedEvent(index));
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   CustomBottomNavigationBar() : super();

//   var _index;

//   change(indexSelected) {
//     _index = indexSelected;
//   }

//   @override
//   State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: 0,
//       selectedItemColor: Colors.amber[800],
//       onTap: (v) {},
//       elevation: 0.0,
//       type: BottomNavigationBarType.fixed,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Container(
//             width: 140,
//             height: 35,
//             decoration: const BoxDecoration(color: Color(0xffA3C2D4), borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: Stack(
//               children: [
//                 Container(
//                   width: 35,
//                   height: 35,
//                   decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
//                   child: const Icon(
//                     Icons.home,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const Center(
//                     child: Padding(
//                   padding: EdgeInsets.only(left: 20.0),
//                   child: Text(
//                     "Home",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Container(
//             width: 140,
//             height: 35,
//             decoration: const BoxDecoration(color: Color(0xffA3C2D4), borderRadius: BorderRadius.all(Radius.circular(20))),
//             child: Stack(
//               children: [
//                 Container(
//                   width: 35,
//                   height: 35,
//                   decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
//                   child: const Icon(
//                     Icons.notifications,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const Center(
//                     child: Padding(
//                   padding: EdgeInsets.only(left: 20.0),
//                   child: Text(
//                     "Notification",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//           label: '',
//         ),
//       ],
//     );
//   }
// }
