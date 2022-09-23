import 'package:flutter/material.dart';

class Kcolor extends StatefulWidget {
  const Kcolor({
    Key? key,
    required this.color,
    required this.colors,
  }) : super(key: key);

  final Color color;
  final List<int> colors;

  @override
  State<Kcolor> createState() => _KcolorState();
}

class _KcolorState extends State<Kcolor> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    _isActive = widget.colors.contains(widget.color.value);

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(22.0)),
      onTap: () {
        _isActive
            ? widget.colors.remove(widget.color.value)
            : widget.colors.add(widget.color.value);

        setState(() => _isActive = !_isActive);
      },
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: !_isActive
            ? null
            : BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: BoxShape.circle,
              ),
        child: CircleAvatar(
          backgroundColor: widget.color,
          radius: 18,
        ),
      ),
    );
  }
}
