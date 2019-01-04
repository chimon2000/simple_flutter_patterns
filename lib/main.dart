import 'package:flutter/material.dart';
import 'package:simple_flutter_patterns/pages/branch_builder_props.dart';
import 'package:simple_flutter_patterns/pages/builder_props.dart';
import 'package:simple_flutter_patterns/pages/container_branch_presenter.dart';
import 'package:simple_flutter_patterns/pages/container_presenter.dart';
import 'package:simple_flutter_patterns/pages/vanilla.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter Patterns',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Simple Flutter Patterns'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: mapRoutesToButtons(context, routes),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> routes = [
  {
    'buttonText': 'Vanilla',
    'builder': () => VanillaPage(),
  },
  {
    'buttonText': 'Container/Presenter',
    'builder': () => ContainerPresenterPage(),
  },
  {
    'buttonText': 'Container/Branch/Presenter',
    'builder': () => ContainerBranchPresenterPage(),
  },
  {
    'buttonText': 'Builder Props',
    'builder': () => BuilderPropsPage(),
  },
  {
    'buttonText': 'Branch Builder Props',
    'builder': () => BranchBuilderPropsPage(),
  },
];

List<Widget> mapRoutesToButtons(context, List<Map<String, dynamic>> routes) {
  return routes.map((Map<String, dynamic> pageInfo) {
    Widget Function() buildPage = pageInfo['builder'];
    String buttonText = pageInfo['buttonText'];

    return FlatButton(
      child: Text(buttonText),
      onPressed: () {
        Navigator.push(
          context,
          new MaterialPageRoute(
            builder: (context) {
              return buildPage();
            },
          ),
        );
      },
    );
  }).toList();
}
