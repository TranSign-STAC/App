import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TranslationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                const SizedBox(
                  child: const Text(
                    "한국어",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 159,
                ),
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(
                  "assets/images/crossed_arrows_small.svg",
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 8,
                ),
                const SizedBox(
                  child: const Text(
                    "수어",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  width: 160,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            ),
            width: 375,
            height: 44,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
    );
  }
}
