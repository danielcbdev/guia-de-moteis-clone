import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_clone/core/config/app_theme.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_event.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_state.dart';

class MotelsScreen extends StatefulWidget {
  const MotelsScreen({super.key});

  @override
  State<MotelsScreen> createState() => _MotelsScreenState();
}

class _MotelsScreenState extends State<MotelsScreen> {
  int _selectedSegment = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MotelBloc>(context).add(FetchMotels());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Container(
          alignment: Alignment.center,
          child: CupertinoSegmentedControl<int>(
            children: {
              0: _buildSegment(
                value: 0,
                icon: Icons.flash_on_outlined,
                label: 'ir agora',
              ),
              1: _buildSegment(
                value: 1,
                icon: Icons.calendar_month_outlined,
                label: 'ir outro dia',
              ),
            },
            groupValue: _selectedSegment,
            onValueChanged: (int value) {
              setState(() {
                _selectedSegment = value;
              });
            },
            borderColor: AppTheme.primaryColor,
            selectedColor: Colors.white,
            unselectedColor: AppTheme.primaryColorDark,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MotelBloc, MotelState>(
          builder: (context, state) {
            if (state is MotelLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MotelErrorState) {
              return const Center(
                child: AutoSizeText('Erro ao carregar motéis'),
              );
            } else if (state is MotelsLoadedState) {
              return const Center(child: Text("Motels loaded"));
            }
            return const Center();
          },
        ),
      ),
    );
  }

  Widget _buildSegment({
    required int value,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = _selectedSegment == value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected ? AppTheme.primaryColor : Colors.white,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
