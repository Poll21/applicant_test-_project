import 'package:flutter/material.dart';

class SliverNoValues extends StatelessWidget {
  final String noValues;
  const SliverNoValues({
    super.key, required this.noValues,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius:
          const BorderRadius.all(Radius.circular(16)),
        ),
        child: Text(
          noValues,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}