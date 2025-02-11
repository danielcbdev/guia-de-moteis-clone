import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_event.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_state.dart';

class MotelsScreen extends StatefulWidget {
  const MotelsScreen({super.key});

  @override
  State<MotelsScreen> createState() => _MotelsScreenState();
}

class _MotelsScreenState extends State<MotelsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MotelBloc>(context).add(FetchMotels());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MotelBloc, MotelState>(
          builder: (context, state) {
            if (state is MotelLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MotelErrorState) {
              return const Center(
                child: AutoSizeText(
                  'Erro ao carregar motéis',
                ),
              );
            } else if (state is MotelsLoadedState) {
              return Center(child: Text("Motels loaded"));
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
