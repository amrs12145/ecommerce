import 'package:flutter/material.dart';

class Kcolor extends StatefulWidget {
  const Kcolor({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  State<Kcolor> createState() => _KcolorState();
}

class _KcolorState extends State<Kcolor> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(22.0)),
      onTap: () {
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
