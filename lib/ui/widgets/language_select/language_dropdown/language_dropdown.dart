import 'package:blaa/utils/authentication/build_input_decoration.dart';
import 'package:flutter/material.dart';

class LanguageDropdown<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T?) onChanged;

  const LanguageDropdown({
    required Key key,
    this.hintText = 'Please select language',
    this.options = const [],
    required this.getLabel,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      key: key,
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: inputDecoration(label: hintText),
          // isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              dropdownColor: Colors.amberAccent,
              elevation: 16,
              hint: Text(hintText),
              value: value,
              isDense: true,
              onChanged: onChanged,
              items: options.map<DropdownMenuItem<T>>((T value) {
                return DropdownMenuItem<T>(
                  key: Key('DropdownMenuItem-$value'),
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) => (value == null || value == '') ? 'Please choose language' : null,
    );
  }
}