import 'package:alter_theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mudança de tema"),
      ),
      body: const ThemeSelector(),
    );
  }
}

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return RadioListTile(
              title: Text('Light'),
              value: ThemeMode.light,
              groupValue: state,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
            );
          },
        ),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            return RadioListTile(
              title: Text('Dark'),
              value: ThemeMode.dark,
              groupValue: state,
              onChanged: (value) {
                context.read<ThemeCubit>().toggleTheme();
              },
            );
          },
        ),
      ],
    );
  }
}
