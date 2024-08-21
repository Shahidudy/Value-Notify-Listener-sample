import 'package:flutter/material.dart';

class ValueNotifyListenerSample extends StatelessWidget {
  ValueNotifyListenerSample({super.key});

  //AT FIRST NEED TO CREATE AN OBJECT OF VALUENOTIFYLISTENER
  final ValueNotifier<String> myValue = ValueNotifier<String>('');

  //CONTROLLER OF TEXTFORMFIELD
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Center(child: Text('Value Notify Listener')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    label: Text('Enter your new Value')),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
              valueListenable: myValue,
              builder: (context, myValue, child) {
                return Container(
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(' $myValue'));
              }),
          ElevatedButton(
            onPressed: () {
              //CHANGING OLD VALUE WITH NEW VALUE
              myValue.value = myController.text;

              //CLEAR THE FORM FIELD AFTER ENTERING THE VALUE
              myController.clear();
            },
            child: const Text(
              'click to Change',
            ),
          ),
        ],
      ),
    );
  }
}
