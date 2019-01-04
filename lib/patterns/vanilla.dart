import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/services/posts.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
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
