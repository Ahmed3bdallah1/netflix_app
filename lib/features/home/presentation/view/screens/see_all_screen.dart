import 'package:flutter/material.dart';
import 'package:movies_app/Models/saved/saved_model.dart';
import 'package:movies_app/features/home/presentation/view/widgets/see_all_widget.dart';

class SeeAllScreen extends StatelessWidget {
  final String title;
  final List<Result> resultList;

  const SeeAllScreen(
      {super.key, required this.title, required this.resultList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,childAspectRatio: .8),
        itemCount: resultList.length,
        itemBuilder: (context, index) {
          return SeeAllItem(result: resultList[index]);
        },
      ),
    );
  }
}
