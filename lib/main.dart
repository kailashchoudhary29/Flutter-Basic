import 'package:flutter/material.dart';
import "package:dynamic_theme/dynamic_theme.dart";

void main() => runApp(DynamicThemeAppDemo());

class DynamicThemeAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "App Theme",
          theme: theme,
          home: DynamicWidget(),
        );
      },
    );
  }
}

class DynamicWidget extends StatefulWidget {
  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Theme Demo"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Normal Mode"),
              onPressed: () {
                DynamicTheme.of(context).setThemeData(ThemeData(
                  primaryColor: Theme.of(context).primaryColor == Colors.indigo
                      ? Colors.pink
                      : Colors.indigo,
                  buttonColor: Theme.of(context).buttonColor == Colors.grey
                      ? Colors.pink
                      : Colors.grey,
                ));
              },
            ),
            RaisedButton(
              child: Text("Dark Mode"),
              onPressed: () {
                DynamicTheme.of(context).setBrightness(
                  Theme.of(context).brightness == Brightness.light
                      ? Brightness.dark
                      : Brightness.light,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
