import 'package:flutter/material.dart';
import 'package:gelato_app_bloc/BLoC/songs_bloc.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/json/song_types.dart';

const String homePage = 'Home Page';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeMenu1 = 0;

  int activeMenu2 = 2;

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      appBar: getAppBar() as PreferredSizeWidget?,
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongsJson?> snapshot) {
          if (snapshot.hasData) {
            return buildLists(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: prefer_const_constructors
              Text(
                homePage,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         alignment: Alignment.topRight,
                    //         child: const SettingsPage(),
                    //         type: PageTransitionType.scale),);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLists(AsyncSnapshot<SongsJson?> snapshot) {
    dynamic songs = snapshot.data;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(song_type_1.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  activeMenu1 = index;
                                },
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song_type_1[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: activeMenu1 == index
                                          ? Colors.blueAccent
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                activeMenu1 == index
                                    ? Container(
                                        width: 10,
                                        height: 3,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(songs.result!.length - 5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     PageTransition(
                            //         alignment: Alignment.bottomCenter,
                            //         child: AlbumPage(
                            //           song: songs.result![index],
                            //         ),
                            //         type: PageTransitionType.scale));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            songs.result![index].img!),
                                        fit: BoxFit.cover),
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(songs.result![index].title!.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  )),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                    songs.result![index].description!
                                        .toString(),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(song_type_2.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                activeMenu2 = index;
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  song_type_2[index],
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: activeMenu2 == index
                                          ? Colors.blueAccent
                                          : Colors.grey,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                activeMenu2 == index
                                    ? Container(
                                        width: 10,
                                        height: 3,
                                        decoration: BoxDecoration(
                                            color: Colors.blueAccent,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        );
                      })),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: List.generate(
                      songs.result!.length - 5,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     PageTransition(
                              //         alignment: Alignment.bottomCenter,
                              //         child: AlbumPage(
                              //           song: songs.result![index + 5],
                              //         ),
                              //         type: PageTransitionType.scale));
                            },
                            child: Column(
                              children: [
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              songs.result![index + 5].img!),
                                          fit: BoxFit.cover),
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(songs.result![index + 5].title!.toString(),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 180,
                                  child: Text(
                                      songs.result![index + 5].description
                                          .toString(),
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      )),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
