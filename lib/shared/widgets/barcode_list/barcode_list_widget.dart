import 'package:flutter/material.dart';
import 'package:payflow/shared/models/invoice_model.dart';
import 'package:payflow/shared/widgets/barcode_list/barcode_list_controller.dart';
import 'package:payflow/shared/widgets/barcode_tile/barcode_tile_widget.dart';

class BarcodeListWidget extends StatefulWidget {
  final BarcodeListController controller;

  const BarcodeListWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _BarcodeListWidgetState createState() => _BarcodeListWidgetState();
}

class _BarcodeListWidgetState extends State<BarcodeListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<InvoiceModel>>(
        valueListenable: widget.controller.barcodesNotifier,
        builder: (_, barcodes, __) => Column(
              children:
                  barcodes.map((b) => BarcodeTileWidget(model: b)).toList(),
            ));
  }
}
