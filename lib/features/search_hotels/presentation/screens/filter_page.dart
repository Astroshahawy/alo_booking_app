import 'package:flutter/material.dart';

import '../widgets/home_widget.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: const SearchWidget(),
    );
  }
}
