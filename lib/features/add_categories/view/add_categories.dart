import 'package:expense_tracker/core/constraints/app_colors.dart';
import 'package:expense_tracker/features/add_categories/bloc/add_categories_bloc.dart';
import 'package:expense_tracker/features/add_categories/bloc/add_categories_event.dart';
import 'package:expense_tracker/features/add_categories/bloc/add_categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconpicker/Models/configuration.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  Widget? _icon;
  late TextEditingController _categoryNameController;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _categoryNameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _categoryNameController.dispose();
  }

  _pickIcon() async {
    IconPickerIcon? icon = await showIconPicker(
      context,
      configuration: SinglePickerConfiguration(
        iconPackModes: [IconPack.material, IconPack.allMaterial],
        backgroundColor: AppColors.primaryColor,
        iconColor: AppColors.white,
        iconPickerShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

    if (icon == null) return;
    _icon = Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon.data, color: AppColors.white),
    );
    setState(() {});
    if (mounted) {
      context.read<AddCategoriesBloc>().add(ChangeIcon(icon: icon.data));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<AddCategoriesBloc, AddCategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: _globalKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,

                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.white,
                            ),
                          ),
                        ),

                        Center(
                          child: Text(
                            "Add Categories Page",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8.0),
                          child: DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return "Select Category Type";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.secondary,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            hint: Text(
                              'Select Category Type',
                              style: TextStyle(color: AppColors.white),
                            ),
                            dropdownColor: AppColors.secondary,
                            onChanged: (value) {
                              if (value != null) {
                                context.read<AddCategoriesBloc>().add(
                                  ChangeCategoriesType(type: value),
                                );
                              }
                            },
                            items: [
                              DropdownMenuItem(
                                value: 1,
                                child: Text(
                                  'Income',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text(
                                  'Expense',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Enter Category Name";
                              } else {
                                return null;
                              }
                            },
                            controller: _categoryNameController,
                            style: TextStyle(color: AppColors.white),
                            decoration: const InputDecoration(
                              hintText: 'Category Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: FormField(
                            validator: (value) {
                              if (_icon == null) {
                                return "Select Icon";
                              } else {
                                return null;
                              }
                            },
                            builder: (field) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: AnimatedSwitcher(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child:
                                          _icon ??
                                          ((field.hasError)
                                              ? Align(
                                                  alignment: const Alignment(
                                                    -1,
                                                    0,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 16.0,
                                                        ),
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.start,
                                                      field.errorText ??
                                                          "Select Icon",
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container()),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _pickIcon();
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 48,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: FilledButton(
                      onPressed: () {
                        context.read<AddCategoriesBloc>().add(
                          ChangeCategoriesName(
                            categoriesName: _categoryNameController.text,
                          ),
                        );
                        if (_globalKey.currentState?.validate() ?? false) {
                          context.read<AddCategoriesBloc>().add(
                            SaveCategories(context: context),
                          );
                        }
                      },
                      child: Text(
                        "Save Category",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
