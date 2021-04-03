import 'package:flutter/material.dart';

import '../../../helper/utils/constants.dart';

class Ratings extends StatelessWidget {
  final double rating;

  const Ratings({
    Key? key,
    required this.rating,
  }) : super(key: key);

  int numStars(double rating) {
    final currentRange = 10 - 1; //max - min of current range
    final targetRange = 5 - 0; //max - min of target range
    final currentRatio = (rating - 1) / currentRange;
    return (currentRatio * targetRange + 0).toInt();
  }

  @override
  Widget build(BuildContext context) {
    final stars = numStars(rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Rating number
        Text(
          rating.toString(),
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(width: 10),

        //Rating stars
        for (int i = 0; i < stars; i++)
          Padding(
            padding: i == 0
                ? const EdgeInsets.only(right: 1)
                : const EdgeInsets.symmetric(horizontal: 1),
            child: Icon(
              Icons.star,
              size: 19,
              color: Constants.starsColor,
            ),
          ),

        //Empty stars
        for (int i = stars; i < 5; i++)
          Padding(
            padding: i == 0
                ? const EdgeInsets.only(right: 1)
                : const EdgeInsets.symmetric(horizontal: 1),
            child: Icon(
              Icons.star,
              size: 19,
              color: Colors.grey[300],
            ),
          ),
      ],
    );
  }
}