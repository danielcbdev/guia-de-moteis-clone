import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis_clone/core/config/app_theme.dart';
import 'package:guia_de_moteis_clone/core/utils/extensions.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';

class SuiteCarousel extends StatefulWidget {
  const SuiteCarousel({super.key, required this.suites});
  final List<Suites> suites;

  @override
  State<SuiteCarousel> createState() => _SuiteCarouselState();
}

class _SuiteCarouselState extends State<SuiteCarousel> {
  final double _carouselHeight = 1700;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.suites.length,
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: false,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        height: _carouselHeight,
      ),
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final suite = widget.suites[itemIndex];

        return Column(
          children: [
            _buildCardWidget(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: suite.fotos?.first ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    child: AutoSizeText(
                      suite.nome ?? '',
                      style: const TextStyle(fontSize: 18),
                      minFontSize: 18,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: (suite.periodos ?? []).map((periodo) {
                
                return _buildCardWidget(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                periodo.tempoFormatado ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                minFontSize: 18,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                              if (periodo.valor != null)
                                AutoSizeText(
                                  periodo.valor!.toMoney,
                                  style: const TextStyle(fontSize: 16),
                                  minFontSize: 18,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCardWidget({required Widget child}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: AppTheme.grayColor.withOpacity(0.5),
            blurRadius: 1,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
