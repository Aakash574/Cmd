import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tuktuk/src/utils/constant/tt_colors.dart';

class TTAppBar extends StatefulWidget {
  const TTAppBar({
    super.key,
    required this.onPressedBars,
    required this.onPressedVertical,
    required this.iconVertical,
    required this.iconBar,
    required this.title,
  });

  final Function() onPressedBars;
  final IconData iconBar;
  final IconData iconVertical;
  final Function() onPressedVertical;
  final String title;

  @override
  State<TTAppBar> createState() => _TTAppBarState();
}

class _TTAppBarState extends State<TTAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconButtonForAppbar(
            onPressed: widget.onPressedBars,
            icon: widget.iconBar,
          ),
          Container(
            height: 64,
            width: 126,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // shape: BoxShape.rectangle,
              color: TtColors.ttPrimaryColor.shade800,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          iconButtonForAppbar(
            onPressed: widget.onPressedVertical,
            icon: widget.iconVertical,
          ),
        ],
      ),
    );
  }

  Container iconButtonForAppbar({
    required Function() onPressed,
    required IconData icon,
  }) {
    return Container(
      height: 64,
      width: 64,
      // color: Colors.white,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: TtColors.ttPrimaryColor.shade800,
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: IconButton(
        icon: FaIcon(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
