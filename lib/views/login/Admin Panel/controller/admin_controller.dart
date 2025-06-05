import 'dart:developer';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misdeptapp/config/constants.dart';
import 'package:misdeptapp/core/services/api_service.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/activitymodel.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/gallerycover.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/gallerymodel.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/notificationmodel.dart';
import 'package:misdeptapp/views/login/Admin%20Panel/model/usersmodel.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AdminController extends GetxController {
  List<UserModel> _allusers = [];
  List<UserModel> get allusers => _allusers;

  bool _isgalleryimagepage = false;
  bool get isgalleryimagepage => _isgalleryimagepage;

  List<GalleryModel> _allgallery = [];
  List<GalleryModel> get allgallery => _allgallery;

  List<GalleryModel> _allgalleryforspecificgallerycover = [];
  List<GalleryModel> get allgalleryforspecificgallerycover =>
      _allgalleryforspecificgallerycover;

  List<GalleryCovermodel> _allgallerycover = [];
  List<GalleryCovermodel> get allgallerycover => _allgallerycover;

  GalleryCovermodel? _selectedgallerycover;
  GalleryCovermodel? get selectedgalleycover => _selectedgallerycover;

  List<NotificationModel> _allnotification = [];
  List<NotificationModel> get allnotification => _allnotification;

  List<ActivityModel> _allactivity = [];
  List<ActivityModel> get allactivity => _allactivity;

  final covertitleController = TextEditingController();

  // Add these variables to your dialog state
  Uint8List? coverselectedImageBytes; // For web

  DateTime coverselectedDate0 = DateTime.now();

  getalldatas() {
    getallusers();
    getallgallery();
    getallnotification();
    getallrecentactivity();
    getallgallerycover();
  }

  settogetspecificcoverimages({required int gcid}) {
    _allgalleryforspecificgallerycover =
        _allgallery.where((ga) => ga.gcid == gcid).toList();
    _isgalleryimagepage = true;
    update();
  }

  closedgalleryimage() {
    _isgalleryimagepage = false;
    update();
  }

  void getallusers() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Accounts', headers: {'Content-Type': 'application/json'});

    var data = userModelFromJson(response.body);

    _allusers = data;
    update();
    log(_allusers.toString());
  }

  void getallgallery() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Galleries', headers: {'Content-Type': 'application/json'});

    var data = galleryModelFromJson(response.body);

    _allgallery = data;
    update();
  }

  void getallgallerycover() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/GalleryCovers', headers: {'Content-Type': 'application/json'});

    var data = galleryCovermodelFromJson(response.body);

    _allgallerycover = data;
    update();
  }

  void updategallerycover({
    required int id,
    required Uint8List byteimage,
    required String title,
    required DateTime eventDate,
  }) async {
    final response = await ApiService(baseUrl: api).putgallerycover(
      endpoint: '/api/GalleryCovers/$id',
      imageBytes: byteimage,
      eventdate: eventDate,
      title: title,
      id: id.toString(),
    );

    if (response.statusCode >= 200 && response.statusCode < 400) {
      print('Update successful!');
      getallgallerycover();
    } else {
      print('Update failed with status: ${response.statusCode}');
    }
  }

  void getallnotification() async {
    var response = await ApiService(
      baseUrl: api,
    ).get('/api/Notifications', headers: {'Content-Type': 'application/json'});

    var data = NotificationModelFromJson(response.body);

    _allnotification = data;
    update();
  }

  void getallrecentactivity() async {
    var response = await ApiService(baseUrl: api).get(
      '/api/RecentActivities',
      headers: {'Content-Type': 'application/json'},
    );

    var data = activityModelFromJson(response.body);

    _allactivity = data;
    update();
  }

  IconData geticonforrecentactivity({
    required String title,
    required String remark,
  }) {
    if (title == 'create' && remark == 'Added new gallery image') {
      return Icons.add_a_photo;
    } else if (title == 'create' && remark == 'Added new notification') {
      return Icons.notifications;
    } else if (title == 'update') {
      return Icons.edit;
    } else {
      return Icons.delete;
    }
  }

  Color getcolorforrecentactivity({
    required String title,
    required String remark,
  }) {
    if (title == 'create' && remark == 'Added new gallery image') {
      return Color(0xFF6C72FF);
    } else if (title == 'create' && remark == 'Added new notification') {
      return Color(0xFFFF9800);
    } else if (title == 'update') {
      return Color(0xFF4CAF50);
    } else {
      return Color(0xFFF44336);
    }
  }

  String getTimeAgo(DateTime createdAt) {
    return timeago.format(createdAt);
  }

  resetsetselectedgallerycover() {
    _selectedgallerycover = null;
    update();
  }

  removeselectedcover({required int id, required BuildContext context}) {
    showDeleteConfirmationDialog(
      context: context,
      onConfirm: () {
        ApiService(baseUrl: api).delete('/api/GalleryCovers/$id').then((val) {
          if (val.statusCode >= 200 && val.statusCode < 300) {
            getallgallerycover();
            showSuccessDialog(
              context: context,
              message: 'Deleted successfully',
            );
          } else {
            showSuccessDialog(
              context: context,
              message: 'Failed to deleted item',
              title: 'Failed',
            );
          }
        });
      },
    );
  }

  setselectedgallerycover({required int id, required BuildContext context}) {
    _selectedgallerycover = _allgallerycover.firstWhere((gal) => gal.id == id);
    update();
    showAddGalleryCoverDialog(context, id);
  }

  Future<void> showSuccessDialog({
    required BuildContext context,
    String title = 'Success',
    String message = 'Operation completed successfully.',
    VoidCallback? onOk,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Text('Success'),
            ],
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                if (onOk != null) onOk(); // Optional action
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteConfirmationDialog({
    required BuildContext context,
    required VoidCallback onConfirm,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Confirmation'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onConfirm(); // Perform delete action
              },
            ),
          ],
        );
      },
    );
  }

  Future<Uint8List> networkImageToBytes(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image from $imageUrl');
    }
  }

  void updateGalleryCover() async {
    String imageUrl = 'http://10.10.1.31/uploads/Image/your-image.png';
    // fetch from network or file picker
  }

  void showAddGalleryCoverDialog(BuildContext context, int? id) {
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        if (_selectedgallerycover != null) {
          covertitleController.text = _selectedgallerycover!.title;
          coverselectedDate0 = _selectedgallerycover!.eventDate;
        }

        return StatefulBuilder(
          builder: (context, setState) {
            pickImage(BuildContext context) async {
              try {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  allowMultiple: false,
                );

                if (result != null && result.files.isNotEmpty) {
                  PlatformFile file = result.files.first;

                  // For web, we can use bytes directly
                  setState(() {
                    coverselectedImageBytes = file.bytes;
                  });
                  log("Selected Image : " + coverselectedImageBytes.toString());

                  // For mobile/desktop, use the path
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to pick image: ${e.toString()}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }

            Future<void> selectDate() async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: coverselectedDate0,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null && pickedDate != coverselectedDate0) {
                setState(() {
                  coverselectedDate0 = pickedDate;
                });
              }
            }

            void submitForm() async {
              if (formKey.currentState!.validate()) {
                if (id == null) {
                  if (coverselectedImageBytes == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select an image')),
                    );
                    return;
                  }

                  if (coverselectedImageBytes == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select an image')),
                    );
                    return;
                  }

                  if (coverselectedImageBytes == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select an image')),
                    );
                    return;
                  }

                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);

                  Uint8List imageBytes = await networkImageToBytes(
                    "${api + _selectedgallerycover!.imageCoverPath}",
                  );
                  updategallerycover(
                    id: id,
                    byteimage: coverselectedImageBytes ?? imageBytes,
                    title: covertitleController.text,
                    eventDate: coverselectedDate0,
                  );
                }
              }
            }

            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                _selectedgallerycover != null
                    ? 'Update Gallery Cover'
                    : 'Add New Gallery Cover',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 350,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image Upload Section
                        InkWell(
                          onTap: () => pickImage(context),
                          child: Container(
                            width: double.maxFinite,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child:
                                coverselectedImageBytes == null &&
                                        _selectedgallerycover == null
                                    ? Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_photo_alternate,
                                            size: 40,
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Tap to select image',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    : _selectedgallerycover != null &&
                                        coverselectedImageBytes == null
                                    ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            api +
                                            _selectedgallerycover!
                                                .imageCoverPath,

                                        fit: BoxFit.cover,
                                        placeholder:
                                            (context, url) =>
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      Colors.grey.shade300,
                                                  highlightColor:
                                                      Colors.grey.shade100,
                                                  child: Container(
                                                    height: 140,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                        errorWidget: (context, url, error) {
                                          log(error.toString());
                                          return Container(
                                            height: 140,
                                            color: Colors.white,
                                            child: const Center(
                                              child: Icon(
                                                Icons.broken_image,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                    : _selectedgallerycover != null &&
                                        coverselectedImageBytes != null
                                    ? Image.memory(
                                      coverselectedImageBytes!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Center(
                                          child: Text('Could not load image'),
                                        );
                                      },
                                    )
                                    : Image.memory(
                                      coverselectedImageBytes!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Center(
                                          child: Text('Could not load image'),
                                        );
                                      },
                                    ),
                          ),
                        ),

                        SizedBox(height: 16),

                        // Title Field
                        TextFormField(
                          controller: covertitleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.title),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Description Field
                        InkWell(
                          onTap: selectDate,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Date',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              prefixIcon: Icon(Icons.calendar_today),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat.yMMMMd().format(
                                    coverselectedDate0,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                OutlinedButton(
                  onPressed: submitForm,
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
                  child: Text(
                    _selectedgallerycover != null ? "Update" : "Submit",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showAddGalleryDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    // Add these variables to your dialog state
    Uint8List? selectedImageBytes; // For web

    String? selectedImageName;

    // Gallery categories
    final List<String> galleryCategories = [
      'Festival',
      'Office Works',
      'Events',
      'Celebrations',
      'Projects',
      'Team Activities',
    ];
    String? selectedCategory;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            pickImage(BuildContext context) async {
              try {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.image,
                  allowMultiple: false,
                );

                if (result != null && result.files.isNotEmpty) {
                  PlatformFile file = result.files.first;

                  // For web, we can use bytes directly
                  setState(() {
                    selectedImageBytes = file.bytes;
                    selectedImageName = file.name;
                  });

                  // For mobile/desktop, use the path
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Failed to pick image: ${e.toString()}"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }

            void submitForm() {
              if (formKey.currentState!.validate()) {
                if (selectedImageBytes == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select an image')),
                  );
                  return;
                }

                if (selectedCategory == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select a category')),
                  );
                  return;
                }

                // Create gallery item object
                final galleryItem = {
                  "Title": titleController.text,
                  "Date": DateFormat(
                    'yyyy-MM-ddTHH:mm:ss',
                  ).format(selectedDate),
                  "Description": descriptionController.text,
                  "Category": selectedCategory,
                  "ImageFile": selectedImageBytes,
                };

                print('Submitting: $galleryItem');
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '"${titleController.text}" added to $selectedCategory',
                    ),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }

            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                'Add New Gallery Image',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: SingleChildScrollView(
                child: SizedBox(
                  width: 400,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image Upload Section
                        InkWell(
                          onTap: () => pickImage(context),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey),
                            ),
                            child:
                                selectedImageBytes == null
                                    ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_photo_alternate,
                                          size: 40,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Tap to select image',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )
                                    : Image.memory(
                                      selectedImageBytes!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Center(
                                          child: Text('Could not load image'),
                                        );
                                      },
                                    ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Gallery Category Dropdown
                        DropdownButtonFormField2<String>(
                          value: selectedCategory,
                          decoration: InputDecoration(
                            labelText: 'Gallery Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.category),
                            contentPadding: EdgeInsets.zero,
                          ),
                          isExpanded: true,
                          hint: Text(
                            'Select Category',
                            style: TextStyle(fontSize: 16),
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                          ),
                          buttonStyleData: ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            height: 50,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            maxHeight: 200,
                          ),
                          items:
                              galleryCategories.map((String category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(
                                    category,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a category';
                            }
                            return null;
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                        ),
                        SizedBox(height: 16),

                        // Title Field
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.title),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 16),

                        // Description Field
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            prefixIcon: Icon(Icons.description),
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                OutlinedButton(
                  onPressed: submitForm,
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
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
