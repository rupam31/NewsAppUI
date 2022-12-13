import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/app_styles.dart';
import 'package:news_app/size_config.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kLighterWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 50,
              child: Stack(
                //Useful to overlay a widget over other widget
                children: [
                  const FullScreenSlider(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 33.5,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        color: kLighterWhite,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kPaddingHorizontal,
                        vertical: 60,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              border: Border.all(
                                color: kWhite,
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              'assets/arrow_back_icon.svg',
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              border: Border.all(
                                color: kWhite,
                              ),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              'assets/bookmark_white_icon.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Text(
                'Unravel mysteries\nof the Maldives',
                style: kPoppinsBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 7,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
                vertical: 20,
              ),
              height: 54,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadius),
                border: Border.all(
                  color: kBorderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 13,
                    backgroundColor: kBlue,
                    backgroundImage: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/4140/4140048.png',
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.blockSizeHorizontal! * 2.5,
                  ),
                  Text(
                    'Keanu Carpenter  •  Dec 12  •  8 mins read',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kPaddingHorizontal,
              ),
              child: Text(
                'Maldives is an archipelagic state located in South Asia, situated in the Indian Ocean. It lies southwest of Sri Lanka and India, about 750 kilometres (470 miles; 400 nautical miles) from the Asian continent\'s mainland. The chain of 26 atolls stretches across the Equator from Ihavandhippolhu Atoll in the north to Addu Atoll in the south.\n\nComprising a territory spanning roughly 90,000 square kilometres (35,000 sq mi) including the sea, land area of all the islands comprises 298 square kilometres (115 sq mi), Maldives is one of the world\'s most geographically dispersed sovereign states and the smallest Asian country as well as one of the smallest Muslim-majority countries by land area and, with around 557,751 inhabitants, the 2nd least populous country in Asia. Malé is the capital and the most populated city, traditionally called the "King\'s Island" where the ancient royal dynasties ruled for its central location.',
                style: kPoppinsMedium.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBlue,
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 5,
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> imageList = [
  //Global Variable
  'https://images.unsplash.com/photo-1512100356356-de1b84283e18?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=475&q=80',
  'https://images.unsplash.com/photo-1573843981267-be1999ff37cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
  'https://images.unsplash.com/photo-1590523277543-a94d2e4eb00b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
];

class FullScreenSlider extends StatefulWidget {
  const FullScreenSlider({super.key});

  @override
  State<FullScreenSlider> createState() => _FullScreenSliderState();
}

class _FullScreenSliderState extends State<FullScreenSlider> {
  int _current = 1;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              height: SizeConfig.blockSizeVertical! *
                  50, // **** 50 = Half of the screen height
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              initialPage: _current),
          items: imageList
              .map(
                (item) => Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.cover,
                    height: SizeConfig.blockSizeVertical! * 50,
                    width: double.infinity,
                  ),
                ),
              )
              .toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 52,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList
                  .asMap()
                  .entries
                  .map((entry) => GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          child: SvgPicture.asset(_current == entry.key
                              ? 'assets/carousel_indicator_enabled.svg'
                              : 'assets/carousel_indicator_disabled.svg'),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
