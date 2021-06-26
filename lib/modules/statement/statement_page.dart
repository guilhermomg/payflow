import 'package:flutter/material.dart';
import 'package:payflow/shared/models/invoice_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/barcode_info/barcode_info_widget.dart';
import 'package:payflow/shared/widgets/barcode_list/barcode_list_controller.dart';
import 'package:payflow/shared/widgets/barcode_list/barcode_list_widget.dart';

class StatementPage extends StatefulWidget {
  const StatementPage({Key? key}) : super(key: key);

  @override
  State<StatementPage> createState() => _StatementPageState();
}

class _StatementPageState extends State<StatementPage> {
  final controller = BarcodeListController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text("Meus extratos", style: TextStyles.titleBoldHeading),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Divider(
              height: 1,
              thickness: 1,
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BarcodeListWidget(controller: controller),
          ),
        ],
      ),
    );
  }
}
