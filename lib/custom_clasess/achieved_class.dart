import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AchievedTasksProgress extends StatelessWidget {
  final int completedTasks;
  final int totalTasks;

  const AchievedTasksProgress({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (totalTasks > 0 ? completedTasks / totalTasks : 0.0);
    int percentage = (progress * 100).toInt();

    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xff282828), borderRadius: BorderRadius.circular(20),),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
            'Achieved Tasks',
            style: TextStyle(
              color: Color(0xffFFFCFC),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
                    ), 
                    Text(
            '$completedTasks out of $totalTasks Done',
            style: const TextStyle(
              color: Color(0xffC6C6C6),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
                    ),
              ],
            ),
          ),
          SizedBox(width: 140,),
          CircularPercentIndicator(radius: 26, lineWidth: 5.0,
              percent: progress,
               animation: true, animationDuration: 1200, circularStrokeCap: CircularStrokeCap.round,
              center: Text('$percentage%', style: TextStyle( color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,),),
              progressColor: Color(0xff15B86C),),
        ],
      )
    );
  }
}