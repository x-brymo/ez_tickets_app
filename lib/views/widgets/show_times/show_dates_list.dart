import 'package:flutter/material.dart';

import '../../../helper/utils/constants.dart';

List<String> showDates = [
  "14\nSun",
  "15\nMon",
  "16\nTue",
  "17\nWed",
  "18\nThu"
];

class ShowDatesList extends StatefulWidget {
  const ShowDatesList() : super();

  @override
  _ShowDatesListState createState() => _ShowDatesListState();
}

class _ShowDatesListState extends State<ShowDatesList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: showDates.length,
      separatorBuilder: (ctx, i) => const SizedBox(width: 20),
      itemBuilder: (ctx, i) => _ShowDateItem(
        isActive: i == selectedIndex,
        onTap: () {
          setState(() {
            selectedIndex = i;
          });
        },
        date: showDates[i],
      ),
    );
  }
}

class _ShowDateItem extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;
  final String date;

  const _ShowDateItem({
    Key? key,
    required this.isActive,
    required this.onTap,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      width: 60,
      decoration: BoxDecoration(
        gradient: isActive ? Constants.buttonGradientOrange : null,
        border: isActive ? null : Border.all(color: Constants.primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Text(
            date,
            textAlign: TextAlign.center,
            style: textTheme.headline3!.copyWith(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}