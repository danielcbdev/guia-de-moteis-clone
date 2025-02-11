import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guia_de_moteis_clone/core/config/custom_http_client.dart';
import 'package:guia_de_moteis_clone/guia_de_moteis.dart';
import 'package:guia_de_moteis_clone/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  InjectionContainer.setup();

  ///TODO - Usado apenas para poder fazer requisições HTTP em ambiente de desenvolvimento
  HttpOverrides.global = CustomHttpOverrides();

  runApp(const GuiaDeMoteis());
}
