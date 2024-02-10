import 'package:flutter/material.dart';
import 'package:IDrop/screens/settings/components/theme_element.dart';
import 'package:IDrop/utils/widgets/section_header.dart';

class ThemeChoose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: Text(
        'Change theme of your profile',
        style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          ThemeElement(
            id: 1,
            name: 'Default theme',
            color: Color(0xFFE96137),
          ),
          ThemeElement(
            id: 2,
            name: 'Professional Dark',
            color: Color(0xFF263238),
          ),
          ThemeElement(
            id: 3,
            name: 'Young Blue',
            color: Color(0xFF0D47A1),
          ),
          ThemeElement(
            id: 4,
            name: 'Coach Amber',
            color: Color(0xFFFF8F00),
          ),
          ThemeElement(
            id: 5,
            name: 'Eco Green',
            color: Color(0xFF33691E),
          ),
        ],
      ),
    );
  }
}
