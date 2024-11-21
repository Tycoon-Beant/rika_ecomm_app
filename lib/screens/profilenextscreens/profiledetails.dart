import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/cubits/my_profile_cubit/my_profile_list_cubit.dart';
import 'package:rika_ecomm_app/model/my_profile_model.dart';
import 'package:rika_ecomm_app/model/result.dart';


class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails>
    with TickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    final profileState = context.watch<MyProfileListCubit>();
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Image.asset("assets/images/arrowback.png")),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 20),
            Center(
                child: Stack(children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/images/3x/profileimg.png",
                        fit: BoxFit.fill,
                      )),
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
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          elevation: 0),
                                      child: Icon(
                                        Icons.camera,
                                        size: 40,
                                      ),
                                      onPressed: () {
                                        // chooseImage("camera");
                                      },
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            elevation: 0),
                                        onPressed: () {
                                          // chooseImage("gallery");
                                        },
                                        child: Icon(
                                          Icons.image,
                                          size: 40,
                                        ))
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
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: const Color.fromARGB(255, 209, 208, 208),
                                blurRadius: 5,
                                offset: Offset(12, 10))
                          ]),
                          child: Image.asset(
                            "assets/images/edit.png",
                            fit: BoxFit.fill,
                          ))))
            ])),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Upload Image',
                style: context.theme.titleMedium,
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<MyProfileListCubit, Result<MyProfile>>(
              builder: (context, state) {
               return state.when(onData: (profile) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "First Name ",
                          style: context.theme.titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                                initialValue:
                                    profile?.firstName,
                                decoration: InputDecoration(
                                  hintText: 'Enter first name',
                                  hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 191, 189, 189),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "First Name ",
                          style: context.theme.titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                              initialValue: profileState.state.data?.lastName,
                                decoration: InputDecoration(
                              hintText: "Enter last name",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 191, 189, 189),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Country Code",
                          style: context.theme.titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(width: 56),
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                              initialValue: profileState.state.data?.countryCode,
                                decoration: InputDecoration(
                              hintText: "Enter country code",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 191, 189, 189),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          "Phone number ",
                          style: context.theme.titleMedium!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(width: 46),
                        Expanded(
                          child: SizedBox(
                            child: TextFormField(
                                decoration: InputDecoration(
                              hintText: "Enter phone",
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 191, 189, 189),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                );
             
               }, onLoading: () {
                return Center(child: CircularProgressIndicator(),);
               }, onError: (e) {
                return Center(child: Text(e.toString()),);
               });

                 },
            ),
            const SizedBox(height: 20),
            
            
            
          ]),
        ),
      ),
    );
  }
}
