import 'package:flutter/material.dart';
import 'package:twenty_four_game/begin_screen.dart';
import 'file:///C:/Users/john1/AndroidStudioProjects/twenty_four_game/lib/onboarding/onboarding.dart';
import 'package:twenty_four_game/time_up.dart';
import 'package:twenty_four_game/transitions.dart';
import './home.dart';
import './time_trial.dart';
import './normal.dart';
import './how_to_play.dart';
import './csv_reader.dart';
import 'themes/styles.dart';

const MainColor = const Color.fromRGBO(207, 232, 255, 1.0);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async {
        await Database.fetchVenueDatabase().then((result) {
          Normal().build(context);
        });
      },
      child: MaterialApp(
        theme: AppTheme(),
        home: HomeTwo(),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return FadeRoute(page: HomeTwo());
              break;
            case '/normal':
              return FadeRoute(page: Normal());
              break;
            case '/time_trial':
              return FadeRoute(page: TimeTrial());
              break;
            case '/begin_screen1':
              return MaterialPageRoute(builder: (context) => BeginScreen('/time_trial'));
              break;
            case '/begin_screen2':
              return MaterialPageRoute(builder: (context) => BeginScreen('/normal'));
              break;
            case '/time_up':
              return FadeRoute(page: AnimationStation());
              break;
            case '/previous_q':
              return FadeRoute(page: AnsweredQuestions());
              break;
            case '/how_to_play':
              return FadeRoute(page: HowToPlay());
              break;
          }
          return MaterialPageRoute(builder: (context) => HomeTwo());
        },
      ),
    );
  }
}

class StatefulWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;
  const StatefulWrapper({@required this.onInit, @required this.child});
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}
class _StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if(widget.onInit != null) {
      widget.onInit();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
