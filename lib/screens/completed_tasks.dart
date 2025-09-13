import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/provider/custom_provider.dart';

class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NewTaskController>(
      builder: (context, NewTaskController controller, child) {
        return Center(
          child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Completed Tasks", style: Theme.of(context).textTheme.displayLarge,)
                        
                      ],
                    ),
                  ),
                  Consumer<NewTaskController>(
                    builder: (context, controller, child) {
                      final completedTasks = controller.newTasks.where((task) => task.isCompleted).toList();
                           if (controller.newTasks.isEmpty || completedTasks.isEmpty) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("No tasks yet. Add one!", style: Theme.of(context).textTheme.labelMedium,)
                                 
                              ),
                            ],
                          );
                        }
                      return Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 12),
                                itemCount: completedTasks.length,
                                itemBuilder: (context, index) {
                                  final task = completedTasks[index];
                                  return Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Theme.of(context).colorScheme.onSecondaryContainer )
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 5,),
                                        Checkbox(
                                        value: task.isCompleted,
                                        activeColor: Color(0xff15B86C),
                                        onChanged: (value) {
                                          context
                                              .read<NewTaskController>()
                                              .taskCompletion(task, value);
                                        },
                                        checkColor: Theme.of(context).colorScheme.secondaryContainer,
                                      ),
                                      SizedBox(width: 10,),
                                      Text(
                                        task.taskName.toString(),
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 17,
                                          color: task.isCompleted
                                              ? Theme.of(context).colorScheme.primaryFixedDim
                                              : null,
                                          fontWeight: FontWeight.w600,
                                          decoration: task.isCompleted
                                              ? TextDecoration.lineThrough
                                              : null,
                                          decorationColor: Theme.of(context).colorScheme.primaryFixedDim,
                                          decorationThickness: 2,
                                        ),
                                      ),
                                      ],
                                    )
                                  );
                                },
                                
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
                );
  }
    );
}

}