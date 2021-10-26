import 'package:flutter/material.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Screens/HomePageScreen/album_view.dart';

import 'package:gelato_app_bloc/json/song_types.dart';

import 'jenre_list.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key? key, required this.snapshot}) : super(key: key);

  final SongsJson snapshot;

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
                          itemCount: widget.snapshot.result!.length - 5,
                          itemBuilder: (context, index) => Album(
                              img: widget.snapshot.result![index].img!,
                              title: widget.snapshot.result![index].title!,
                              description:
                                  widget.snapshot.result![index].description!),
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
                          itemCount: widget.snapshot.result!.length - 5,
                          itemBuilder: (context, index) => Album(
                              img: widget.snapshot.result![index + 5].img!,
                              title: widget.snapshot.result![index + 5].title!,
                              description: widget
                                  .snapshot.result![index + 5].description!),
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
