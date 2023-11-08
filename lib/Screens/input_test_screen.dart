import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTestScreen extends StatefulWidget {
  const InputTestScreen({super.key});

  @override
  State<InputTestScreen> createState() => _InputTestScreenState();
}

class _InputTestScreenState extends State<InputTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Test Screen'),
      ),
      body: const Column(
        children: [
          CheckBoxTest(),
          CheckBoxTest(),
          CheckBoxTest(),
          CheckBoxTest(),
          RadioButtonTest(),
          RadioButtonTest(),
          SliderTest(),
          SwitchTest(),
        ],
      ),
    );
  }
}

class CheckBoxTest extends StatefulWidget {
  const CheckBoxTest({super.key});

  @override
  State<CheckBoxTest> createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  late List<bool> values;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: values[0], onChanged: (value) => onChanged(0, value: value)),
        Checkbox(
            value: values[1], onChanged: (value) => onChanged(1, value: value)),
        Checkbox(
            value: values[2], onChanged: (value) => onChanged(2, value: value)),
      ],
    );
  }

  void onChanged(int index, {bool? value = false}) {
    setState(() {
      values[index] = value!;
    });
  }
}

enum TestValues {
  r1,
  r2,
  r3,
}

class RadioButtonTest extends StatefulWidget {
  const RadioButtonTest({super.key});

  @override
  State<RadioButtonTest> createState() => _RadioButtonTestState();
}

class _RadioButtonTestState extends State<RadioButtonTest> {
  TestValues? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<TestValues>(
            value: TestValues.r1,
            groupValue: selectedValue,
            onChanged: (value) => setState(() {
              selectedValue = value;
            })),
        Radio<TestValues>(
            value: TestValues.r2,
            groupValue: selectedValue,
            onChanged: (value) => setState(() {
              selectedValue = value;
            })),
        Radio<TestValues>(
            value: TestValues.r3,
            groupValue: selectedValue,
            onChanged: (value) => setState(() {
              selectedValue = value;
            })),
      ],
    );
  }
}

class SliderTest extends StatefulWidget {
  const SliderTest({super.key});

  @override
  State<SliderTest> createState() => _SliderTestState();
}

class _SliderTestState extends State<SliderTest> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$value'),
        Slider(
            value: value,
            onChanged: (newValue) => setState(() => value = newValue),
          label: value.round().toString(),
          divisions: 100,
          max: 100,
          min: 0,
        ),
      ],
    );
  }
}

class SwitchTest extends StatefulWidget {
  const SwitchTest({super.key});

  @override
  State<SwitchTest> createState() => _SwitchTestState();
}

class _SwitchTestState extends State<SwitchTest> {
  late List<bool> values;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Switch(value: values[0], onChanged: (value) => onChanged(0, value: value)),
            CupertinoSwitch(value: values[0], onChanged: (value) => onChanged(0, value: value)),
          ],
        ),
        Column(
          children: [
            Switch(value: values[1], onChanged: (value) => onChanged(1, value: value)),
            CupertinoSwitch(value: values[1], onChanged: (value) => onChanged(1, value: value)),
          ],
        ),
        Column(
          children: [
            Switch(value: values[2], onChanged: (value) => onChanged(2, value: value)),
            CupertinoSwitch(value: values[2], onChanged: (value) => onChanged(2, value: value)),
          ],
        ),
      ],
    );
  }

  void onChanged(int index, {bool? value = false}) {
    setState(() {
      values[index] = value!;
    });
  }
}
