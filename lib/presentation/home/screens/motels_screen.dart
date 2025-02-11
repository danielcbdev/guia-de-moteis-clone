import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guia_de_moteis_clone/core/config/app_theme.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_event.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_state.dart';
import 'package:guia_de_moteis_clone/presentation/home/widgets/suite_carousel.dart';

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
      backgroundColor: AppTheme.primaryColor,
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
      body: BlocBuilder<MotelBloc, MotelState>(
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
                  child: AutoSizeText('zona norte'),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(99),
                                          child: CachedNetworkImage(
                                            imageUrl: motel.logo!,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AutoSizeText(
                                                motel.fantasia ?? '',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                ),
                                                minFontSize: 18,
                                                maxLines: 1,
                                                overflow: TextOverflow.fade,
                                              ),
                                              AutoSizeText(
                                                motel.bairro ?? '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      border: Border.all(
                                                        color: AppTheme.yellowColor,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: AppTheme.yellowColor,
                                                          size: 12,
                                                        ),
                                                        const SizedBox(width: 4),
                                                        AutoSizeText(
                                                          (motel.media ?? '').toString().replaceAll(".", ","),
                                                          style: const TextStyle(),
                                                          minFontSize: 10,
                                                          maxFontSize: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Row(
                                                    children: [
                                                      AutoSizeText(
                                                        '${motel.qtdAvaliacoes} avaliações',
                                                        style: const TextStyle(),
                                                        minFontSize: 10,
                                                        maxFontSize: 10,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Icon(
                                                        Icons.keyboard_arrow_down_rounded,
                                                        size: 12,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.favorite_rounded,
                                          color: AppTheme.grayColor,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ),
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
