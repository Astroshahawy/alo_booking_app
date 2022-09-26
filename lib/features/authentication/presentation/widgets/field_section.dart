import 'package:flutter/material.dart';

class FieldSection extends StatelessWidget {
  const FieldSection({
    Key? key,
    required this.title,
    required this.child,
    this.isSmallMarginRight = false,
    this.isSmallMarginLeft = false,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool isSmallMarginRight;
  final bool isSmallMarginLeft;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 1,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height * 0.057,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10.0,
                offset: const Offset(0.0, 7.0),
              ),
            ],
          ),
          child: child,
        ),
      ],
    );
  }
}
