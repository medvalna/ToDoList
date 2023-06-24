import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
/*
*
*   - ToDoTile - прорисовка листа тайлов
* */

class Header extends StatelessWidget {
  final int doneCount;

  const Header({
    super.key,
    required this.doneCount,
  });

  //var t = AppLocalizations.of(context);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context).done,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Expanded(
                child: Text(
                  doneCount.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
