import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_clone/core/config/app_theme.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_state.dart';
import 'package:guia_de_moteis_clone/presentation/home/widgets/motel_informations.dart';
import 'package:guia_de_moteis_clone/presentation/home/widgets/suite_carousel.dart';

class GoNow extends StatefulWidget {
  const GoNow({super.key});

  @override
  State<GoNow> createState() => _GoNowState();
}

class _GoNowState extends State<GoNow> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MotelBloc, MotelState>(
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
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'zona norte',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppTheme.backgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Column(
                            children: (state.motelsResponse.data?.moteis ?? []).map((motel) {
                              return Column(
                                children: [
                                  MotelInformations(motel: motel),
                                  const SizedBox(height: 20),
                                  SuiteCarousel(suites: motel.suites ?? []),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return const Center();
        },
      );
  }
}