import 'package:test_application/ui/shared/text.dart';
import 'package:test_application/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: TextView(text: colorsScreenText, size: 20),
    );
  }
}
