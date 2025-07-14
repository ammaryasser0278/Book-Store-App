import 'package:book_store_app/core/utils/services_locator.dart';
import 'package:book_store_app/features/home_feature/data/models/book_model/book_model.dart';
import 'package:book_store_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_store_app/features/home_feature/presentation/views/book_details_view.dart';
import 'package:book_store_app/features/home_feature/presentation/views/home_view.dart';
import 'package:book_store_app/features/search_feature/presentation/views/search_view.dart';
import 'package:book_store_app/features/splash_feature/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.screenRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.screenRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: BookDetailsView.screenRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: SearchView.screenRoute,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
