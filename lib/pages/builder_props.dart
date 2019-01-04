import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/patterns/builder_props.dart';

//In a page far far away...

class BuilderPropsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Builder Props'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: FuturePostBuilder(
          builder: (
            context,
            result,
          ) {
            if (result.isLoading) {
              return Loading();
            } else if (result.post != null) {
              return Post(post: result.post);
            } else {
              return Error(error: result.error);
            }
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
