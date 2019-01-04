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
    return Post(
      isLoading: isLoading,
      post: post,
      error: error,
    );
  }
}

class Post extends StatelessWidget {
  final bool isLoading;
  final String error;
  final Map<String, dynamic> post;

  Post({@required this.isLoading, @required this.error, @required this.post});

  renderLoading() {
    return Center(
      child: Text('Loading...'),
    );
  }

  renderError() {
    return Center(
      child: Text("I'm sorry! Please try again."),
    );
  }

  renderPost() {
    return Center(
      child: Text(
        post['title'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return renderLoading();
    } else if (post != null) {
      return renderPost();
    } else {
      return renderError();
    }
  }
}
