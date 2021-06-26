import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BarcodeListController {
  final barcodesNotifier = ValueNotifier<List<InvoiceModel>>([]);
  
  List<InvoiceModel> get barcodes => barcodesNotifier.value;
  set barcodes(List<InvoiceModel> value) => barcodesNotifier.value = value;

  BarcodeListController() {
    getBarcodes();
  }

  Future<void> getBarcodes() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];

      barcodes = response.map((r) => InvoiceModel.fromJson(r)).toList();
    } catch (e) {
      barcodes = <InvoiceModel>[];
    }
  }
}
