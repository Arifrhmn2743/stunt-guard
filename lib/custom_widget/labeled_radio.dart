import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.padding,
  });

  final String label;
  final EdgeInsets padding;
  final dynamic groupValue;
  final dynamic value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) onChanged(value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Radio(
                activeColor: Theme.of(context).colorScheme.primary,
                groupValue: groupValue,
                value: value,
                onChanged: (dynamic newValue) {
                  onChanged(newValue);
                },
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
