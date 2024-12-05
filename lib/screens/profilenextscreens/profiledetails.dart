import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/cubits/my_profile_cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/cubits/my_profile_cubit/profile_cubit.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/Widgets/async_widget.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails>
    with TickerProviderStateMixin {
  final profileKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset("assets/images/arrowback.png"),
        ),
      ),
      body: BlocListener<ProfileCubit, Result>(
        listener: (context, state) {
          if(state.data != null){
            
            context.read<MyProfileListCubit>().getProfile();
          }
        },
        child: AsyncWidget<MyProfileListCubit, MyProfile>(
          data: (profile) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Form(
                      key: profileKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Center(child: ProfileImageStack()),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Upload Image',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: 8),
                          BuildTExtField(context: context, label: "First Name", initialValue: profile?.firstName, onSaved: (value) =>
                                context.read<ProfileCubit>().updateForm("firstName", value)),
                          const SizedBox(height: 20),
                          BuildTExtField(context: context, label: "Last Name", initialValue: profile?.lastName, onSaved: (value) =>
                                context.read<ProfileCubit>().updateForm("lastName", value)),
                          const SizedBox(height: 20),
                          BuildTExtField(context: context, label: "Country Code", initialValue: profile?.countryCode, onSaved: (value) =>
                                context.read<ProfileCubit>().updateForm("countryCode", value)),
                          const SizedBox(height: 20),
                          BuildTExtField(context: context, label: "Phone Number", initialValue: profile?.phoneNumber, onSaved: (value) =>
                                context.read<ProfileCubit>().updateForm("phoneNumber", value)),
                          const SizedBox(height: 20),
                          BlocBuilder<ProfileCubit, Result>(
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  fixedSize: Size(MediaQuery.of(context).size.width, 50),
                                ),
                                onPressed: state.isLoading
                                    ? null
                                    : () {
                                        if (profileKey.currentState!.validate()) {
                                          profileKey.currentState!.save();
                                          context.read<ProfileCubit>().patchProfileData();
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
                                            .copyWith(color: Colors.white),
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },  
        ),
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
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.black),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          onSaved: onSaved,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            hintStyle: const TextStyle(color: Color.fromARGB(255, 191, 189, 189)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
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

class ProfileImageStack extends StatelessWidget {
  const ProfileImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/3x/profileimg.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 64,
          left: 64,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            child: const Icon(
                              Icons.camera,
                              size: 40,
                            ),
                            onPressed: () {
                              // chooseImage("camera");
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white, elevation: 0),
                            onPressed: () {
                              // chooseImage("gallery");
                            },
                            child: const Icon(
                              Icons.image,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: 70,
              width: 70,
              child: Image.asset(
                "assets/images/edit.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
