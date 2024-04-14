// import 'package:bookly/core/utils/service_app_locater.dart';
// import 'package:bookly/feauters/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
// import 'package:bookly/feauters/Search/presentation/views/search_view.dart';
// import 'package:bookly/feauters/Splash/presentation/views/splash_view.dart';
// import 'package:bookly/feauters/Home/presentation/views/book_details_view.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../feauters/Home/data/models/book_model/book_model.dart';
// import '../../feauters/Home/data/repos/home_repo_impl.dart';
// import '../../feauters/Home/presentation/views/home_view.dart';

import 'package:go_router/go_router.dart';
import 'package:taxi_app/views/add%20fules/view/add_fules_view.dart';
import 'package:taxi_app/views/add%20fules/view/fules_transaction_view.dart';
import 'package:taxi_app/views/add%20icome/add_income_view.dart';
import 'package:taxi_app/views/add%20icome/all_incomes_view.dart';
import 'package:taxi_app/views/add%20maintiance/add_maintinance_view.dart';
import 'package:taxi_app/views/add%20maintiance/all_maintainacne_view.dart';
import 'package:taxi_app/views/home%20page/view/home_page_view.dart';
import 'package:taxi_app/views/statstics/views/statstics_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homePage';
  static const kAddIncome = '/addIncome';
  static const kAddMiantinance = '/addMiantinance';
  static const kAddFuleView = '/addFule';
  static const kFulesTransaction = '/fuelsTransactionView';
  static const kAllIncomeView = '/allIncomeView';
  static const kAllMaintinanceView = '/allMaintainanceView';
  static const kStatsticView = '/statsticsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePageView(),
      ),
      GoRoute(
        path: kAddIncome,
        builder: (context, state) => const AddIcomeView(),
      ),
      GoRoute(
        path: kAddFuleView,
        builder: (context, state) => const AddFule(),
      ),
      GoRoute(
        path: kAddMiantinance,
        builder: (context, state) => const AddMaintinance(),
      ),

      GoRoute(
        path: kFulesTransaction,
        builder: (context, state) => const FuelsTransactionView(),
      ),
      GoRoute(
        path: kAllIncomeView,
        builder: (context, state) => const AllIncomeView(),
      ),

      GoRoute(
        path: kAllMaintinanceView,
        builder: (context, state) => const AllMaintainanceView(),
      ),

      GoRoute(
          path: kStatsticView,
          builder: (context, state) => const StatsticsView()),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => const HomeBage(),
      // ),

      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => const BookDetailsView(),
      // ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(
      //       getIt.get<HomeRepoImpl>(),
      //     ),
      //     child: BookDetailsView(
      //       bookModel: state.extra as BookModel,
      //     ),
      //   ),
      // ),
    ],
  );
}
