import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobileapp/widgets/rating_widget.dart';

class DescriptionWidget extends StatelessWidget {
  String name;
  int price;
  double rating;
  int users;
  DescriptionWidget(
      {Key? key,
      required this.name,
      required this.price,
      required this.rating,
      required this.users})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: getWidth(178),
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: getWidth(14),
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        SizedBox(
          height: getHeight(8),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: '$price\$',
            style: TextStyle(
              color: AppColors.greyPrice,
              fontSize: getWidth(16),
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          TextSpan(
            text: '/1 kunga',
            style: TextStyle(
              color: AppColors.black,
              fontSize: getWidth(8),
              fontWeight: FontWeight.w400,
              fontFamily: 'Roboto',
            ),
          )
        ])),
        SizedBox(
          height: getHeight(10),
        ),
        RatWidget(rating: rating, users: users)
      ],
    );
  }
}