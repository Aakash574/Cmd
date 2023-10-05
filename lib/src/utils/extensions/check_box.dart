import 'package:flutter/material.dart';

extension MaterialStatePropertyExtension<T> on T {
  MaterialStateProperty<T> mSPA() {
    return MaterialStatePropertyAll<T>(this);
  }
}
