import 'package:flutter/material.dart';
import '../plan_provider.dart';
import './plan_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Master Plans')),
      body: Column(
        children: <Widget>[
          _buildListCreator(),
          Expanded(
              child: _buildMasterPlans(),
          ),
        ]
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  Widget _buildListCreator() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Theme.of(context).cardColor,
          elevation: 10,
          child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                  labelText: 'Add a plan',
                  contentPadding: EdgeInsets.all(20)
              ),
              onEditingComplete: addPlan
          ),
        )
    );
  }

  void addPlan() {
    final text = textController.text;
    // All the business logic has been removed from this 'view' method!
    final controller = PlanProvider.of(context);
    controller.addNewPlan(text);

    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
    });
  }

  Widget _buildMasterPlans() {

    final plans = PlanProvider.of(context).plans;

    if (plans.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.note, size: 100, color: Colors.grey),
            Text('You do not have any plans yet.',
            style: Theme.of(context).textTheme.headline5)
          ]
      );
    }

    return ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return Dismissible(
            key: ValueKey(plan),
            background: Container(
                color: Colors.red,
                child: const Center(
                    child: Text('Delete', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
            ),
            direction: DismissDirection.endToStart,

            child: ListTile(
                title: Text(plan.name),
                subtitle: Text(plan.completenessMessage),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PlanScreen(plan: plan)));
                }
            ),

            onDismissed: (_) {
              final controller = PlanProvider.of(context);
              controller.deletePlan(plan);
              setState(() {
              });
            },

          );
        }
    );

  }

}