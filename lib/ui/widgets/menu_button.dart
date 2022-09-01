import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuButton extends StatelessWidget {
  final String label, route;
  final Color color;
  const MenuButton(
      {Key? key,
      required this.label,
      required this.route,
      this.color = Colors.transparent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(200, 45)),
              backgroundColor: MaterialStateProperty.resolveWith((state) {
                if (state.contains(MaterialState.pressed)) return Colors.grey;
                return color;
              }),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              side: MaterialStateProperty.all(BorderSide(width: 2))),
          onPressed: () =>
              Navigator.pushNamed(context, route, arguments: label),
          child: Text(label,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ))),
    );
  }
}
