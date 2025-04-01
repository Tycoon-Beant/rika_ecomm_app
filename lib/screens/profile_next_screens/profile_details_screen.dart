import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/Widgets/async_widget.dart';
import 'package:rika_ecomm_app/screens/auth/model/login_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/profile_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/cubit/update_avatar_cubit.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/model/my_profile_model.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/profile_image_stack.dart';
import 'package:rika_ecomm_app/screens/profile_next_screens/profile_screen.dart';
import 'package:rika_ecomm_app/services/local_storage_service.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails>
    with TickerProviderStateMixin {
  final profileKey = GlobalKey<FormState>();
  final image = GlobalKey<_ProfileImageStackState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset("assets/images/arrowback.png"),
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ProfileCubit, Result>(
            listener: (context, state) {
              if (state.data != null) {
                context.read<MyProfileListCubit>().getProfile();
              }
              if (state.error != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error.toString())));
              }
            },
          ),
          BlocListener<UpdateAvatarCubit, Result<User>>(
            listener: (context, state) {
              if (state.data != null) {
                // Update local storage with the new avatar URL
                final user = context.read<LocalStorageService>().getUser();
                if (user != null) {
                  final updatedUser = user.copyWith(
                    avatar: user.avatar
                        ?.copyWith(localPath: state.data!.avatar?.localPath),
                  );
                  context.read<LocalStorageService>().saveUser(updatedUser);
                }

                context.read<MyProfileListCubit>().getProfile();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Profilescreen()));
              }
            },
          )
        ],
        child: AsyncWidget<MyProfileListCubit, MyProfile>(
          data: (profile) {
            final profileImage = context
                .read<LocalStorageService>()
                .getUser()
                ?.avatar
                ?.localPath;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: profileKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: ProfileImageStack(
                        coverImage: profileImage,
                        key: image,
                      )),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Upload Image',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: context.colorScheme.primary),
                        ),
                      ),
                      const SizedBox(height: 8),
                      BuildTExtField(
                          context: context,
                          label: "First Name",
                          initialValue: profile?.firstName,
                          onSaved: (value) => context
                              .read<ProfileCubit>()
                              .updateForm("firstName", value)),
                      const SizedBox(height: 10),
                      BuildTExtField(
                          context: context,
                          label: "Last Name",
                          initialValue: profile?.lastName,
                          onSaved: (value) => context
                              .read<ProfileCubit>()
                              .updateForm("lastName", value)),
                      const SizedBox(height: 10),
                      BuildTExtField(
                          context: context,
                          label: "Country Code",
                          initialValue: profile?.countryCode,
                          onSaved: (value) => context
                              .read<ProfileCubit>()
                              .updateForm("countryCode", value)),
                      const SizedBox(height: 10),
                      BuildTExtField(
                          context: context,
                          label: "Phone Number",
                          initialValue: profile?.phoneNumber,
                          onSaved: (value) => context
                              .read<ProfileCubit>()
                              .updateForm("phoneNumber", value)),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<ProfileCubit, Result>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
              ),
              onPressed: state.isLoading
                  ? null
                  : () {
                      if (profileKey.currentState!.validate()) {
                        profileKey.currentState!.save();
                        final coverImage = image.currentState!.selectedImage;
                        context.read<ProfileCubit>().patchProfileData();
                        context
                            .read<UpdateAvatarCubit>()
                            .patchCoverImg(image: coverImage!);
                      }
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      "Update Profile",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: context.colorScheme.onPrimary),
                    ),
            ),
          );
        },
      ),
    );
  }
}

class BuildTExtField extends StatelessWidget {
  const BuildTExtField({
    super.key,
    required this.context,
    required this.label,
    required this.initialValue,
    required this.onSaved,
  });

  final BuildContext context;
  final String label;
  final String? initialValue;
  final FormFieldSetter<String>? onSaved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: context.colorScheme.primary),
        ),
        const SizedBox(height: 4),
        TextFormField(
          initialValue: initialValue,
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            hintStyle: TextStyle(color: context.colorScheme.secondary),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.onSecondary),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileImageStack extends StatefulWidget {
  const ProfileImageStack({
    super.key,
    this.coverImage,
  });
  final String? coverImage;

  @override
  State<ProfileImageStack> createState() => _ProfileImageStackState();
}

class _ProfileImageStackState extends State<ProfileImageStack> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateAvatarCubit, Result<User>>(
      builder: (context, state) {
        return Stack(
          children: [
            if (selectedImage != null)
              SizedBox(
                height: 120,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(
                    selectedImage!,
                  ),
                ),
              )
            else if (widget.coverImage != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.coverImage ?? "",
                ),
              )
            else
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 100,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "assets/images/3x/profileimg.png",
                      ),
                    ),
                  )),
            Positioned(
              top: 65,
              left: 70,
              child: GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ImageSelection(
                          onImageSelected: (compressedImage) {
                            setState(() {
                              selectedImage = compressedImage;
                            });
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: context.colorScheme.onPrimary)),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ))),
            ),
          ],
        );
      },
    );
  }
}
