import 'package:crud_with_clean_architecture/features/Post/data/models/post.dart';
import 'package:crud_with_clean_architecture/features/Post/presentation/provider/post_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class GetPosts extends StatefulWidget {
  const GetPosts({Key? key}) : super(key: key);

  @override
  State<GetPosts> createState() => _GetPostsState();
}

class _GetPostsState extends State<GetPosts> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      print('hello');

      Provider.of<PostProvider>(context, listen: false).fetchPosts();

      // print(Provider.of<PostProvider>(context, listen: false).posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (ctx, postProvider, child) {
      print(postProvider.posts.length);
      if (postProvider.loadingState == PostLoadingState.fetchingAll) {
        return Center(child: CircularProgressIndicator());
      }
      return Container(
        // color: Colors.red,
        height: 500.0,
        child: ListView.builder(
            // scrollDirection: Axis.vertical,
            itemCount: postProvider.posts.length,
            itemBuilder: (context, index) {
              Post post = postProvider.posts[index];

              return ListTile(
                title: Text(
                  post.title,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }),
      );
    });
  }
}
