

import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

Future<T?> showGenericDialog<T>({
  required BuildContext contex,
  required String title,
  required String content,
  required DialogOptionBuilder optionsBuilder,
}){
 final options = optionsBuilder();
 return showDialog<T>(
  context: contex,
  builder: (contex) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions:options.keys.map((optionTitle) {
        final T value = options[optionTitle];
        return TextButton(onPressed: () {

        }, child: Text (optionTitle)
        );
      }).toList(),
    );
  },
 );
}