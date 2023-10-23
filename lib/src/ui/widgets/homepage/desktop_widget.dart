import 'package:bloc_architecture/src/models/item_model.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/custom_gridview.dart';
import 'package:flutter/material.dart';

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({super.key, required this.snapshot});

  final AsyncSnapshot<ItemModel> snapshot;

  @override
  Widget build(BuildContext context) {
    return CustomGridview(snapshot: snapshot, crossAxisCount: 5);
  }
}
