import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.list_alt),
              label: Text('todo List'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('setting'),
            ),
          ],

          selectedIndex: 0,
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          onDestinationSelected: (selectedIndex) {
            setState(() {
              _selectedIndex = selectedIndex;
            });
          },
        ),
        Expanded(child: MainContent(selectedIndex: _selectedIndex)),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  final int selectedIndex;
  const MainContent({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        return Center(child: Text('main todolist view'));
      case 1:
        return Center(child: Text('settings page'));
      default:
        return Placeholder();
    }
  }
}
