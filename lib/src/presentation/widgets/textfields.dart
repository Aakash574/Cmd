import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TTTextFields extends StatefulWidget {
  const TTTextFields({
    super.key,
    required this.hintText,
    required this.prefix,
    required this.textInputType,
    required this.length,
  });
  final TextInputType textInputType;
  final String hintText;
  final int length;
  final String prefix;

  @override
  State<TTTextFields> createState() => _TTTextFieldsState();
}

class _TTTextFieldsState extends State<TTTextFields> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text(
            widget.prefix,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.length)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
