import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset("assets/images/Logo.svg"),
          )
        ],
      ),
    );
  }
}
