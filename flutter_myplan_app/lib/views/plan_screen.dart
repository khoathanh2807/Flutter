import 'package:flutter/material.dart';
import '../models/data_layer.dart';
import '../plan_provider.dart';

class PlanScreen extends StatefulWidget {

  final Plan plan;

  const PlanScreen({Key? key, required this.plan}) : super(key: key);

  @override
  State createState() => _PlanScreenState();

}

class _PlanScreenState extends State<PlanScreen> {

  late ScrollController scrollController;
  Plan get plan => widget.plan;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final plan = PlanProvider.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Task of Plan')),
        body: Column(
            children: <Widget>[
                Expanded(child: _buildList()),
                Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 30),
                    child: Text(plan.completenessMessage),
                ),
            ],
        ),
        floatingActionButton: _buildAddTaskButton()
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Widget _buildAddTaskButton() {
    //final plan = PlanProvider.of(context);
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        final controller = PlanProvider.of(context);
        controller.createNewTask(plan);
        setState(() {
        });
      },
    );
  }

  Widget _buildList() {
    //final plan = PlanProvider.of(context);
    return ListView.builder(
      controller: scrollController,
      itemCount: plan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index]),
    );
  }

  Widget _buildTaskTile(Task task) {

    return Dismissible(

      key: ValueKey(task),
      background: Container(color: Colors.red, child: const Center(child: Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final controller = PlanProvider.of(context);
        controller.deleteTask(plan, task);
        setState(() {
        });
      },

      child: ListTile(

        leading: Checkbox(
            value: task.complete,
            onChanged: (selected) {
              setState(() {
                task.complete = selected as bool;
              });
            }
        ),

        title: TextFormField(
          initialValue: task.description,
          onFieldSubmitted: (text) {
            setState(() {
              task.description = text;
            });
          },
        ),

      ),

    );

  }

}
