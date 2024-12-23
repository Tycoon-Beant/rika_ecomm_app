import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/social/post_cubit/post_cubit.dart';
import 'package:rika_ecomm_app/social/post_cubit/all_post_list_cubit.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String? caption;
  String? tags;
  File? selectedImage;

  final _postKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<PostCubit>().state.isLoading;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          "Upload",
          style: context.theme.headlineSmall!
              .copyWith(fontFamily: FontFamily.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<PostCubit, Result<PostsState>>(
            listener: (context, state) {
              if (state.data != null) {
                context.read<AllPostListCubit>().getAllPosts();
                Navigator.of(context).pop();
              }
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error.toString()),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Form(
                key: _postKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 600,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            InkWell(
                              onTap: () async {
                                final image = await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ImageSelection();
                                  },
                                );
                                setState(() {
                                  selectedImage = File(image.path);
                                });
                              },
                              child: selectedImage == null
                                  ? DottedBorder(
                                      color: Colors.black, // Border color
                                      strokeWidth: 2, // Border width
                                      dashPattern: [
                                        8,
                                        3
                                      ], // Dotted pattern (length and gap)
                                      borderType: BorderType
                                          .RRect, // Rounded rectangle border
                                      radius: const Radius.circular(
                                          12), // Border radius
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 200,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              size: 40,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              "Add Image",
                                              style: context.theme.titleMedium!
                                                  .copyWith(
                                                      fontFamily:
                                                          FontFamily.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: FileImage(selectedImage!),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Caption: ",
                                  style: context.theme.titleMedium,
                                ),
                                TextFormField(
                                  maxLines: 2,
                                  scrollPhysics:
                                      AlwaysScrollableScrollPhysics(),
                                  decoration: InputDecoration(
                                    hintText: "Enter caption.....",
                                    hintStyle: context.theme.bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter caption';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    caption = value;
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Tags",
                              style: context.theme.titleMedium,
                            ),
                            TextFormField(
                              maxLines: 2,
                              scrollPhysics: AlwaysScrollableScrollPhysics(),
                              decoration: InputDecoration(
                                hintText: "Enter tags.....",
                                hintStyle: context.theme.bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                              onSaved: (value) {
                                tags = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(MediaQuery.sizeOf(context).width, 50),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_postKey.currentState!.validate()) {
                                _postKey.currentState?.save();
                                context.read<PostCubit>().addpostData(
                                    caption!, [selectedImage!], [tags!]);
                              }
                            },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text('Upload',
                            style: context.theme.titleMedium!
                                .copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ImageSelection extends StatelessWidget {
  const ImageSelection({
    super.key,
  });

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      // Do something with the selected image (e.g., display or upload it)

      Navigator.of(context).pop(image);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _pickImage(context, ImageSource.camera),
                icon: Icon(Icons.camera_alt_outlined),
                color: Colors.black,
                iconSize: 30,
              ),
              IconButton(
                onPressed: () => _pickImage(context, ImageSource.gallery),
                icon: Icon(Icons.file_present_outlined),
                color: Colors.black,
                iconSize: 30,
              ),
            ],
          ),
        ));
  }
}
