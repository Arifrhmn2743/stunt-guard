import 'package:flutter/material.dart';

class ButtonBottomForm extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback? onDoubleTap;
  final bool isActive;
  final bool isLoading;

  const ButtonBottomForm(
      {super.key,
      this.onDoubleTap,
      required this.title,
      required this.onTap,
      required this.isActive,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Ink(
        height: 80,
        color: Theme.of(context).colorScheme.secondaryContainer,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: isActive ? onTap : null,
                  onDoubleTap: isActive ? onDoubleTap : null,
                  child: Ink(
                      height: 41,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        // gradient: isActive ? mainGradient : mainFadeGradient,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
        ),
      ),
    );
  }
}
