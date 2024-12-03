import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

TextEditingController useDebouncedTextController({
  required Duration debounce,
  required ValueChanged<String> onChanged,
  String? text,
}) {
  final textEditingController = useTextEditingController(text: text);
  useEffect(
    () {
      Timer? timer;
      void listener() {
        timer?.cancel();
        timer = Timer(debounce, () {
          onChanged(textEditingController.text);
        });
      }

      textEditingController.addListener(listener);
      return () {
        timer?.cancel();
        textEditingController.removeListener(listener);
      };
    },
    [textEditingController],
  );
  return textEditingController;
}
