import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<ImageProvider> loadImage(int retriesLeft, String photoUrl,) async {
  try {
    final response = await http.get(Uri.parse(photoUrl));
    if (response.statusCode == 200) {
      return NetworkImage(photoUrl);
    } else {
      throw Exception('Failed to load image');
    }
  } catch (e) {
    if (retriesLeft > 0) {
      await Future.delayed(Duration(milliseconds: 2000));
      return loadImage(retriesLeft - 1, photoUrl);
    } else {
      throw Exception('Failed to load image after $retriesLeft attempts');
    }
  }
}