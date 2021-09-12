import 'package:flutter/material.dart';

class BackButtonIconWidget extends StatelessWidget {
  const BackButtonIconWidget({
    Key key,
    this.color = Colors.black,
    this.onPressed,
  }) : super(key: key);

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
