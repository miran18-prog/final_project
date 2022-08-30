import 'dart:io';

import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:uuid/uuid.dart';

class PostScreen extends StatefulWidget {
  PostScreen({Key? key}) : super(key: key);
  Uuid _uuid = Uuid();

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

  Future uploadFile() async {
    if (_image == null) return;
    final fileName = 'post';
    String imagePathId = widget._uuid.v1();

    try {
      final ref = storage.FirebaseStorage.instance
          .ref()
          .child('posts/$userId/post/${imagePathId}/${fileName}');

      await ref.putFile(_image!);
    } catch (e) {
      print('error occured');
    }
  }

  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController desCtrl = TextEditingController();
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
              SizedBox(
                height: 25,
              ),
              SizedBox(height: 75),
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
                          if (_formKey.currentState!.validate()) {
                            uploadFile();

                            DatabaseServices(uId: userId).addPost(
                              uId: userId,
                              imagePath: _image!.path,
                              imagePathId: widget._uuid.v1(),
                              postTitle: titleCtrl.text,
                              postDesctiption: desCtrl.text,
                            );
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
