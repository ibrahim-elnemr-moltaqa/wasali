import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/data/model/product_body.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/products/products_cubit.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sizes/sizes_drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sub_categories/sub_categories_drop_down_cubit.dart';

class AddNewProductPage extends StatefulWidget {
  const AddNewProductPage({super.key});

  @override
  State<AddNewProductPage> createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  CategoryEntity? selectedSection;
  List<int> selectedSizeIds = [];
  File? imageFile;
  File? additionalImageFile;

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: BlocListener<ProductsCubit, ProductsState>(
        listenWhen: (previous, current) =>
            previous.createProductState != current.createProductState,
        listener: (context, state) {
          if (state.createProductState.isLoading) {
            AppLoadingWidget.overlay();
          } else if (state.createProductState.isSuccess) {
            AppLoadingWidget.removeOverlay();
            AppToasts.success(context, message: 'Product created successfully');
            AppRouter.pop(data: state.createProductState.data);
          } else if (state.createProductState.isFailure) {
            AppLoadingWidget.removeOverlay();
            AppToasts.error(context,
                message: state.createProductState.errorMessage ?? 'Error');
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appLocalizer.add_new_product),
            centerTitle: false,
            leading: const BackButton()
                .setBorder(
                  radius: 12,
                )
                .paddingAll(8),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(24),
                NameField(
                  controller: nameController,
                  label: appLocalizer.product_name,
                  hint: appLocalizer.enter_product_name,
                ),
                AppTextFormField(
                  controller: descriptionController,
                  label: appLocalizer.product_description,
                  hintText: appLocalizer.product_description,
                  showCounter: true,
                  maxLength: 50,
                ),
                AppSingleDropDown<CategoryEntity>(
                  value: selectedSection,
                  itemDisplay: (itemDisplay) => itemDisplay?.name,
                  onChanged: (value) {
                    setState(() {
                      selectedSection = value;
                    });
                  },
                  hint: appLocalizer.select_section,
                  borderRadius: 12,
                  title: appLocalizer.section,
                  cubit: SubCategoriesDropDownCubit(),
                ),
                SizesDropDown(
                  onChanged: (values) {
                    setState(() {
                      selectedSizeIds = values?.map((e) => e.id).toList() ?? [];
                    });
                  },
                ),
                AppTextFormField(
                  controller: priceController,
                  label: appLocalizer.product_price,
                  hintText: appLocalizer.enter_product_price,
                  inputType: TextInputType.number,
                ),
                const Gap(8),
                DottedUploadImageWidget(
                  title: appLocalizer.product_image,
                  onChanged: (file) {
                    imageFile = file;
                  },
                ).setTitle(
                  title: appLocalizer.product_image,
                ),
                const Gap(8),
                DottedUploadImageWidget(
                  title: appLocalizer.additional_image,
                  onChanged: (file) {
                    additionalImageFile = file;
                  },
                ).setTitle(
                  title: appLocalizer.additional_image,
                ),
                const Gap(24),
                Builder(builder: (context) {
                  return AppButton(
                    text: appLocalizer.save,
                    onPressed: () {
                      if (nameController.text.isEmpty ||
                          descriptionController.text.isEmpty ||
                          selectedSection == null ||
                          priceController.text.isEmpty) {
                        AppToasts.error(context,
                            message: 'Please fill all required fields');
                        return;
                      }
                      context.read<ProductsCubit>().createProduct(
                            ProductBody(
                              name: nameController.text,
                              description: descriptionController.text,
                              subCategoryId: selectedSection!.id,
                              price: double.parse(priceController.text),
                              image: imageFile,
                              additionalImage: additionalImageFile,
                              sizeIds: selectedSizeIds,
                            ),
                          );
                    },
                  );
                }),
                const Gap(24),
              ],
            ).paddingHorizontal(20).withSafeArea(),
          ),
        ),
      ),
    );
  }
}
