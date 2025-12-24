import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/data/enum/role_enum.dart';

class RoleCardWidget extends StatelessWidget {
  const RoleCardWidget({
    super.key,
    required this.role,
    this.imageInStart = false,
    required this.isSelected,
    this.onTap,
  });
  final RoleEnum role;
  final bool imageInStart;
  final bool isSelected;
  final dynamic Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary100
                    : AppColors.backgroundColor,
                border: Border.all(
                    color:
                        isSelected ? AppColors.primary : AppColors.borderColor),
                borderRadius: BorderRadius.circular(14)),
            child: Text(
              role.title,
              style: TextStyles.regular16,
              textAlign: imageInStart ? TextAlign.end : TextAlign.start,
            ),
          ),
          PositionedDirectional(
            bottom: 0,
            end: imageInStart ? null : 20,
            start: imageInStart ? 20 : null,
            child: SvgPicture.asset(
              role.onBoardingImage,
              height: 107,
            ),
          )
        ],
      ),
    );
  }
}
