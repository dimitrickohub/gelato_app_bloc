import 'package:flutter/material.dart';

class Album extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  const Album(
      {required this.img,
      required this.title,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 180,
            child: Text(
              description.toString(),
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
