// ignore_for_file: unnecessary_const

// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:akm/app/common/style.dart';
import 'package:akm/app/modules/debitur_detail_banget/controllers/debitur_detail_banget_controller.dart';
import 'package:akm/app/modules/debitur_real/controllers/debitur_real_controller.dart';
import 'package:akm/app/routes/app_pages.dart';

class DebiturListView extends GetView<DebiturRealController> {
  DebiturListView({Key? key}) : super(key: key);

  final foreignCont = Get.put(DebiturDetailBangetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DebiturListView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          // Gradient background
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                primaryColor,
                secondaryColor,
              ],
            ),
          ),
          child: Column(
            children: [
              Text(
                'List Debitur',
                style: GoogleFonts.adventPro(
                    fontSize: 30,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Search bar to filter list

              const SizedBox(height: 16),
              Obx(
                () => Expanded(
                  child: controller.loadingFetch.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GetBuilder<DebiturRealController>(
                          init: controller,
                          builder: (_) => ListView.separated(
                            itemCount: controller.listDebtor.length,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemBuilder: (_, index) {
                              final debtor = controller.listDebtor[index];
                              return Container(
                                color: secondaryColor,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Card(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          // Show first letter of name
                                          child: Text(
                                            debtor.peminjam1!.substring(0, 1),
                                            style: const TextStyle(
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                        title: Text(debtor.peminjam1.toString(),
                                            style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                color: primaryColor)),
                                        subtitle:
                                            Text(debtor.bidangUsaha.toString()),
                                        trailing: const Icon(
                                          Icons.keyboard_arrow_right,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: secondaryColor,
                                      child: ExpansionTile(
                                        title: const Text('Detail Debitur'),
                                        children: [
                                          ExpansionTile(
                                            leading: const Icon(Icons.people),
                                            title: const Text(
                                              'Data Pribadi Debitur',
                                            ),
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          OutlinedButton.icon(
                                                        icon: const Icon(Icons
                                                            .remove_red_eye),
                                                        label: const Text(
                                                          "Lihat Data",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.blueGrey,
                                                        ),
                                                        onPressed: () {
                                                          Get.toNamed(
                                                            Routes
                                                                .DEBITUR_DETAIL_BANGET,
                                                            arguments:
                                                                debtor.id,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 16,
                                                    ),
                                                    Expanded(
                                                      child:
                                                          OutlinedButton.icon(
                                                        icon: const Icon(
                                                            Icons.edit),
                                                        label: const Text(
                                                          "Edit Debitur",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.blueGrey,
                                                        ),
                                                        onPressed: () {
                                                          Get.toNamed(
                                                              Routes
                                                                  .DEBITUR_EDIT,
                                                              arguments:
                                                                  debtor);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const ExpansionTile(
                                            title: Text('Keuangan Debitur'),
                                            leading:
                                                const Icon(Icons.attach_money),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//         itemCount: controller.listDebtor.length,
//         itemBuilder: (context, index) {
//           return Card(
//             child: ListTile(
//               title: Text(controller.listDebtor[index].peminjam1.toString()),
//               subtitle: Text(controller.listDebtor[index].noKtp1.toString()),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   // controller.deleteDebtor(index);
//                 },
//               ),
//               onTap: () {
//                 // Get.toNamed(AppPages.DEBITUR_DETAIL, arguments: controller.listDebtor[index]);
//               },
//             ),
//           );
//         },
//       ),
