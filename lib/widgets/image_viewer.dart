import 'dart:typed_data';

import 'package:app/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///
///
///
class ImageViewer {
  ///
  ///
  ///
  static Future<bool> visualizeImage({
    @required BuildContext context,
    ImageProvider provider,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: provider, fit: BoxFit.cover, scale: 2.2),
            ),
          ),
        );
      },
    );
  }
}
