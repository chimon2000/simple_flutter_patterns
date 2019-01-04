import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/services/posts.dart';

typedef LoadingBuilderFn = Widget Function(
  BuildContext context,
);
typedef PostBuilderFn = Widget Function(
  BuildContext context,
  Map<String, dynamic> post,
);
typedef ErrorBuilderFn = Widget Function(
  BuildContext context,
  String error,
);

class FuturePostBuilder extends StatefulWidget {
  final LoadingBuilderFn loadingBuilder;
  final PostBuilderFn postBuilder;
  final ErrorBuilderFn errorBuilder;

  FuturePostBuilder({
    this.postBuilder,
    this.loadingBuilder,
    this.errorBuilder,
  });

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
    if (isLoading) {
      return widget.loadingBuilder(context);
    } else if (post != null) {
      return widget.postBuilder(context, post);
    } else {
      return widget.errorBuilder(context, error);
    }
  }
}
