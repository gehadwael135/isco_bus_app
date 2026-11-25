import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isco_bus/core/responsive/inject_responsive_info.dart';
import 'package:isco_bus/core/theme/app_colors.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    super.key,
    required this.text,
    required this.hint,
    this.valueListenable,
    required this.dropdownItems,
    this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.validator,
  });

  final String text;
  final String hint;
  final ValueListenable<String?>? valueListenable;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButton2Builder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      initialValue: valueListenable?.value,
      builder: (FormFieldState<String> field) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 0.01.h),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  valueListenable: valueListenable,
                  hint: Container(
                    alignment: hintAlignment,
                    child: Text(
                      hint,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ),
                  items: dropdownItems
                      .map(
                        (String item) => DropdownItem<String>(
                          value: item,
                          height: itemHeight ?? 0.05.h,
                          child: Container(
                            alignment: valueAlignment,
                            child: Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    field.didChange(value);
                    onChanged?.call(value);
                  },
                  selectedItemBuilder: selectedItemBuilder,
                  buttonStyleData: ButtonStyleData(
                    height: buttonHeight ?? 0.062.h,
                    width: buttonWidth ?? double.infinity,
                    padding: buttonPadding ??
                        EdgeInsets.symmetric(horizontal: 0.035.w),
                    decoration: buttonDecoration ??
                        BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: field.hasError
                                ? Colors.red
                                : Colors.black45,
                          ),
                        ),
                    elevation: buttonElevation,
                  ),
                  iconStyleData: IconStyleData(
                    icon: icon ?? const Icon(Icons.arrow_drop_down),
                    iconSize: iconSize ?? 0.06.w,
                    iconEnabledColor: AppColors.darkBlack,
                    iconDisabledColor: AppColors.darkBlack,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: dropdownHeight ?? 0.25.h,
                    width: dropdownWidth ?? 0.9.w,
                    padding: dropdownPadding,
                    decoration: dropdownDecoration ??
                        BoxDecoration(borderRadius: BorderRadius.circular(14)),
                    elevation: dropdownElevation ?? 8,
                    scrollbarTheme: ScrollbarThemeData(
                      radius: scrollbarRadius ?? const Radius.circular(40),
                      thickness: scrollbarThickness != null
                          ? WidgetStateProperty.all<double>(scrollbarThickness!)
                          : null,
                      thumbVisibility: scrollbarAlwaysShow != null
                          ? WidgetStateProperty.all<bool>(scrollbarAlwaysShow!)
                          : null,
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    padding: itemPadding ??
                        EdgeInsets.symmetric(horizontal: 0.035.w),
                  ),
                ),
              ),
              if (field.hasError)
                Padding(
                  padding: EdgeInsets.only(top: 0.008.h),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      field.errorText!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}