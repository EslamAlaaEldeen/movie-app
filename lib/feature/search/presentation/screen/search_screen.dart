import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/feature/search/presentation/components/results.dart';
import 'package:moviesapp/feature/search/presentation/controller/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  final String query;
  const SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Movies or TV Shows',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        _searchController.clear();
                        context
                            .read<SearchBloc>()
                            .add(const GetSearchEvent(''));
                      },
                    ),
                  ),
                  onChanged: (value) {
                    context.read<SearchBloc>().add(GetSearchEvent(value));
                  },
                ),
                const ResultsComponents(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
