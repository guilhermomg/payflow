import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/invoice_model.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BarcodeTileWidget extends StatelessWidget {
  final InvoiceModel model;
  const BarcodeTileWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          model.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence em ${model.dueDate}",
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$",
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: model.value!.toStringAsFixed(2),
                style: TextStyles.trailingBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
