import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/controller/admin_controller.dart';
import 'package:shimmer/shimmer.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminController admincon = Get.put(AdminController());
    return GetBuilder<AdminController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gallery Management',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      admincon.resetsetselectedgallerycover();
                      admincon.showAddGalleryCoverDialog(context);
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      side: const BorderSide(color: Colors.blue),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, color: Colors.blue),
                        SizedBox(width: 3),
                        const Text(
                          "Add cover Image",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Manage your site gallery cover images',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
              const SizedBox(height: 32),
              // Gallery grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: admincon.allgallerycover.length,
                  itemBuilder: (context, index) {
                    return GalleryItemCard(index: index);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GalleryItemCard extends StatelessWidget {
  final int index;

  const GalleryItemCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final AdminController admincon = Get.put(AdminController());
    return GetBuilder<AdminController>(
      builder: (_) {
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            side: BorderSide(color: const Color.fromARGB(255, 232, 232, 232)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        '${api + admincon.allgallerycover[index].imageCoverPath}',

                    fit: BoxFit.cover,
                    placeholder:
                        (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(height: 140, color: Colors.white),
                        ),
                    errorWidget: (context, url, error) {
                      log(error.toString());
                      return Container(
                        height: 140,
                        color: Colors.white,
                        child: const Center(
                          child: Icon(Icons.broken_image, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${admincon.allgallerycover[index].title}',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            admincon.setselectedgallerycover(
                              id: admincon.allgallerycover[index].id,
                              context: context,
                            );
                          },
                          icon: const Icon(Icons.edit, size: 20),
                          tooltip: 'Edit',
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete, size: 20),
                          tooltip: 'Delete',
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
