import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.readOnly,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textController,
    this.bottomMargin,
    this.onTap,
    this.borderRadius,
    super.key,
  });

  final TextEditingController? textController;
  final bool readOnly;
  final String hintText;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final double? bottomMargin;
  final double? borderRadius;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin ?? 20),
      width: MediaQuery.of(context).size.width * .9,
      child: TextFormField(
        controller: textController,
        readOnly: readOnly,
        onTap: onTap,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  size: 15,
                  color: Colors.grey,
                )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline,
          ),
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: borderRadius == null || borderRadius == 10
                ? BorderRadius.circular(10)
                : BorderRadius.vertical(
                    top: const Radius.circular(10),
                    bottom: Radius.circular(borderRadius ?? 10),
                  ),
          ),
        ),
      ),
    );
  }
}
