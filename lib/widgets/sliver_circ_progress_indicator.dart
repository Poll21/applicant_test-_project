import 'package:flutter/material.dart';

class SliverCircProgressIndicator extends StatelessWidget {
  const SliverCircProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 64),
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: const CircularProgressIndicator(
              strokeAlign: 10,
              strokeWidth: 6,
            )));
  }
}