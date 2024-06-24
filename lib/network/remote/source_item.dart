import 'package:flutter/material.dart';
import 'package:news_app/models/source_response.dart';

class SourcesItem extends StatelessWidget {
  final Sources source;
  final bool selected;

  const SourcesItem({required this.source, required this.selected, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(25),
          color: selected ? Colors.green : Colors.white),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
