import 'package:flutter/material.dart';

class CenteredCircularProgressIndicator extends StatelessWidget {
  const CenteredCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: CenteredCircularProgressIndicator(),
      //problem ta ekhane , ekhane ei widget bar bar nijeke call ditesiolo recursion
      //so infinite loop e pore gesilo bujhci vai but image to aslo na slider er
      child: SizedBox.shrink(),
    );
  }
}
