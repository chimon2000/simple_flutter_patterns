import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/services/posts.dart';

class Result {
  final bool isLoading;
  final String error;
  final Map<String, dynamic> post;

  Result({
    this.isLoading,
    this.error,
    this.post,
  });
}

typedef BuilderFn = Widget Function(BuildContext context, Result result);

class FuturePostBuilder extends StatefulWidget {
  final BuilderFn builder;

  FuturePostBuilder({this.builder});

  @override
  _FuturePostBuilderState createState() => _FuturePostBuilderState();
}

class _FuturePostBuilderState extends State<FuturePostBuilder> {
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
    return widget.builder(
        context,
        Result(
          isLoading: isLoading,
          error: error,
          post: post,
        ));
  }
}
