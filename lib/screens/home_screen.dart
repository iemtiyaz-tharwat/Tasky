import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky/custom_clasess/achieved_class.dart';
import 'package:tasky/provider/motivation_quote_controller.dart';
import 'package:tasky/provider/theme_provider.dart';
import 'package:tasky/provider/user_name_controller.dart';
import 'package:tasky/screens/add_task.dart';
import 'package:tasky/provider/custom_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasky/customWidgets/custom_text_style.dart';
import 'package:tasky/screens/profile_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserNameProvider>(context).userName ?? '';
    final motivationQuote = Provider.of<MotivationQuoteProvider>(
      context,
    ).motivationQuote;
    return Consumer<NewTaskController>(
      builder: (context, NewTaskController newTaskController, child) {
        return Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 42,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfileScreen();
                              },
                            ),
                          );
                        },
                        icon: Icon(Icons.person, color: Theme.of(context).colorScheme.primaryFixed),
                      ),
                      Center(
                        child: SizedBox(
                        width: 251,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good Morning, $userName",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.onPrimaryFixed,
                                //fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "$motivationQuote",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      )
                      
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<ThemeProvider>().toggleTheme();
                        },
                        icon: Icon(
                          context.watch<ThemeProvider>().isDark
                              ? Icons.light_mode 
                              : Icons.dark_mode, 
                        ),
                      ),
                    ],
                  ),
                  if (newTaskController.newTasks.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RichText(
                        //New one, should be re studied!!!
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 32,
                            color: Theme.of(context).colorScheme.onPrimaryFixed,
                          ),
                          children: [
                            const TextSpan(
                              text: "Yuhuu, Your work Is almost done! ",
                            ),

                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: SvgPicture.asset(
                                'assets/images/hand.svg',
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                    ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Consumer<NewTaskController>(
                      builder: (context, newTaskController, child) {
                       
                        final allTasks = newTaskController.newTasks;
                        int totalTasks = newTaskController.newTasks.length;
                       final completedTasks = allTasks.where((task) => task.isCompleted).toList();
                        final highPriorityTasksList = allTasks
                            .where((task) => task.isHighPriority)
                            .toList();
                        final notHighPriorityTasksList = allTasks
                            .where((task) => !task.isHighPriority)
                            .toList();
                        if (newTaskController.newTasks.isEmpty) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("No tasks yet. Add one!", style: TextStyle(fontSize: 16,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).colorScheme.onSecondaryFixed
                                  ),)
                                
                              ),
                            ],
                          );
                        }
                        return Expanded(
                          child: Column(
                            children: [
                                AchievedTasksProgress(totalTasks: totalTasks , completedTasks: completedTasks.length,),
                              SizedBox(height: 10,),
                              Expanded(
                                child: ListView(
                                  children: [
                                    if (highPriorityTasksList.isNotEmpty) ...[
                                      Container(
                                        width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.secondaryContainer,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Theme.of(context).colorScheme.onSecondaryContainer )
                                        ),
                                        child: Column(
                                        
                                          children: [
                                            Row(children: [const Text(
                                              "High Priority Tasks",
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                color: Color(0xff15B86C),
                                              ),
                                            ),
                                            ],),
                                            const SizedBox(height: 8),
                                            ...highPriorityTasksList
                                                  .map(
                                                    (task) => ListTile(
                                                      contentPadding: EdgeInsets.zero,
                                                      leading: Checkbox(
                                                        value: task.isCompleted,
                                                        activeColor: Color(
                                                          0xff15B86C,
                                                        ),
                                                        checkColor: Theme.of(context).colorScheme.secondaryContainer,
                                                        onChanged: (value) {
                                                          context
                                                              .read< NewTaskController >().taskCompletion(task, value,
                                                              );
                                                        },
                                                        
                                                      ),
                                                      title: Text(
                                                        task.taskName.toString(),
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 16,
                                                          color: task.isCompleted? Theme.of(context).colorScheme.primaryFixedDim : Theme.of(context).colorScheme.primaryFixed,
                                                          fontWeight: FontWeight.w600,
                                                          decoration: task.isCompleted
                                                              ? TextDecoration
                                                                    .lineThrough
                                                              : TextDecoration.none,
                                                          decorationColor: Theme.of(context).colorScheme.primaryFixedDim,
                                          decorationThickness: 2,
                                                        ),
                                                      ),
                                                      subtitle: Text(
                                                        task.taskDescription
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontSize: 13,
                                                          color: task.isCompleted? Theme.of(context).colorScheme.primaryFixedDim : Theme.of(context).colorScheme.onSecondaryFixed,
                                                          fontWeight: FontWeight.w600,
                                                          decoration: task.isCompleted
                                                              ? TextDecoration
                                                                    .lineThrough
                                                              : TextDecoration.none,
                                                          decorationColor: Theme.of(context).colorScheme.primaryFixedDim,
                                          decorationThickness: 2,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  ,
                                            
                                          ],
                                        ),
                                      ),
                                      
                                      const SizedBox(height: 24),
                                    ],
                                    if (notHighPriorityTasksList.isNotEmpty) ...[
                                       Text("My Tasks", style: TextStyle(fontSize: 21,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).colorScheme.onPrimaryFixed
                                        ),),
                                      
                                      const SizedBox(height: 24),
                                      ListView.separated(
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: notHighPriorityTasksList.length,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(height: 12),
                                        itemBuilder: (context, index) {
                                          final task = notHighPriorityTasksList[index];
                                          return Container(
                                            decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.secondaryContainer,
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Theme.of(context).colorScheme.onSecondaryContainer )
                                        ),
                                
                                            child: ListTile(
                                              leading: Checkbox(
                                                value: task.isCompleted,
                                                activeColor: Color(0xff15B86C),
                                                checkColor: Theme.of(context).colorScheme.secondaryContainer,
                                                onChanged: (value) {
                                                  context
                                                      .read<NewTaskController>()
                                                      .taskCompletion(task, value);
                                                },
                                              ),
                                
                                              title: Text(
                                                        task.taskName.toString(),
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 16,
                                                          color: task.isCompleted? Theme.of(context).colorScheme.primaryFixedDim : Theme.of(context).colorScheme.primaryFixed,
                                                          fontWeight: FontWeight.w600,
                                                          decoration: task.isCompleted
                                                              ? TextDecoration
                                                                    .lineThrough
                                                              : TextDecoration.none,
                                                          decorationColor: Theme.of(context).colorScheme.primaryFixedDim,
                                          decorationThickness: 2,
                                                        ),
                                                      ),
                                              subtitle: Text(
                                                task.taskDescription.toString(),
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 13,
                                                  color: task.isCompleted? Theme.of(context).colorScheme.primaryFixedDim : Theme.of(context).colorScheme.onSecondaryFixed,
                                                  fontWeight: FontWeight.w600,
                                                  decoration: task.isCompleted
                                                      ? TextDecoration.lineThrough
                                                      : TextDecoration.none,
                                                  decorationColor: Theme.of(context).colorScheme.primaryFixedDim,
                                          decorationThickness: 2,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ],
                                  
                                ),
                              ),
                            ],
                          ),
                        );
                        
                      },
                      
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddTaskScreen();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                      label: CustomTextStyle(
                        text: 'Add New Task',
                        fontSize: 17,
                        fontFamily: "Poppins",
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color(0xff15B86C),
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
