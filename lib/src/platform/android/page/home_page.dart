import 'package:flutter/material.dart';
import 'package:portfolio/src/service/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: ServiceLocator.worker.responseStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('${snapshot.data}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
