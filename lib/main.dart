import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newsbuster/src/bookmark_db.dart';
import 'package:newsbuster/src/notifiers/article_list_model.dart';
import 'package:newsbuster/src/screens/app_tour/app_initial_tour.dart';
import 'package:provider/provider.dart';
import 'package:sentry/sentry.dart';
import 'dsn.dart';

MyDatabase db;


/// Sentry Configuration Starts here ///

// See Also : https://flutter.dev/docs/cookbook/maintenance/error-reporting
// Example for the configuration is present at :
// https://github.com/flutter/crashy/blob/master/lib/main.dart

final SentryClient _sentry = new SentryClient(dsn: dsn);

/// Whether the VM is running in debug mode.
///
/// This is useful to decide whether a report should be sent to sentry. Usually
/// reports from dev mode are not very useful, as these happen on developers'
/// workspaces rather than on users' devices in production.
bool isInDebugMode = false;

/// Reports [error] along with its [stackTrace] to Sentry.io.
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
    print('Caught error: $error');

    // Errors thrown in development mode are unlikely to be interesting. You can
    // check if you are running in dev mode using an assertion and omit sending
    // the report.
    if (isInDebugMode) {
        print(stackTrace);
        print('In dev mode. Not sending report to Sentry.io.');
        return;
    }

    print('Reporting to Sentry.io...');

    final SentryResponse response = await _sentry.captureException(
        exception: error,
        stackTrace: stackTrace,
    );

    if (response.isSuccessful) {
        print('Success! Event ID: ${response.eventId}');
    } else {
        print('Failed to report to Sentry.io: ${response.error}');
    }
}

Future<Null> main() async {
    // This captures errors reported by the Flutter framework.
    db = MyDatabase();
    FlutterError.onError = (FlutterErrorDetails details) async {
        if (isInDebugMode) {
            // In development mode simply print to console.
            FlutterError.dumpErrorToConsole(details);
        } else {
            // In production mode report to the application zone to report to
            // Sentry.
            Zone.current.handleUncaughtError(details.exception, details.stack);
        }
    };

    // This creates a [Zone] that contains the Flutter application and stablishes
    // an error handler that captures errors and reports them.
    //
    // Using a zone makes sure that as many errors as possible are captured,
    // including those thrown from [Timer]s, microtasks, I/O, and those forwarded
    // from the `FlutterError` handler.
    //
    // More about zones:
    //
    // - https://api.dartlang.org/stable/1.24.2/dart-async/Zone-class.html
    // - https://www.dartlang.org/articles/libraries/zones
    runZonedGuarded<Future<Null>>(() async {
        runApp(new MyApp());
    }, (error, stackTrace) async {
        await _reportError(error, stackTrace);
    });
}

/// Sentry Configuration Ended here ///





class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return ArticleListModel();
        },),

        Provider(
            create: (BuildContext context){
                return db;
            },
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          applyElevationOverlayColor:true,
        ),
        home: AppInitialTour(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
