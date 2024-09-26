import 'package:actors_gallery/approuter.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ActorsGalley(
    appRouter: AppRouter(),
  ));
}

class ActorsGalley extends StatelessWidget {
  final AppRouter appRouter;

  const ActorsGalley({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
