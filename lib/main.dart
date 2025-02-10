import 'package:flutter/material.dart';
import 'package:guia_de_moteis_clone/guia_de_moteis.dart';
import 'package:guia_de_moteis_clone/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  InjectionContainer.setup();

  runApp(const GuiaDeMoteis());
}