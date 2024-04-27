import 'package:flutter/material.dart';

class RemoveAllItems extends StatelessWidget {
  const RemoveAllItems({super.key, this.deleteAllItemsPermanently});

  final void Function()? deleteAllItemsPermanently;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: deleteAllItemsPermanently,
      child: const Text("Remove All Forever"),
    );
  }
}
