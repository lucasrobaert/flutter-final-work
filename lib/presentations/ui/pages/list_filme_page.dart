import 'package:final_work/domain/entities/movie_entity.dart';
import 'package:final_work/presentations/controller/movie_controller.dart';
import 'package:final_work/presentations/ui/widgets/custom_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ListFilmPage extends StatefulWidget {
  const ListFilmPage({super.key});

  @override
  State<ListFilmPage> createState() => _ListFilmPageState();
}

class _ListFilmPageState extends State<ListFilmPage> {
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            ValueListenableBuilder<MovieEntity?>(
              valueListenable: _controller.movies,
              builder: (__, movies, _) {
                return Visibility(
                  visible: movies != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Movies',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.withOpacity(0.05),
                              Colors.grey.withOpacity(0.15),
                              Colors.grey.withOpacity(0.05),
                            ],
                            stops: const [0, 7, 1],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: _controller.onChanged,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  fillColor: Colors.white30,
                                  focusColor: Colors.white30,
                                  hoverColor: Colors.white30,
                                ),
                                cursorColor: Colors.white30,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            ValueListenableBuilder<MovieEntity?>(
              valueListenable: _controller.movies,
              builder: (_, movies, __) {
                return movies != null
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: movies.listMovies.length,
                        itemBuilder: (_, idx) => CustomListCardWidget(
                          movie: movies.listMovies[idx],
                        ),
                        separatorBuilder: (_, __) => const Divider(),
                      )
                    : const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
