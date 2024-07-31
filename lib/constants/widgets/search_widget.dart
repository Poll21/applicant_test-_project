import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.only(left: 16, right: 16,bottom: 8),
      child: TextFormField(
        cursorColor: _theme.textTheme.headlineSmall?.color,
        decoration: InputDecoration(
          filled: true,
          fillColor: _theme.cardColor,
          focusColor:  _theme.cardColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 2, color: _theme.cardColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 1, color: _theme.cardColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 1, color: _theme.cardColor),
          ),
        ),
      ),
    );
  }
}