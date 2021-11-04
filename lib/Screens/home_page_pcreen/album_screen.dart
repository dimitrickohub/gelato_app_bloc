import 'package:flutter/material.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';

import 'package:gelato_app_bloc/json/song_types.dart';
import 'package:gelato_app_bloc/screens/home_page_pcreen/album_view.dart';

import 'jenre_list.dart';

class AlbumScreen extends StatefulWidget {
  final SongsJson snapshot;
  const AlbumScreen({required this.snapshot, Key? key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late List<Result> resultSongs;
  @override
  void initState() {
    if (widget.snapshot.result != null) {
      resultSongs = widget.snapshot.result!;
    } else {
      resultSongs = [];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const JenreList(
                songType: song_type_1,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 237,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 30,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: resultSongs.length - 5,
                          itemBuilder: (context, index) => Album(
                              img: resultSongs[index].img.toString(),
                              title: resultSongs[index].title.toString(),
                              description:
                                  resultSongs[index].description.toString()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const JenreList(
                songType: song_type_2,
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 237,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 30,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: resultSongs.length - 5,
                          itemBuilder: (context, index) => Album(
                            img: resultSongs[index + 5].img.toString(),
                            title: resultSongs[index + 5].title.toString(),
                            description:
                                resultSongs[index + 5].description.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
