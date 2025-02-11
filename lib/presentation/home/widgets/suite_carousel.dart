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
  final double _carouselHeight = 900;

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
            _buildImageWidget(suite: suite),
            const SizedBox(height: 2),
            _buildItems(suite: suite),
            const SizedBox(height: 2),
            _buildPeriods(suite: suite),
          ],
        );
      },
    );
  }

  Widget _buildImageWidget({required Suites suite}) {
    return _buildCardWidget(
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
            child: Column(
              children: [
                AutoSizeText(
                  suite.nome ?? '',
                  style: const TextStyle(fontSize: 18),
                  minFontSize: 18,
                  textAlign: TextAlign.center,
                ),
                if ((suite.exibirQtdDisponiveis ?? false) && suite.qtd != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: AppTheme.errorColor,
                        size: 12,
                      ),
                      AutoSizeText(
                        "só mais ${suite.qtd} pelo app",
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.errorColor,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItems({required Suites suite}) {
    return _buildCardWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: (suite.categoriaItens ?? []).take(3).map((item) {
                return Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppTheme.grayLightColor,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: item.icone ?? '',
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => _showModalItems(suite: suite),
              child: Row(
                children: [
                  AutoSizeText(
                    "ver\ntodos",
                    textAlign: TextAlign.end,
                    minFontSize: 10,
                    maxFontSize: 10,
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriods({required Suites suite}) {
    return Column(
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

  void _showModalItems({required Suites suite}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                ),
              ),
              const SizedBox(height: 40),
              AutoSizeText(
                suite.nome ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      "principais itens",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Wrap(
                children: (suite.categoriaItens ?? []).map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl: item.icone ?? '',
                          fit: BoxFit.cover,
                          height: 40,
                        ),
                        const SizedBox(width: 2),
                        AutoSizeText(
                          item.nome ?? '',
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      "tem também",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppTheme.grayColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              AutoSizeText(
                (suite.itens ?? []).map((item) => item.nome).join(', '),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
