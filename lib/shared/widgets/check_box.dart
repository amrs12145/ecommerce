import 'package:flutter/material.dart';

import '../constants/colors.dart';

class KcheckBox extends StatefulWidget {
  const KcheckBox({
    Key? key,
    required this.text,
    required this.selected,
  }) : super(key: key);

  final String text;
  final List<String> selected;

  @override
  State<KcheckBox> createState() => _KcheckBoxState();
}

class _KcheckBoxState extends State<KcheckBox> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    _isActive = widget.selected.contains(widget.text);

    return ListTile(
      selected: _isActive ? true : false,
      selectedColor: Kcolors.primary,
      onTap: () {
        setState(() {
          _isActive
              ? widget.selected.remove(widget.text)
              : widget.selected.add(widget.text);
        });
      },
      leading: Text(widget.text),
      trailing: Checkbox(
        value: _isActive,
        onChanged: (_) {
          setState(() {
            _isActive
                ? widget.selected.remove(widget.text)
                : widget.selected.add(widget.text);
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
