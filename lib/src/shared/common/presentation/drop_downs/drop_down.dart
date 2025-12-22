import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/theme/app_theme.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/inputs/validator_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';

import 'drop_down_cubit.dart';

part 'widgets/search_field.dart';

class AppSingleDropDown<T> extends StatelessWidget {
  const AppSingleDropDown({
    super.key,
    required this.value,
    this.onChanged,
    required this.itemDisplay,
    this.hint = "",
    this.title,
    this.items = const [],
    this.prefixIc,
    this.cubit,
    this.maxAllowedSelectCount = 1,
    this.validator,
    this.isEnabled = true,
    this.suffixIconPath,
    this.borderRadius,
  });
  final String? suffixIconPath;
  final double? borderRadius;
  final T? value;
  final void Function(T? value)? onChanged;
  final String? Function(T? displayValue) itemDisplay;
  final String hint;
  final String? title;
  final List<T> items;
  final String? prefixIc;
  final DropDownCubit<T>? cubit;
  final int maxAllowedSelectCount;
  final String? Function(T?)? validator;
  final bool isEnabled;

  @override
  Widget build(BuildContext _) {
    final heroTag = UniqueKey();
    return BlocProvider(
      create: (context) => cubit ?? (DefaultDropDownCubit<T>()..setData(items)),
      child: ValidatorField(
        value: value,
        onSaved: onChanged,
        validator: validator ??
            (value) {
              if (value == null || value == '') {
                return appLocalizer.fieldRequired;
              }
              return null;
            },
        build: (context, hasError, errorMessage, value, onChange, onSave,
            validate) {
          return DefaultInputFieldDesign(
            borderRadius: borderRadius,
            heroTag: heroTag,
            prefixIconPath: prefixIc,
            suffixIconPath: suffixIconPath ?? AppIcons.arrowDownIc,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());
              if (isEnabled == false) {
                validate();
                return;
              }
              Navigator.of(context).push(
                _AppDropDownRoute<T>(
                  child: BlocProvider.value(
                    value: context.read<DropDownCubit<T>>(),
                    child: _AppDropDownOverlay<T>(
                      maxAllowedSelectCount: maxAllowedSelectCount,
                      prefixIc: prefixIc,
                      items: items,
                      hero: heroTag,
                      itemDisplay: itemDisplay,
                      onPressed: (context, result, controller) {
                        if (result != null && result != value) {
                          onChange(result);
                          controller.reverse().then(
                            (_) {
                              Navigator.of(context).pop();
                            },
                          );
                          onSave();
                          validate();
                        }
                      },
                      selectedValue: value == null ? <T>[] : [value],
                    ),
                  ),
                ),
              );
            },
            title: title,
            hasError: hasError,
            hint: hint,
            value: value == null ? null : itemDisplay(value),
            errorMessage: errorMessage ?? '',
          );
        },
      ),
    );
  }
}

class AppMultiDropDown<T> extends StatelessWidget {
  const AppMultiDropDown({
    super.key,
    required this.value,
    this.onChanged,
    required this.itemDisplay,
    this.hint = "",
    required this.title,
    this.items = const [],
    this.prefixIc,
    this.cubit,
    this.borderRadius,
  });

  final List<T> value;
  final void Function(List<T> value)? onChanged;
  final String? Function(T? displayValue) itemDisplay;
  final String hint;
  final String title;
  final List<T> items;
  final String? prefixIc;
  final DropDownCubit<T>? cubit;
  final double? borderRadius;

  @override
  Widget build(BuildContext _) {
    final heroTag = UniqueKey();

    return BlocProvider(
      create: (context) => cubit ?? (DefaultDropDownCubit<T>()..setData(items)),
      child: ValidatorField(
        value: value,
        onSaved: (newValue) => onChanged?.call(newValue ?? []),
        validator: (value) {
          if ((value?.isEmpty ?? false)) return appLocalizer.fieldRequired;
          return null;
        },
        build: (context, hasError, errorMessage, value, onChange, onSave,
            validate) {
          final List<T> data = List<T>.from(value ?? []);
          final String dataString = data.map((e) => itemDisplay(e)).join(' , ');

          return DefaultInputFieldDesign(
            borderRadius: borderRadius,
            heroTag: heroTag,
            prefixIconPath: prefixIc,
            suffixIconPath: AppIcons.arrowDownIc,
            onTap: () async {
              FocusScope.of(context).requestFocus(FocusNode());

              Navigator.of(context).push(
                _AppDropDownRoute<T>(
                  child: BlocProvider.value(
                    value: context.read<DropDownCubit<T>>(),
                    child: _AppDropDownOverlay<T>(
                      maxAllowedSelectCount: 15,
                      hero: heroTag,
                      prefixIc: prefixIc,
                      items: items,
                      itemDisplay: itemDisplay,
                      isMultiSelect: true,
                      onPressed: (context, result, controller) {
                        if (result != null && result != value) {
                          final bool isSelected = data.contains(result);
                          if (isSelected) {
                            data.remove(result);
                          } else {
                            data.add(result);
                          }
                          onChange(data);
                          onSave();
                        }
                      },
                      selectedValue: data,
                    ),
                  ),
                ),
              );
            },
            title: title,
            hasError: hasError,
            hint: hint,
            value: data.isEmpty ? null : dataString,
            errorMessage: errorMessage ?? '',
          );
        },
      ),
    );
  }
}

class _AppDropDownOverlay<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selectedValue;
  final String? Function(T? displayValue) itemDisplay;
  final String? prefixIc;
  final int maxAllowedSelectCount;
  final bool isMultiSelect;
  final void Function(
    BuildContext context,
    T? value,
    AnimationController controller,
  ) onPressed;
  final Object hero;
  const _AppDropDownOverlay({
    required this.items,
    required this.selectedValue,
    required this.itemDisplay,
    required this.onPressed,
    this.prefixIc,
    this.maxAllowedSelectCount = 1,
    this.isMultiSelect = false,
    required this.hero,
  });

  @override
  State<_AppDropDownOverlay<T>> createState() => _AppDropDownOverlayState<T>();
}

class _AppDropDownOverlayState<T> extends State<_AppDropDownOverlay<T>>
    with TickerProviderStateMixin {
  late final AnimationController _contentController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _contentController,
      curve: Curves.easeOutBack,
    );

    // Start after hero animation finishes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 150), () {
        _contentController.forward();
      });
    });
    context.read<DropDownCubit<T>>().fetch();
    selectedValues.addAll(widget.selectedValue);
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  final List<T> selectedValues = <T>[];
  String? searchText;

  bool get _canSelectMore =>
      selectedValues.length < widget.maxAllowedSelectCount;

  bool get popOnSelect => widget.maxAllowedSelectCount == 1;

  bool get isDataLoadSuccess =>
      context.read<DropDownCubit<T>>().state.isSuccess;
  List<T> get items => (context.read<DropDownCubit<T>>().state.data) ?? <T>[];

  List<T> get getSortedItems {
    return items;
    // final data = List<T>.from(items);
    // data.sort((a, b) {
    //   final bool aSelected = selectedValues.contains(a);
    //   final bool bSelected = selectedValues.contains(b);

    //   if (aSelected && !bSelected) return -1;
    //   if (!aSelected && bSelected) return 1;
    //   return 0;
    // });
    // return data;
  }

  List<T> get getFilteredItems {
    if (searchText?.isEmpty == true || searchText == null) {
      return getSortedItems;
    } else if (searchText?.isNotEmpty == true && searchText != null) {
      return getSortedItems
          .where((element) => (widget.itemDisplay(element) ?? '')
              .toLowerCase()
              .contains(searchText!.toLowerCase()))
          .toList();
    }
    return items;
  }

  void onSelected(T selectedValue) async {
    final bool isSelected = selectedValues.contains(selectedValue);
    if (isSelected) {
      selectedValues.remove(selectedValue);
    } else {
      if (!_canSelectMore && popOnSelect) {
        widget.onPressed(context, selectedValue, _contentController);
        return;
      }

      selectedValues.add(selectedValue);
    }

    widget.onPressed(context, selectedValue, _contentController);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DropDownCubit<T>, Async<List<T>>>(
      listener: (context, state) {
        if (state.isSuccess) {
          setState(() {});
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                _contentController.reverse().then(
                      (value) => Navigator.of(context).pop(),
                    );
              },
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 24,
                      ),
                      child: Hero(
                        tag: widget.hero,
                        child: Material(
                          color: Colors.transparent,
                          clipBehavior: Clip.antiAlias,
                          child: IgnorePointer(
                            ignoring: !isDataLoadSuccess,
                            child: _SearchField(
                              prefixIcon: widget.prefixIc,
                              onSearch: (searchKey) {
                                setState(() {
                                  searchText = searchKey;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(
                          bottom: 24,
                          right: 20,
                          left: 20,
                        ),
                        clipBehavior: Clip.antiAlias,
                        constraints: BoxConstraints(
                          minHeight: 200,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [AppColors.boxShadow],
                        ),
                        child: SingleChildScrollView(
                          clipBehavior: Clip.antiAlias,
                          child: BlocBuilder<DropDownCubit<T>, Async<List<T>>>(
                            builder: (context, state) {
                              final data = state.data ?? [];

                              if (state.isLoading) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: SpinKitLoadingWidget(
                                    size: 20,
                                    color: AppColors.primary,
                                  ),
                                );
                              } else if (state.isFailure) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: AppFailWidget(
                                    onRetry: () {
                                      context.read<DropDownCubit<T>>().fetch();
                                    },
                                  ),
                                );
                              } else if (state.isSuccess && data.isEmpty) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 60),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          appLocalizer.noResultFound,
                                          style: TextStyles.semiBold12
                                              .copyWith(color: AppColors.text),
                                        ),
                                        const Gap(4),
                                        AppSvgIcon(
                                          path: AppIcons.refresh,
                                          size: 16,
                                          color: AppColors.text,
                                        )
                                      ],
                                    ).onTapScaleAnimation(onTap: () {
                                      context.read<DropDownCubit<T>>().fetch();
                                    }),
                                  ),
                                );
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: getFilteredItems
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  final index = entry.key;
                                  final option = entry.value;
                                  final bool isSelected =
                                      selectedValues.contains(option);
                                  final bool isLastItem =
                                      index == getFilteredItems.length - 1;

                                  return Column(
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          onSelected(option);
                                        },
                                        child: AnimatedContainer(
                                          clipBehavior: Clip.antiAlias,
                                          width: double.infinity,
                                          duration: Durations.medium1,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? getThemeColor(
                                                    darkColor: AppColors.blue50
                                                        .withAlpha(20),
                                                    lightColor:
                                                        AppColors.blue50,
                                                  )
                                                : null,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: _HighlightText(
                                                  text: widget.itemDisplay(
                                                          option) ??
                                                      '',
                                                  searchText: searchText ?? '',
                                                ),
                                              ),
                                              //! Radio or Checkbox
                                              if (widget.isMultiSelect)
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  margin: const EdgeInsets.only(
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? AppColors.primary
                                                          : AppColors.text
                                                              .withValues(
                                                                  alpha: .3),
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    color: isSelected
                                                        ? AppColors.primary
                                                        : Colors.transparent,
                                                  ),
                                                  child: isSelected
                                                      ? const Icon(
                                                          Icons.check,
                                                          size: 14,
                                                          color: Colors.white,
                                                        )
                                                      : null,
                                                )
                                              else
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  margin: const EdgeInsets.only(
                                                      right: 12),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: isSelected
                                                          ? AppColors.primary
                                                          : AppColors.text
                                                              .withValues(
                                                                  alpha: .3),
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: isSelected
                                                      ? Center(
                                                          child: Container(
                                                            width: 10,
                                                            height: 10,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .primary,
                                                            ),
                                                          ),
                                                        )
                                                      : null,
                                                ),
                                              // Text
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Divider for multi-select
                                      if (widget.isMultiSelect && !isLastItem)
                                        Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: AppColors.text
                                              .withValues(alpha: .1),
                                          indent: 16,
                                          endIndent: 16,
                                        ),
                                    ],
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppDropDownRoute<T> extends PageRoute<T> {
  final Widget child;

  _AppDropDownRoute({required this.child});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 400);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black26;

  @override
  String get barrierLabel => 'Dismiss';

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  bool get maintainState => true;
}

class _HighlightText extends StatelessWidget {
  final String text;
  final String searchText;

  const _HighlightText({
    required this.text,
    required this.searchText,
  });

  TextStyle get _highlightStyle =>
      TextStyles.bold14.copyWith(color: AppColors.text);
  TextStyle get _normalStyle =>
      TextStyles.regular14.copyWith(color: AppColors.text);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: highlightSearchText(text, searchText),
      ),
    );
  }

  List<TextSpan> highlightSearchText(String text, String searchText) {
    if (searchText.isEmpty) {
      return [TextSpan(text: text, style: _normalStyle)];
    }

    final List<TextSpan> spans = [];
    final String lowerText = text.toLowerCase();
    final String lowerSearchText = searchText.toLowerCase();

    int start = 0;
    int index = lowerText.indexOf(lowerSearchText);

    while (index != -1) {
      // Add normal text before the match
      if (index > start) {
        spans.add(TextSpan(
          text: text.substring(start, index),
          style: _normalStyle,
        ));
      }

      // Add the highlighted search text
      spans.add(TextSpan(
        text: text.substring(index, index + searchText.length),
        style: _highlightStyle,
      ));

      // Move past the matched text
      start = index + searchText.length;
      index = lowerText.indexOf(lowerSearchText, start);
    }

    // Add any remaining text after the last match
    if (start < text.length) {
      spans.add(TextSpan(
        text: text.substring(start),
        style: _normalStyle,
      ));
    }

    return spans;
  }
}
