import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:random_number_generator/screens/my_form_widget.dart";
import "package:random_number_generator/screens/random_generator_screen.dart";

// typedef IntFunctionVal = void Function(int val);

// ignore: must_be_immutable
class InputTakingScreen extends HookWidget {
  InputTakingScreen({super.key});

  // int min = 0, max = 0;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return Scaffold(
      body: Center(
        child: MyFormWidget(
          formKey: formKey,
          intFnValMin: (val) => min.value = val,
          intFnValMax: (val) => max.value = val,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(formKey.currentState);
          if(formKey.currentState?.validate() == true ){
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  print("val of min $min");
                  print("val of max ${max.value}");
                  return  RandomGeneratorScreen(
                    min: min.value, max:max.value,
                  );
                },
              )
            );
          }
        },
        backgroundColor: Colors.amber[700],
        child: const Icon(
          Icons.calculate,
          // color: Colors.amber,
        ),
      ),
    );
  }
}
