import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///
///
///
class Config {
  static final Config _config = Config._internal();

  ///
  ///
  ///
  factory Config() {
    return _config;
  }

  double width;

  Config._internal();
}
