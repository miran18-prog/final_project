import 'dart:io';

import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:uuid/uuid.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String? downloadUri;

  File? _image;
  Future<File?> _imageCropper({required File imageFile}) async {
    CroppedFile? croppedIamge =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedIamge == null) return null;
    return File(croppedIamge.path);
  }

  // Future _pickImage(ImageSource source, context) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     File? img = File(image.path);
  //     img = await _imageCropper(imageFile: img);
  //     setState(() {
  //       _image = img;
  //     });
  //   } on PlatformException catch (e) {
  //     print(e);
  //     Navigator.of(context).pop();
  //   }
  // }

  Future<void> selectImage() async {
    if (_selectedImages != null) {
      _selectedImages.clear();
    }
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage();
      if (imgs!.isNotEmpty) {
        _selectedImages.addAll(imgs);
      }
      print("list of selected imaged: " + imgs.length.toString());
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  final ImagePicker _picker = ImagePicker();
  List<XFile> _selectedImages = [];
  FirebaseStorage _storageRef = FirebaseStorage.instance;

  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController desCtrl = TextEditingController();
    Uuid _uuid = Uuid();

    String fileName = 'post.jpg';
    String imagePathId = _uuid.v1();
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text(
          'Create a post',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: _selectedImages.length == 0
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            selectImage();
                          },
                          icon: Icon(
                            Icons.add_a_photo_sharp,
                            size: 60,
                          ),
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        width: double.maxFinite,
                        height: 200,
                        child: ListView.builder(
                          itemCount: _selectedImages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                                height: 200.0,
                                width: double.maxFinite,
                                child: Carousel(
                                  images: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(
                                              _selectedImages[index].path,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                  showIndicator: false,
                                ));
                          },
                        ),
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Write your post title..';
                          } else {
                            return null;
                          }
                        },
                        controller: titleCtrl,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17, letterSpacing: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Write your post description..';
                          } else {
                            return null;
                          }
                        },
                        controller: desCtrl,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 17, letterSpacing: 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              _image != null) {
                            try {
                              final ref = storage.FirebaseStorage.instance
                                  .ref()
                                  .child(
                                      'users/$userId/post_image_folder/$imagePathId/$fileName');

                              await ref.putFile(_image!);
                              downloadUri = await ref.getDownloadURL();

                              DatabaseServices(postImagePathId: imagePathId)
                                  .addPost(
                                      uId: userId,
                                      imagePath: fileName,
                                      imagePathId: imagePathId,
                                      postTitle: titleCtrl.text,
                                      postDesctiption: desCtrl.text,
                                      imageUrl: downloadUri);
                            } catch (err) {
                              print(err.toString());
                            }
                          } else {
                            customSnackbar(context, "Please pick an image", "",
                                Colors.red);
                          }
                        },
                        child: Text(
                          "Submet post",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
