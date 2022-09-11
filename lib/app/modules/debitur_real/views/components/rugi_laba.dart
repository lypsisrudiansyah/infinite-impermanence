// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// 🌎 Project imports:
import 'package:akm/app/models/debtor.dart';
import 'package:akm/app/routes/app_pages.dart';

class RugiLaba extends StatelessWidget {
  const RugiLaba({
    Key? key,
    required this.debtor,
  }) : super(key: key);

  final Debtor debtor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text('2. Rugi Laba'),
      children: [
        // check if neraca is empty
        debtor.inputNeraca == null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Input Neraca terlebih dahulu',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              )
            :
            // check if rugi laba is not null
            debtor.inputRugiLaba != null
                ? Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(FontAwesomeIcons.eye),
                          label: const Text(
                            "Lihat Rugi Laba",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.deepOrange,
                          ),
                          onPressed: () {
                            // Get.toNamed(Routes.LIHAT_RUGI_LABA,
                            //     // Send debtor id to input keuangan page
                            //     arguments: debtor.inputRugiLaba);
                            Get.toNamed(Routes.VIEW_RUGI_LABA,
                                // Send debtor id to input keuangan page
                                arguments: debtor);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(FontAwesomeIcons.pencil),
                          label: const Text(
                            "Edit Rugi Laba",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.green,
                          ),
                          onPressed: () {
                            // Get.toNamed(Routes.EDIT_RUGI_LABA,
                            //     // Send debtor id to input keuangan page
                            //     arguments: debtor.inputRugiLaba);
                          },
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          icon: const Icon(FontAwesomeIcons.amazon),
                          label: const Text(
                            "Input Rugi Laba",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.blueGrey,
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.RUGI_LABA,
                                // Send ID neraca to input rugi laba page
                                arguments: debtor);
                          },
                        ),
                      ),
                    ],
                  ),
      ],
    );
  }
}
