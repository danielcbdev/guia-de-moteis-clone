import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guia_de_moteis_clone/core/config/app_theme.dart';
import 'package:guia_de_moteis_clone/domain/usecases/get_motels_usecase.dart';
import 'package:guia_de_moteis_clone/injection_container.dart';
import 'package:guia_de_moteis_clone/presentation/home/blocs/motel_bloc.dart';
import 'package:guia_de_moteis_clone/presentation/home/screens/motels_screen.dart';

class GuiaDeMoteis extends StatelessWidget {
  const GuiaDeMoteis({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MotelBloc>(
          create: (context) => MotelBloc(getMotelsUseCase: InjectionContainer.instance<GetMotelsUseCase>()),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: const MotelsScreen(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt'),
        ],
      ),
    );
  }
}
