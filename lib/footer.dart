import 'package:choice_selector/choice_item.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final List<Item> items;
  final void Function(int) callback;

  Footer(this.items, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Wrap(
          spacing: 10,
          runSpacing: 5,
          children: itemsListBuild(),
        ),
      ),
    );
  }

  List<Widget> itemsListBuild() {
    return List.generate(
      items.length,
      (index) => GestureDetector(
        onTap: () => callback(index),
        child: ChoiceItem(
          items[index],
        ),
      ),
    );
  }
}
