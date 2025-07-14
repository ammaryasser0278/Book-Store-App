import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/services_locator.dart';
import 'package:book_store_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_store_app/features/home_feature/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const BookStore());
}

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestbooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Book Store',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff100B20),
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
