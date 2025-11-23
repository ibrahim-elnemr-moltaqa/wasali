import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/auth_states/unauthenticated_bottom_sheet.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';
import 'package:wasli/src/shared/common/presentation/main_page/domain/main_page_tap_entity.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  MainPageTabEntity? _currentPage;

  late List<MainPageTabEntity> allPages;
  void _addUnAuthenticatedListener() {
    UnAuthenticatedInterceptor.instance.addListener(
      () {
        UnAuthenticatedBottomSheet.show();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    allPages = MainPageTabEntity.getTaps(type: RoleEnum.client);
    startAnimation();
    _addUnAuthenticatedListener();
  }

  void startAnimation() {
    _currentPage = allPages[0];

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _radiusAnimation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    ));

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    allPages = MainPageTabEntity.getTaps(type: RoleEnum.client);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: _currentPage!.index,
        children: List.generate(allPages.length, (index) {
          final isVisible = index == _currentPage!.index;
          return TickerMode(
            // key: UniqueKey(),
            enabled: isVisible,
            child: AnimatedBuilder(
              animation: _radiusAnimation,
              builder: (context, child) => ClipPath(
                clipper: CircleRevealClipper(
                  radius: _radiusAnimation.value *
                      (screenSize.height + screenSize.width),
                ),
                child: child,
              ),
              child: allPages[index].child,
            ),
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _CustomNavBar(
        allPage: allPages,
        onTapClicked: _onTabTapped,
        currentPage: _currentPage!,
      ),
    );
  }

  void _onTabTapped(BuildContext ctx, int index) async {
    if (_currentPage!.index != index) {
      await _controller.reverse();
      if (ctx.mounted) {
        setState(() {
          _currentPage = allPages[index];
        });
      }
      _controller.forward();
    }
  }
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double radius;
  CircleRevealClipper({required this.radius});
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CircleRevealClipper oldClipper) =>
      oldClipper.radius != radius;
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar({
    required this.allPage,
    required this.onTapClicked,
    required this.currentPage,
  }) : super();
  final List<MainPageTabEntity> allPage;
  final Function(BuildContext ctx, int index) onTapClicked;
  final MainPageTabEntity currentPage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(24)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              allPage.length,
              (index) => InkWell(
                    onTap: () => onTapClicked(context, index),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppSvgIcon(
                            path: currentPage.index == index
                                ? allPage[index].activeIcon
                                : allPage[index].icon,
                          ).animate().scale(),
                          const SizedBox(
                            height: 6,
                          ),
                          FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(allPage[index].name,
                                  style: TextStyles.regular12
                                      .copyWith(color: Colors.white))),
                        ],
                      ),
                    ),
                  )).toList()),
    );
  }
}
