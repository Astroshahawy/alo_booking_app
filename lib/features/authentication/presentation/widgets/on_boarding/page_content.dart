import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  const PageContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            image,
            height: deviceSize.height * 0.35,
            alignment: Alignment.center,
          ),
          SizedBox(height: deviceSize.height * 0.12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              wordSpacing: 1,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: deviceSize.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.12),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                letterSpacing: 0.5,
                wordSpacing: 1,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
