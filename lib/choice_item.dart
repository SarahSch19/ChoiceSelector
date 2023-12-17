import 'package:flutter/material.dart';

class Item {
  String content = "";
  final bool clickable;
  bool selected = false;

  Item({required this.content, this.clickable = true, this.selected = false});

  Color color() {
    if (clickable) {
      return selected ? Colors.amber : const Color(0xffeeeeee);
    }
    return Colors.white;
  }
}

class ItemsMap {
  final Map<String, Item> _itemsMap= {};

  void add (String key, Item value) {
    _itemsMap[key] = value;
  }

  void remove (String key) {
    _itemsMap.remove(key);
  }

  bool contains (String key) {
    return _itemsMap.containsKey(key);
  }

  List<Item> values () {
    return _itemsMap.values.toList().reversed.toList();
  }
}

class ChoiceItem extends StatelessWidget {
  final Item item;

  const ChoiceItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: item.color(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text(
          item.content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
