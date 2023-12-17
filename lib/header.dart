import 'package:choice_selector/choice_item.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final List<Item> items;

  Header(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.deepPurpleAccent,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(context),
            buildContent(context),
          ],
        ),
      ),
    );
  }

  Widget title(BuildContext context) {
    return Text(
      "Vos choix :",
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  Widget emptyContent(BuildContext context) {
    return Text(
      "Cliquez sur les choix en-dessous !",
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget buildContent(BuildContext context) {
    Widget child = (items.isEmpty)
        ? emptyContent(context)
        : Wrap(
      spacing: 10,
      runSpacing: 5,
      children: List.generate(
        items.length,
            (index) => unclickableChoiceItem(items[index]),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: child,
    );
  }

  ChoiceItem unclickableChoiceItem(Item item) {
    return ChoiceItem(
      Item(
        content: item.content,
        clickable: false,
      ),
    );
  }
}
