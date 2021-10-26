import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _subText = 'Subscribe';
const bool _isSub = false;

class AlbumPage extends StatelessWidget {
  final dynamic song;
  const AlbumPage({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
      return SizedBox(
        height: viewportConstraints.maxHeight,
        child: SingleChildScrollView(
            child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: size.width,
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(song?.img), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(song.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      ElevatedButton(
                        // ignore: prefer_const_constructors
                        child: Text(
                          _subText,
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (_isSub) {
                                return Colors.grey;
                              } else {
                                return Colors.blueAccent;
                              }
                            },
                          ),
                        ),
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 30),
                //     child: Row(
                //       children: List.generate(song.length, (index) {
                //         return Padding(
                //           padding: const EdgeInsets.only(right: 30),
                //           child: GestureDetector(
                //             onTap: () {},
                //             child: Column(
                //               children: [
                //                 Container(
                //                   width: 180,
                //                   height: 180,
                //                   decoration: BoxDecoration(
                //                       image: DecorationImage(
                //                           image:
                //                               NetworkImage(song.img.toString()),
                //                           fit: BoxFit.cover),
                //                       color: Colors.blueAccent,
                //                       borderRadius: BorderRadius.circular(10)),
                //                 ),
                //                 const SizedBox(
                //                   height: 20,
                //                 ),
                //                 Text(song.title.toString(),
                //                     style: const TextStyle(
                //                       fontSize: 15,
                //                       fontWeight: FontWeight.w600,
                //                     )),
                //                 const SizedBox(
                //                   height: 5,
                //                 ),
                //                 SizedBox(
                //                     width: size.width - 210,
                //                     child: Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         Text(song.songCount.toString(),
                //                             maxLines: 1,
                //                             textAlign: TextAlign.center,
                //                             style: const TextStyle(
                //                               fontSize: 12,
                //                               color: Colors.grey,
                //                               fontWeight: FontWeight.w600,
                //                             )),
                //                         Text(song.date.toString(),
                //                             maxLines: 1,
                //                             textAlign: TextAlign.center,
                //                             style: const TextStyle(
                //                               fontSize: 12,
                //                               color: Colors.grey,
                //                               fontWeight: FontWeight.w600,
                //                             )),
                //                       ],
                //                     ))
                //               ],
                //             ),
                //           ),
                //         );
                //       }),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 30,
                // ),
                // Column(
                //     children: List.generate(song.last.songs!.length, (index) {
                //   return Padding(
                //     padding:
                //         const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                //     child: GestureDetector(
                //       onTap: () {},
                //       child: Row(
                //         children: [
                //           SizedBox(
                //             width: (size.width - 60) * 0.77,
                //             child: Text(
                //               '${index + 1}' +
                //                   song.songs![index].title.toString(),
                //             ),
                //           ),
                //           SizedBox(
                //               width: (size.width - 60) * 0.23,
                //               height: 50,
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text(
                //                     song.songs![index].duration.toString(),
                //                     style: const TextStyle(
                //                         color: Colors.grey, fontSize: 14),
                //                   ),
                //                   Container(
                //                     width: 25,
                //                     height: 25,
                //                     decoration: BoxDecoration(
                //                       shape: BoxShape.circle,
                //                       color: Colors.grey.withOpacity(0.8),
                //                     ),
                //                     child: const Center(
                //                       child: Icon(
                //                         Icons.play_arrow,
                //                         size: 16,
                //                       ),
                //                     ),
                //                   )
                //                 ],
                //               )),
                //         ],
                //       ),
                //     ),
                //   );
                // }))
              ],
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.add,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        )),
      );
    });
  }
}
