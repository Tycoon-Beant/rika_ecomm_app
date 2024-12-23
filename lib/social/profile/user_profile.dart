import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/social/addpost/add_post_screen.dart';
import 'package:rika_ecomm_app/social/post_cubit/all_post_list_cubit.dart';
import 'package:rika_ecomm_app/social/home/model/all_post_model.dart';
import 'package:rika_ecomm_app/social/home/social_home_screen.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  List gridlist = [
    "assets/social_media/grid1.jpeg",
    "assets/social_media/grid2.jpeg",
    "assets/social_media/grid3.jpeg",
    "assets/social_media/grid4.jpeg",
    "assets/social_media/grid5.jpeg",
    "assets/social_media/grid6.jpeg",
    "assets/social_media/grid7.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: context.theme.headlineSmall),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.settings_outlined,
              size: 30,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        elevation: 5,
        backgroundColor: Colors.black,
        label: Text(
          "Add Post",
          style: context.theme.bodySmall!.copyWith(color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              children: [
                Stack(children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    foregroundColor: Color(0xff128C7E),
                    radius: 40,
                    backgroundImage:
                        AssetImage("assets/social_media/user_profile.png"),
                  ),
                  Positioned(
                    top: 45,
                    left: 45,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.5),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 15,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wendy Edwards",
                        style: context.theme.titleLarge!
                            .copyWith(fontFamily: FontFamily.w700)),
                    Text("@wendy10edwards",
                        style: context.theme.titleMedium!.copyWith(
                          color: Colors.grey,
                        )),
                    Text(
                      "Jakarata,Indonesia",
                      style: context.theme.titleSmall!.copyWith(
                          color: const Color.fromARGB(255, 190, 190, 190)),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("890", style: context.theme.titleMedium),
                    Text(
                      "Likes",
                      style: context.theme.bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("1293", style: context.theme.titleMedium),
                    Text(
                      "Followers",
                      style: context.theme.bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("1436", style: context.theme.titleMedium),
                    Text(
                      "Following",
                      style: context.theme.bodyMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocListener<AllPostListCubit, Result<List<PostModel>>>(
                listener: (context, state) {
                  context.read<AllPostListCubit>().getAllPosts();
                },
                child: BlocBuilder<AllPostListCubit, Result<List<PostModel>>>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.error != null) {
                      return Center(
                        child: Text(state.error.toString()),
                      );
                    }
                    if (state.data != null) {
                      final postImage = state.data?.map((e) => e.images).expand((e)=> e!).toList() ?? [];
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of columns
                          childAspectRatio: 1,
                        ),
                        itemCount: postImage.length,
                        itemBuilder: (BuildContext context, int index) {
                          final post = postImage[index];
                          return InkWell(
                            onTap: (){
                              showDialog(  context: context, builder: (BuildContext context) { 
                                return PostWidget(post: state.data!,);
                               });
                            },
                            child: Card(
                              elevation: 0,
                              color: Colors.white,
                              child: AspectRatio(
                                aspectRatio: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    post.localPath ?? "",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
