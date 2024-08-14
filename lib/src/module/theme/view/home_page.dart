import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliverList(
        delegate: SliverChildListDelegate(
          [
            const SliverAppBar.medium(),
            SliverList.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${(index + 1) * 10}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
