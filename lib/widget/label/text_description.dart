import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ComponentTextDescription extends StatelessWidget {
  String? textContent;
  TextAlign textAlign;
  Color teksColor = Colors.black;
  double fontSize;
  FontWeight? fontWeight;
  int? maxLines;
  bool? isWrappedText;
  ComponentTextDescription(this.textContent,
      {super.key,
      this.textAlign = TextAlign.start,
      this.teksColor = Colors.black,
      required this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.maxLines,
      this.isWrappedText});
  @override
  Widget build(BuildContext context) {
    return _textDesc(
        textDesc: textContent.toString(),
        textAlign: textAlign,
        teksColor: teksColor);
  }

  Widget _textDesc(
      {String textDesc = "",
      textAlign = TextAlign.center,
      Color teksColor = Colors.black}) {
    return Text(
      textDesc,
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: fontWeight, color: teksColor),
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      strutStyle: StrutStyle(forceStrutHeight: isWrappedText),
    );
  }
}
