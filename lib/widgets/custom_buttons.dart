import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? onTap;
  final Color? btnColor;
  final Color? onPrimaryColor;
  final Widget? btnDataRow;

  const CustomButton({Key? key,
    required this.onTap,
    required this.btnText,
    this.btnColor = Colors.amber,
    this.btnDataRow,
    this.onPrimaryColor = Colors.amber,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: onPrimaryColor, backgroundColor: btnColor,
          minimumSize: Size(width, height * 0.08),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: btnDataRow ?? Center(
          child: Text(btnText!,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}