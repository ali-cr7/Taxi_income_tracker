//import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taxi_app/cubit/data%20cupit/cubit.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/cubit/income%20chart%20cubit/income_chart_cubit.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
import 'package:taxi_app/utils/router.dart';
// import 'package:taxi_app/views/home%20page/view/home_page_view.dart';

void main() {
  runApp(const MyApp());
}

// void main() {
//   runApp(DevicePreview(
//       enabled: true, builder: (context) => const MyApp()));
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FuelTransactionsCubit()..createDatabase()),
        BlocProvider(create: (context) => IncomeChartCubit()),
        BlocProvider(create: (context) => IncomesCubit()..createDatabase()),
        BlocProvider(
            create: (context) => MaintainanceCubitCubit()..createDatabase()),
        // BlocProvider(create: (context) => IncomesdataCubit()..createDatabase()),
      ],
      child: MaterialApp.router(
        //     locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      ),
    );
  }
}
