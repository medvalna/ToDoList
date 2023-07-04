import 'package:flutter/material.dart';
import 'package:to_do_list/adaptivity/colours.dart';
import 'package:to_do_list/managers/navigation.dart';

/*
*   - навигация к странице addScreen через Navigator
* */
class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: FloatingActionButton(
          onPressed: () => {
            _onOpenAdding(),
          },
          child: const Icon(
            Icons.add,
            size: 28,
            color: tileBackLight,
          ),
        ),
      ),
    );
  }

  void _onOpenAdding() {
    NavigationManager.instance.openAdding();
  }
}
