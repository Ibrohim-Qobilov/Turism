import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/cubit/business/hotel_cubit/hotel_cubit.dart';

class ImageSetter extends StatelessWidget {
  const ImageSetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HotelCubit(),
      child: BlocBuilder<HotelCubit, HotelState>(
        builder: (ctx, state) {
          HotelCubit cubit = ctx.watch();
          return _buildContainer(cubit);
        },
      ),
    );
  }

  Container _buildContainer(HotelCubit cubit) {
    return Container(
      height: 302.0.h,
      width: 315.0.w,
      padding: MyEdgeInsets.all(12.0),
      decoration: MyDecoration.circular(
        color: Colors.transparent,
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        children: [
          _dottedBorder(
            height: 216.0,
            width: 291.0,
            child: ImageChooser.imageList.length > 4
                ? _showImage(ImageChooser.imageList[4])
                : SvgPicture.asset(
                    AppIcons.add,
                    color: AppColors.grey,
                    height: 61.0.h,
                    fit: BoxFit.contain,
                  ).onTap(ImageChooser.chooseImage),
          ),
          SizedBox(height: 12.0.h),
          _showImages(),
        ],
      ),
    );
  }

  Row _showImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dottedBorder(
          child: _showImage(ImageChooser.imageList.isNotEmpty
              ? ImageChooser.imageList[0]
              : null),
        ),
        _dottedBorder(
          child: _showImage(ImageChooser.imageList.length > 1
              ? ImageChooser.imageList[1]
              : null),
        ),
        _dottedBorder(
          child: _showImage(ImageChooser.imageList.length > 2
              ? ImageChooser.imageList[2]
              : null),
        ),
        _dottedBorder(
          child: _showImage(ImageChooser.imageList.length > 3
              ? ImageChooser.imageList[3]
              : null),
        ),
      ],
    );
  }

  DottedBorder _dottedBorder({
    double height = 40.0,
    double width = 65.0,
    Widget? child,
  }) =>
      DottedBorder(
        borderType: BorderType.Rect,
        dashPattern: [7.5.w, 0.0, 7.5.w, 5.0.w],
        color: AppColors.grey,
        radius: Radius.circular(4.0.w),
        child: SizedBox(
          height: height.h,
          width: width.w,
          child: child,
        ),
      );

  _showImage(String? image) {
    if (image != null) {
      return Image.file(File(image), fit: BoxFit.cover);
    }
    return null;
  }
}
