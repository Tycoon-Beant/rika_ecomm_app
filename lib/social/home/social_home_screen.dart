import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rika_ecomm_app/config/common.dart';
import 'package:rika_ecomm_app/model/result.dart';
import 'package:rika_ecomm_app/screens/Widgets/async_widget.dart';
import 'package:rika_ecomm_app/social/post_cubit/all_post_list_cubit.dart';
import 'package:rika_ecomm_app/social/home/model/all_post_model.dart';
import 'package:rika_ecomm_app/social/message/messages_screen.dart';
import 'package:rika_ecomm_app/social/post_cubit/post_cubit.dart';
import 'package:rika_ecomm_app/social/profile/user_profile.dart';

class SocialHomeScreen extends StatefulWidget {
  const SocialHomeScreen({super.key});

  @override
  State<SocialHomeScreen> createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          "Rika Social",
          style: context.theme.headlineMedium!
              .copyWith(fontFamily: FontFamily.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                
              },
              child: Icon(Icons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UserProfile()));
                },
                child: Image.asset(
                  "assets/social_media/3x/user.png",
                  scale: 2,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MessagesScreen()));
                },
                child: Image.asset(
                  "assets/social_media/3x/message.png",
                  scale: 2,
                )),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [FriendsStories()],
          ),
          // const SizedBox(height: 20),
          BlocListener<AllPostListCubit, Result<List<PostModel>>>(
            listener: (context, state) {
              if(state.data != null){
              //  context.read<AllPostListCubit>().updatePosts(state.data!);
              }
              
            },
            child:
                Expanded(child: AsyncWidget<AllPostListCubit, List<PostModel>>(
              data: (post) {
                final postData = post ?? [];
                if (post != null) {
                  return PostWidget(
                    post: postData,
                  );
                } else {
                  return Center(
                    child: Text(
                        "No Post available. \n Please check your internet \n Refresh Page/revisit page"),
                  );
                }
              },
            )),
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});
  final List<PostModel> post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView.builder(
        itemCount: post.length,
        itemBuilder: (BuildContext context, int index) {
          final postItem = post[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          color: const Color.fromARGB(255, 219, 218, 218),
                          spreadRadius: 2,
                          blurRadius: 2),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                foregroundColor: Color(0xff128C7E),
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    postItem.author?.account?.avatar?.url ??
                                        ""),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                  '${postItem.author?.firstName} ${postItem.author?.lastName}',
                                  style: context.theme.titleLarge),
                              Expanded(child: SizedBox()),
                              IconButton(
                                icon: Icon(Icons.more_vert_outlined),
                                onPressed: () {
                                  showCustomBottomSheet(context, postItem);
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Divider(
                            height: 2,
                            color: const Color.fromARGB(255, 220, 218, 218),
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: AspectRatio(
                                  aspectRatio: 4 / 5,
                                  child: Image.network(
                                    postItem.images?.first.localPath ?? '',
                                    fit: BoxFit.cover,
                                  ))),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              children: [
                                Text(
                                    '${postItem.author?.firstName} ${postItem.author?.lastName}',
                                    style: context.theme.bodyLarge!
                                        .copyWith(fontFamily: FontFamily.w700)),
                                const SizedBox(width: 10),
                                Text(
                                  postItem.content!,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.theme.bodyLarge!.copyWith(
                                    color: Color.fromRGBO(56, 56, 56, 0.8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Icon(Icons.favorite_outline),
                              const SizedBox(width: 10),
                              Text(
                                postItem.likes.toString(),
                                style: context.theme.bodyLarge!.copyWith(
                                  color: Color.fromRGBO(56, 56, 56, 0.8),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Image.asset("assets/social_media/3x/comment.png"),
                              const SizedBox(width: 10),
                              Text(
                                postItem.comments.toString(),
                                style: context.theme.bodyLarge!.copyWith(
                                  color: Color.fromRGBO(56, 56, 56, 0.8),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                DateFormat.yMMMd().format(postItem.createdAt!),
                                style: context.theme.bodyMedium!.copyWith(
                                    color: const Color.fromARGB(
                                        255, 188, 187, 187)),
                              )
                            ],
                          )
                        ]),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}

List stories = [
  "",
  "assets/social_media/person1.png",
  "assets/social_media/person2.png",
  "assets/social_media/person3.png",
  "assets/social_media/person4.png",
  "assets/social_media/person1.png",
  "assets/social_media/person2.png",
  "assets/social_media/person3.png",
  "assets/social_media/person4.png",
];

class FriendsStories extends StatelessWidget {
  const FriendsStories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 100,
        width: 410,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: stories.length,
          itemBuilder: (BuildContext context, int index) {
            // Special case for index 1
            if (index == 0) {
              return Row(
                children: const [
                  UserStorie(), // Custom widget for user story
                  SizedBox(width: 10),
                ],
              );
            }

            // Default story item
            return Row(
              children: [
                Container(
                  width: 80, // Adjust as needed
                  height: 80, // Adjust as needed
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 4),
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        stories[index],
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(width: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}

class UserStorie extends StatelessWidget {
  const UserStorie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: DottedBorder(
        color: Colors.black, // Border color
        strokeWidth: 4, // Border width
        dashPattern: [8, 3], // Dotted pattern (length and gap)
        borderType: BorderType.RRect, // Rounded rectangle border
        radius: const Radius.circular(12), // Border radius
        child: Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            child: Icon(
              Icons.add,
              size: 40,
            )),
      ),
    );
  }
}

void showCustomBottomSheet(BuildContext context, PostModel post) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Wraps the content
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Image.asset(
                    "assets/social_media/3x/heart-slash.png",
                    scale: 2,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Hide Likes',
                    style: context.theme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.remove_circle_outline_outlined,
                    size: 38,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Turn off comments',
                    style: context.theme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    size: 35,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Edit',
                    style: context.theme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                context.read<PostCubit>().deletePost(postId: post.id!);
                Navigator.of(context).pop();
                context.read<AllPostListCubit>().getAllPosts();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red,
                    size: 35,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Delete',
                    style: context.theme.bodyLarge!.copyWith(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
