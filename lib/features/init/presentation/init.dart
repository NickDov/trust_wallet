import 'package:flutter/material.dart';

import '../../widgets/loading_widget.dart';
import 'init_bloc.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends InitBloc {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingWidget(
        child: Icon(
          Icons.shield_outlined,
        ),
      ),
    );
  }
}
