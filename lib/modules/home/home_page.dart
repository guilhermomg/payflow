import 'package:flutter/material.dart';
import 'package:payflow/modules/my_barcodes/my_barcodes_page.dart';
import 'package:payflow/modules/statement/statement_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: widget.user.name,
                          style: TextStyles.titleBoldBackground)
                    ])),
                subtitle: Text("Mantenha suas contas em dia",
                    style: TextStyles.captionShape),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(widget.user.photoURL!)),
                  ),
                ),
              ),
            )),
      ),
      body: [
        MyBarcodesPage(key: UniqueKey()),
        StatementPage(key: UniqueKey()),
      ][controller.currentPage],
      bottomNavigationBar: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(Icons.home,
                      color: controller.currentPage == 0
                          ? AppColors.primary
                          : AppColors.body),
                  onPressed: () {
                    controller.setPage(0);
                    setState(() {});
                  }),
              GestureDetector(
                child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(
                      Icons.add_box_outlined,
                      color: AppColors.background,
                    )),
                onTap: () async {
                  await Navigator.pushNamed(context, "/barcode_scanner");
                  setState(() {});
                },
              ),
              IconButton(
                  icon: Icon(Icons.description_outlined,
                      color: controller.currentPage == 1
                          ? AppColors.primary
                          : AppColors.body),
                  onPressed: () {
                    controller.setPage(1);
                    setState(() {});
                  }),
            ],
          )),
    );
  }
}
