import 'package:flutter/material.dart';

class WidgetDrawer extends StatefulWidget {
  const WidgetDrawer({super.key, required this.title, required this.body});

  final PreferredSizeWidget title;
  final Widget body;

  @override
  State<WidgetDrawer> createState() => _WidgetDrawerState();
}

class _WidgetDrawerState extends State<WidgetDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: widget.title,
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: const Text(
                  'Home',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'info');
                },
                child: const Text(
                  'Info',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'list');
                },
                child: const Text(
                  'List',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
        ),
      ),
      body: widget.body,
    );
  }
}
