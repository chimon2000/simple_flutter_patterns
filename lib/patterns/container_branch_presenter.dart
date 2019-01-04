import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/services/posts.dart';

class PostContainer extends StatefulWidget {
  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  bool isLoading = true;
  String error;
  Map<String, dynamic> post;

  @override
  void initState() {
    super.initState();

    fetchPost().then((json) {
      setState(() {
        post = json;
        isLoading = false;
      });
    }).catchError((err) {
      setState(() {
        error = err;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PostBranch(
      isLoading: isLoading,
      post: post,
      error: error,
    );
  }
}

class PostBranch extends StatelessWidget {
  final bool isLoading;
  final String error;
  final Map<String, dynamic> post;

  PostBranch(
      {@required this.isLoading, @required this.error, @required this.post});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Loading();
    } else if (post != null) {
      return Post(post: post);
    } else {
      return Error(error: error);
    }
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Loading...'),
    );
  }
}

class Post extends StatelessWidget {
  final Map<String, dynamic> post;
  Post({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        post['title'],
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String error;
  Error({this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("I'm sorry! Please try again."),
    );
  }
}
