import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:adv_basics/summaryitem.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summarydata, {super.key});
  final List<Map<String, Object>> summarydata;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
