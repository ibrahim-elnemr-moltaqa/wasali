import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/network_image.dart';

class ClientHomeBannerWidget extends StatefulWidget {
  const ClientHomeBannerWidget({super.key});

  @override
  State<ClientHomeBannerWidget> createState() => _ClientHomeBannerWidgetState();
}

class _ClientHomeBannerWidgetState extends State<ClientHomeBannerWidget> {
  int yourActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        FractionallySizedBox(
          widthFactor: 1.1,
          child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return const AppMedia(
                  path: AppConstants.networkImageTest,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  radius: 14,
                ).setContainerToView(color: AppColors.primary, radius: 14);
              },
              options: CarouselOptions(
                height: 160,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    yourActiveIndex = index;
                  });
                },
              )),
        ),
        Positioned(
          bottom: -10,
          child: AnimatedSmoothIndicator(
            activeIndex: yourActiveIndex,
            count: 3,
            effect: WormEffect(
              dotColor: AppColors.lightGreyColor,
              activeDotColor: AppColors.primary,
              dotHeight: 9,
              dotWidth: 9,
            ),
          ).setContainerToView(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            radius: 16,
          ),
        ),
      ],
    );
  }
}
