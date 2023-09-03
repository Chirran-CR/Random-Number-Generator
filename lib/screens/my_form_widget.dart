import 'package:flutter/material.dart';
// import 'package:random_number_generator/screens/input_taking_screen.dart';


typedef IntFunctionVal = void Function(int val);

class MyFormWidget extends StatelessWidget {

  final IntFunctionVal intFnValMin;
  final IntFunctionVal intFnValMax;

  const MyFormWidget({
    super.key,
    required this.formKey,
    required this.intFnValMin,
    required this.intFnValMax,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    print("val of fn is: $intFnValMax");
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyTextFormWidget(
              labelTextData: "min",
              onSavedFunction: intFnValMin,
            ),
            const SizedBox(height: 12),
            MyTextFormWidget(
              labelTextData: "max",
              onSavedFunction: intFnValMax,
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "check",
                border: OutlineInputBorder(),
              ),
              // onSaved: (newValue) => min = int.parse(newValue.toString()),
            )
          ],
        ),
      ),
    );
  }
}

class MyTextFormWidget extends StatelessWidget {
  final String labelTextData;
  // final void Function(int val) onSavedFunction;
  final IntFunctionVal onSavedFunction;

  const MyTextFormWidget({
    super.key,
    required this.labelTextData,
    required this.onSavedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        // hintText: "Min Number",
        labelText: labelTextData,
      ),
      // validator: (value) => ,
      validator: (value) {
        // if(value == null || int.tryParse(value) == null){//correct, or also the below syntax
                  if(int.tryParse(value!) == null){
          return "Element must be an Integer";
        }else{
          return null;
        }
      },
      onSaved: (newVal) => onSavedFunction(int.parse(newVal!)),
    );
  }
}
