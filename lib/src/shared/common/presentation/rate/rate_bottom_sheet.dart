// import '../../domain/use_cases/send_rate_use_case.dart';
// import 'rate_bottom_sheet_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RateBottomSheet extends StatefulWidget {
//   final ProviderDetailsEntity? provider;
//   const RateBottomSheet({
//     super.key,
//     this.provider,
//   });
//   static Future<void> show(BuildContext context,
//           {ProviderDetailsEntity? provider}) async =>
//       await showAppDialog(
//         context: context,
//         child: BlocProvider(
//           create: (context) => RateBottomSheetCubit(),
//           child: RateBottomSheet(
//             provider: provider,
//           ),
//         ),
//       );

//   @override
//   State<RateBottomSheet> createState() => _RateBottomSheetState();
// }

// class _RateBottomSheetState extends State<RateBottomSheet> {
//   final _formkey = GlobalKey<FormState>();
//   final _controller = TextEditingController();
//   int _rating = 0;
//   bool _showError = false;
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formkey,
//       child: BlocBuilder<RateBottomSheetCubit, Async>(
//         builder: (context, state) {
//           if (state.isLoading) {
//             return const Padding(
//               padding: EdgeInsets.only(
//                 top: 20,
//               ),
//               child: SpinKitLoadingWidget(),
//             );
//           } else if (state.isSuccess) {
//             return Column(
//               children: [
//                 Align(
//                   alignment: AlignmentDirectional.topEnd,
//                   child: IconButton(
//                     onPressed: () => AppRouter.pop(),
//                     icon: const Icon(Icons.close),
//                   ),
//                 ),
//                 AppSvgIcon(
//                   path: AppIcons.successIc,
//                 ),
//                 const SizedBox(
//                   height: 32,
//                 ),
//                 Text(
//                   appLocalizer.yourMessageSendSuccessMessage,
//                   style: TextStyles.medium16,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//               ],
//             );
//           } else if (state.isFailure) {
//             return Padding(
//               padding: const EdgeInsets.only(
//                 top: 20,
//               ),
//               child: AppFailWidget(
//                 onRetry: () {
//                   onSave();
//                 },
//               ),
//             );
//           }
//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.provider != null
//                         ? appLocalizer.rate
//                         : appLocalizer.rateApp,
//                     style: TextStyles.semiBold16,
//                   ),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               AppRatingBar(
//                 initialRating: _rating.toDouble(),
//                 filledIconColor: AppColors.warning500,
//                 onRatingUpdate: (e) {
//                   setState(() {
//                     _showError = false;
//                     _rating = e.toInt();
//                   });
//                 },
//               ),
//               if (_showError)
//                 Text(
//                   appLocalizer.fieldRequired,
//                   style: TextStyles.regular11.copyWith(
//                     color: AppColors.error,
//                   ),
//                 ),
//               const SizedBox(
//                 height: 16,
//               ),
//               AppTextFormField(
//                 controller: _controller,
//                 label: appLocalizer.addComment,
//                 hintText: appLocalizer.writeYourComment,
//                 maxLines: 4,
//                 minLines: 4,
//                 maxLength: 200,
//                 validate: (text) =>
//                     text?.isEmpty == true ? appLocalizer.fieldRequired : null,
//                 showCounter: true,
//               ),
//               AppButton(
//                 text: appLocalizer.send,
//                 onPressed: onSave,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   void onSave() {
//     if (_rating == 0) {
//       setState(() {
//         _showError = true;
//       });
//     }
//     if (_formkey.currentState?.validate() == true) {
//       if (_rating == 0) {
//         return;
//       }

//       context.read<RateBottomSheetCubit>().sendRate(
//             RateParams(
//               type: widget.provider != null
//                   ? RateParamsEnum.user
//                   : RateParamsEnum.app,
//               id: widget.provider?.id,
//               rate: _rating,
//               review: _controller.text,
//             ),
//           );
//     }
//   }
// }
