import 'dart:async';
import 'dart:io';

import 'package:final_project/Database/database_services.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:uuid/uuid.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

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

  Future _pickImage(ImageSource source, context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _imageCropper(imageFile: img);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController desCtrl = TextEditingController();
    Uuid _uuid = Uuid();

    String fileName = 'post.jpg';
    String imagePathId = _uuid.v1();
    final RoundedLoadingButtonController _btnController =
        RoundedLoadingButtonController();
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
                child: _image == null
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
                            _pickImage(ImageSource.gallery, context);
                          },
                          icon: Icon(
                            Icons.add_a_photo_sharp,
                            size: 60,
                          ),
                          color: Colors.white,
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: FileImage(_image!),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () async {
                            _pickImage(ImageSource.gallery, context);
                          },
                          icon: Icon(
                            Icons.add_a_photo_sharp,
                            size: 60,
                          ),
                          color: Colors.white,
                        ),
                      ),
              ),
              SizedBox(
                height: 25,
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
                          child: Text(
                            "submit post",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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

                                DatabaseServices().addPost(
                                    uId: userId,
                                    imagePath: fileName,
                                    imagePathId: imagePathId,
                                    postTitle: titleCtrl.text,
                                    postDesctiption: desCtrl.text,
                                    imageUrl: downloadUri);
                                customSnackbar(
                                    context,
                                    "Post uploaded ",
                                    "Your post have been uploaded",
                                    ContentType.failure);
                                Navigator.of(context).pop();
                              } catch (err) {
                                print(err.toString());
                              }
                            } else {
                              customSnackbar(
                                  context,
                                  "please fill all the fields",
                                  "post uploade failed",
                                  ContentType.failure);
                            }
                          },
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // try {
  //                                 final ref = storage.FirebaseStorage.instance
  //                                     .ref()
  //                                     .child(
  //                                         'users/$userId/post_image_folder/$imagePathId/$fileName');

  //                                 await ref.putFile(_image!);
  //                                 downloadUri = await ref.getDownloadURL();

  //                                 DatabaseServices(postImagePathId: imagePathId)
  //                                     .addPost(
  //                                         uId: userId,
  //                                         imagePath: fileName,
  //                                         imagePathId: imagePathId,
  //                                         postTitle: titleCtrl.text,
  //                                         postDesctiption: desCtrl.text,
  //                                         imageUrl: downloadUri);
  //                               } catch (err) {
  //                                 print(err.toString());
  //                               }



