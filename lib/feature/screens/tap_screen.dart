import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/services/services.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movies_bloc.dart';
import 'package:moviesapp/feature/Movies/presentation/controller/movies_events.dart';
import 'package:moviesapp/feature/Movies/presentation/screens/movies_screen.dart';
import 'package:moviesapp/feature/search/presentation/controller/search_bloc.dart';
import 'package:moviesapp/feature/search/presentation/screen/search_screen.dart';
import 'package:moviesapp/feature/tvs/presentation/controller/tv_bloc.dart';

import '../tvs/presentation/screens/tv_screen.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  int _selectPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      BlocProvider(
        create: (context) => sl<MoviesBloc>()
          ..add(GetNowPlayingMoviesEvent())
          ..add(GetPopularMoviesEvent())
          ..add(GetTopRatedMoviesEvent()),
        child: const MoviesScreen(),
      ),
      BlocProvider(
        create: (context) => sl<TvBloc>()
          ..add(GetOnAirTvEvent())
          ..add(GetPopularTvEvent())
          ..add(GetTopRatedTvEvent()),
        child: const TvScreen(),
      ),
      BlocProvider(
        create: (context) => sl<SearchBloc>(),
        child: const SearchScreen(query: ''),
      ),
    ];
    return Scaffold(
      body: pages[_selectPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined), label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
