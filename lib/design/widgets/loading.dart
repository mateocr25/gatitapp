import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Lottie.asset("assets/loader.json"),
        ),
      ),
    );
  }

  Future show(BuildContext context) =>
      showGeneralDialog(context: context, pageBuilder: (_, __, ___) => this);
}
