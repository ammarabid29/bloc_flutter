import 'package:bloc_flutter/switch_app/bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchView extends StatelessWidget {
  const SwitchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch View")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previos, current) =>
                      previos.isSwitchOn != current.isSwitchOn,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitchOn,
                      onChanged: (value) {
                        context.read<SwitchBloc>().add(
                          ToggleNotificationsEvent(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(state.sliderValue),
                );
              },
            ),

            SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(
                      SliderEvent(sliderValue: value),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
