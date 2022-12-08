import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class MessageErreur extends StatelessWidget {
  String messageErreur;

  MessageErreur({Key? key, required this.messageErreur}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Text(
        messageErreur,
        style: TextStyle(fontSize: 16, color: primaryColor),
      ),
    );
  }
}
