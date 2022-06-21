import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final ValueNotifier<Color> accentColor;

  const MyHomePage({
    Key? key,
    required this.accentColor,
    required this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isDarkTheme = true;


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: widget.accentColor,
      builder: (_, color, __) {
        final _darkTheme = ThemeData.dark();
        final _lightTheme = ThemeData.light();
        return MaterialApp(
          title: 'App Settings Demo',
          theme: _isDarkTheme
              ? _darkTheme.copyWith(
            colorScheme: _darkTheme.colorScheme.copyWith(
              secondary: color,
            ),
            toggleableActiveColor: color,
          )
              : _lightTheme.copyWith(
            colorScheme: _darkTheme.colorScheme.copyWith(
              secondary: color,
            ),
            toggleableActiveColor: color,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  _buildThemeSwitch(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _buildThemeSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text('Light Theme'),
        Switch(
            activeColor: Theme.of(context).colorScheme.secondary,
            value: _isDarkTheme,
            onChanged: (newVal) {
              _isDarkTheme = newVal;
              setState(() {});
            }),
       const Text('Dark Theme'),
      ],
    );
  }
}


  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }
