import 'dart:io';
import 'package:flutter/material.dart';

void showImagePickerSheet(BuildContext context, Function(File?) onImagePicked) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext bc) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    'Choose an Option',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.blue),
                // Replace with AppColors.blueBaseColor
                title: Text("Gallery"),
                onTap: () async {
                  // final pickedFile =
                  //     await _picker.pickImage(source: ImageSource.gallery);
                  // if (pickedFile != null) {
                  //   onImagePicked(File(pickedFile.path));
                  // }
                  // Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.blue),
                // Replace with AppColors.blueBaseColor
                title: Text('Camera'),
                onTap: () async {
                  // final pickedFile =
                  //     await _picker.pickImage(source: ImageSource.camera);
                  // if (pickedFile != null) {
                  //   onImagePicked(File(pickedFile.path));
                  // }
                  // Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
