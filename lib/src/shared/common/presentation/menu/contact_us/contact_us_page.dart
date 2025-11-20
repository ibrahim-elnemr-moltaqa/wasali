import 'package:wasli/core/config/values/assets.gen.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/share_and_url_launch/popular_sites/popular_sites_utils.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/email_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/overlay/show_dialog.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/shared/auth/domain/entities/user_entity.dart';
import '../../../domain/entity/menu/contact_us_entity.dart';
import '../../../domain/use_cases/menu/send_contact_us_message_use_case.dart';
import '../../drop_downs/drop_down.dart';
import 'contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget child = BlocBuilder<ContactUsCubit, ContactUsState>(
      builder: (context, state) {
        final data = state.dataState.data;
        if (state.dataState.isLoading) {
          return const SpinKitLoadingWidget();
        } else if (state.dataState.isFailure) {
          return AppFailWidget(
            onRetry: () {
              ContactUsCubit.of(context).getData();
            },
          );
        } else if (state.dataState.isSuccess && data != null) {
          return _ContactUsBody(data: data);
        }
        return const SizedBox();
      },
    );
    return BlocProvider(
      create: (context) => ContactUsCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () => AppRouter.pop(),
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primary,
              )),
          title: Text(
            appLocalizer.contactUs,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _ContactUsBody extends StatefulWidget {
  const _ContactUsBody({required this.data});

  final ContactUsEntity data;

  @override
  State<_ContactUsBody> createState() => __ContactUsBodyState();
}

class __ContactUsBodyState extends State<_ContactUsBody> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  PhoneEntity? _phoneEntity;
  final _messageContentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ContactUsMessageType? messageType;

  void _onSendMessage() {
    final isValidForm = _formKey.currentState?.validate() ?? false;
    if (isValidForm && messageType != null) {
      ContactUsCubit.of(context).sendMessage(SendContactUsMessageParams(
        email: _emailController.text,
        name: _nameController.text,
        phone: _phoneEntity!,
        type: messageType!,
        message: _messageContentController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsCubit, ContactUsState>(
      listener: (context, state) async {
        if (state.sendMessageState.isSuccess) {
          AppLoadingWidget.removeOverlay();
          await _SuccessDialog.show(context);
          if (context.mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        } else if (state.sendMessageState.isLoading) {
          AppLoadingWidget.overlay();
        } else if (state.sendMessageState.isFailure) {
          AppLoadingWidget.removeOverlay();
          AppToasts.error(context,
              message: state.sendMessageState.errorMessage ?? '');
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CardWidget(
              title: appLocalizer.sendMessage,
              iconPath: AppIcons.message,
              children: [
                NameField(
                  label: appLocalizer.name,
                  controller: _nameController,
                ),
                const SizedBox(
                  height: 12,
                ),
                EmailField(
                  controller: _emailController,
                ),
                const SizedBox(height: 12),
                IntelPhoneField(
                  label: appLocalizer.phoneNumber,
                  controller: _phoneController,
                  onChange: (phoneNumber) =>
                      _phoneEntity = phoneNumber.getPhoneEntity,
                ),
                const SizedBox(height: 12),
                AppSingleDropDown(
                  borderRadius: 12,
                  value: messageType,
                  itemDisplay: (displayValue) => displayValue?.title,
                  title: appLocalizer.messageType,
                  hint: appLocalizer.selectMessageType,
                  items: ContactUsMessageType.values,
                  suffixIconPath: AppIcons.arrowDown2Ic,
                  onChanged: (value) {
                    setState(() {
                      messageType = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                AppTextFormField(
                  controller: _messageContentController,
                  minLines: 5,
                  maxLines: 7,
                  label: appLocalizer.message,
                  hintText: appLocalizer.writeHere,
                  validate: (text) {
                    return Validator(text).defaultValidator;
                  },
                  // prefixIcon: const Align(
                  //     heightFactor: 5,
                  //     alignment: Alignment.topCenter,
                  //     child: AppSvgIcon(path: AppIcons.message)),
                ),
                const SizedBox(
                  height: 32,
                ),
                BlocSelector<ContactUsCubit, ContactUsState, Async<void>>(
                  selector: (state) => state.sendMessageState,
                  builder: (context, state) {
                    return AppButton(
                      text: appLocalizer.send,
                      isLoading: state.isLoading,
                      onPressed: _onSendMessage,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            _CardWidget(
              title: appLocalizer.contactInformation,
              iconPath: AppIcons.privacyIc,
              children: [
                _TileWidget(
                  icon: AppIcons.call,
                  hasSeperator: true,
                  children: widget.data.mobiles.map(
                    (e) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => LaunchUrlUtils.openPhoneNumber(e),
                        child: Text(
                          e,
                          style: TextStyles.light16
                              .copyWith(color: AppColors.primary600),
                        ),
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 16),
                _TileWidget(
                  icon: const $AssetsPopularSitesIconsGen().whatsapp,
                  hasSeperator: true,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () =>
                          LaunchUrlUtils.openInWhatsApp(widget.data.whatsapp),
                      child: Text(
                        widget.data.whatsapp,
                        style: TextStyles.light16
                            .copyWith(color: AppColors.primary600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _TileWidget(
                  icon: AppIcons.sms,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () =>
                          LaunchUrlUtils.openEmailAddress(widget.data.email),
                      child: Text(
                        widget.data.email,
                        style: TextStyles.light16
                            .copyWith(color: AppColors.primary600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 23,
                  runSpacing: 23,
                  children: widget.data.getSocialLinks.map(
                    (url) {
                      return PopularSitesLinksUtils(url).builder(
                        context,
                        (url, launchFun, siteWidget) {
                          return InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: launchFun,
                            child: Container(
                              height: 32,
                              width: 32,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xffF7F8FA),
                                border: Border.all(
                                  color: AppColors.borderColor,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: FittedBox(
                                child: siteWidget,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
                const SizedBox(height: 4),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class _CardWidget extends StatelessWidget {
  const _CardWidget(
      {required this.children, required this.title, required this.iconPath});
  final List<Widget> children;
  final String title;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            AppSvgIcon(path: iconPath),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyles.light12
                  .copyWith(color: AppColors.secondary900, height: 0),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: AppColors.secondary50,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppColors.grey2Color,
              )),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TileWidget extends StatelessWidget {
  const _TileWidget({
    this.icon,
    required this.children,
    this.hasSeperator = false,
    this.centerchildren = false,
  });
  final String? icon;
  final List<Widget> children;
  final bool hasSeperator;
  final bool centerchildren;

  @override
  Widget build(BuildContext context) {
    // Create a new list where each item is followed by a separator
    final List<Widget> items = [];
    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (i != children.length - 1 && hasSeperator) {
        items.add(const Text(
          '-',
          style: TextStyles.medium14,
        ));
      }
    }
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(
                  start: icon != null ? 21 : 0,
                ),
                margin: const EdgeInsetsDirectional.only(
                  start: 19,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: centerchildren
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Wrap(runSpacing: 2, spacing: 2, children: items),
                  ],
                ),
              ),
              if (icon != null)
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.borderColor),
                    shape: BoxShape.circle,
                    color: const Color(0xffF7F8FA),
                  ),
                  child: Center(
                    child: AppSvgIcon(
                      path: icon!,
                      size: 16,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SuccessDialog extends StatelessWidget {
  const _SuccessDialog();
  static Future show(context) => showAppDialog(
        context: context,
        child: const _SuccessDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: IconButton(
            onPressed: () => AppRouter.pop(),
            icon: const Icon(Icons.close),
          ),
        ),
        AppSvgIcon(
          path: AppIcons.successIc,
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          appLocalizer.yourMessageSendSuccessMessage,
          style: TextStyles.medium16,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
