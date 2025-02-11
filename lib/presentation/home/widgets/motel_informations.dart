import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_moteis_clone/core/config/app_theme.dart';
import 'package:guia_de_moteis_clone/data/models/moteis_response.model.dart';

class MotelInformations extends StatefulWidget {
  const MotelInformations({super.key, required this.motel});
  final Moteis motel;

  @override
  State<MotelInformations> createState() => _MotelInformationsState();
}

class _MotelInformationsState extends State<MotelInformations> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(99),
            child: CachedNetworkImage(
              imageUrl: widget.motel.logo!,
              width: MediaQuery.of(context).size.width * 0.12,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  widget.motel.fantasia ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  minFontSize: 18,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
                AutoSizeText(
                  widget.motel.bairro ?? '',
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
                            (widget.motel.media ?? '').toString().replaceAll(".", ","),
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
                          '${widget.motel.qtdAvaliacoes} avaliações',
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
    );
  }
}
