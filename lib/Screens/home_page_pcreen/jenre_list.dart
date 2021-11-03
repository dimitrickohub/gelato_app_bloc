import 'package:flutter/material.dart';

class JenreList extends StatefulWidget {
  const JenreList({required this.songType, Key? key}) : super(key: key);
  final List<String> songType;
  @override
  State<JenreList> createState() => _JenreListState();
}

class _JenreListState extends State<JenreList> {
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            widget.songType.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        activeMenu = index;
                      },
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.songType[index],
                        style: TextStyle(
                            fontSize: 15,
                            color: activeMenu == index
                                ? Colors.blueAccent
                                : Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      activeMenu == index
                          ? Container(
                              width: 10,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
