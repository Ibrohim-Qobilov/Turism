import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobileapp/core/components/exporting_packages.dart';
import 'package:mobileapp/models/git_model.dart';
import 'package:mobileapp/services/git_service.dart';
import 'package:mobileapp/services/hotel_service.dart';
import 'package:mobileapp/services/image_pick_service.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildColumn(context),
      ),
    );
  }

  Column _buildColumn(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _imageShow(context),
          TextButton(
            onPressed: () {
              print('send button bosildi');
              if (ImageChooser.imageList.isNotEmpty) {
                HotelService.createNewHotel(
                  Hotel(
                      name: 'Hotel test',
                      city: 'tashkent',
                      tell: ['+9989777777'],
                      informUz: 'inform uz',
                      informEn: 'inform en',
                      informRu: 'inform ru',
                      karta: 'http://google.maps/tashkent',
                      site: 'http://site.uz',
                      categoryId: '1991edea-7d4a-49fb-b627-79b777cf54ae',
                      media: ImageChooser.imageList),
                );
              }else {
                print(ImageChooser.imageList.toString());
              }
            },
            child: const Text('send'),
          ),
          TextButton(
                child: const Text('git register'),
              onPressed: () async {
                print('git register button bosildi');
                if (ImageChooser.imageList.isNotEmpty) {
                  await GitService.createNewGit(Git(
        city: 'tashkent',
        informEn: 'inform en',
        informUz: 'inform uz',
        informRu: 'inform ru',
        image: ImageChooser.imageList[0],
        tell: ['9999', '22222'],
        lenguages: ['kz', 'ty'],
        price: '500'),);
                }else {
                  print(ImageChooser.imageList.toString());
                }
              },
            
            ),
        ],
      );
  }

  Column _imageShow(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {
              ImageChooser.chooseImage();
            },
            icon: const Icon(Icons.add_a_photo)),
        if (ImageChooser.imageList.isNotEmpty)
          Container(
            width: MediaQuery.of(context).size.width,
            height: 500,
            color: Colors.grey.shade200,
            child: ListView.builder(
              itemCount:ImageChooser.imageList.length,
              itemBuilder: (context, index) {
                var image = ImageChooser.imageList[index];
                print(image);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Image.file(File(image),
                        fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
