
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String dateTime;
  final String bannerImg;
  final String venue;
  final String city;
  final String country;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.bannerImg,
    required this.venue,
    required this.city,
    required this.country,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
        width: MediaQuery.of(context).size.width,
        height: 106,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0F575C8A),
              blurRadius: 35,
              offset: Offset(0, 10),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius:
                    const BorderRadiusDirectional.all(Radius.circular(10)),
                child: Image.network(
                    height: 92, width: 80, fit: BoxFit.cover, bannerImg),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dateTime,
                    style: const TextStyle(color: Colors.black),
                  ),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Text(
                        "$venue . $city , $country",
                        overflow: TextOverflow.clip,
                        style: const TextStyle(color: Colors.black, fontSize: 7),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
