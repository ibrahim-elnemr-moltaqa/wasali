import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/src/layouts/client/home/domain/entities/banner_entity.dart';

class ClientHomeBannerWidget extends StatefulWidget {
  final List<BannerEntity> banners;
  const ClientHomeBannerWidget({super.key, required this.banners});

  @override
  State<ClientHomeBannerWidget> createState() => _ClientHomeBannerWidgetState();
}

class _ClientHomeBannerWidgetState extends State<ClientHomeBannerWidget> {
  int yourActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        FractionallySizedBox(
          widthFactor: 1.1,
          child: CarouselSlider.builder(
              itemCount: widget.banners.length,
              itemBuilder: (context, index, realIndex) {
                return AppImage(
                  path: widget.banners[index].imageUrl,
                  width: double.infinity,
                  radius: 14,
                ).zoomIn();
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
            count: widget.banners.length,
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
