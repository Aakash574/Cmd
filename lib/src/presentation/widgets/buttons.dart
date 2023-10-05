import 'package:flutter/material.dart';

class TTButton extends StatelessWidget {
  const TTButton({
    super.key,
    required this.size,
    required this.title,
    required this.context,
    required this.onTap,
  });

  final Size size;
  final String title;
  final BuildContext context;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width / 2,
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
              ),
        ),
      ),
    );
  }
}

class TTBackButton extends StatelessWidget {
  const TTBackButton({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: BackButton(
        color: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
