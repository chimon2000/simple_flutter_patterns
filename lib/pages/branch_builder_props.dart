import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/patterns/branch_builder_props.dart';

//In a page far far away...

class BranchBuilderPropsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Branching Builder Props'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FuturePostBuilder(
          postBuilder: (context, post) {
            return Post(post: post);
          },
          errorBuilder: (context, error) {
            return Error(error: error);
          },
          loadingBuilder: (context) {
            return Loading();
          },
        ),
      ),
    );
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
