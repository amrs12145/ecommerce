import 'package:flutter/material.dart';

import '../constants/colors.dart';

class KcheckBox extends StatefulWidget {
  const KcheckBox({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<KcheckBox> createState() => _KcheckBoxState();
}

class _KcheckBoxState extends State<KcheckBox> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: _isActive ? true : false,
      selectedColor: Kcolors.primary,
      onTap: () {
        setState(() {
          _isActive = !_isActive;
        });
      },
      leading: Text(widget.text),
      trailing: Checkbox(
        value: _isActive,
        onChanged: (value) {
          setState(() {
            _isActive = !_isActive;
          });
        },
        activeColor: Kcolors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.0),
          ),
        ),
      ),
    );
  }
}
