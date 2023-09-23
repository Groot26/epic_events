import 'dart:convert';
import 'package:epic_events/views/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import 'eventDetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> events = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Events",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                final title = event["title"];
                final dateTime = event["date_time"];
                final img = event["banner_image"];
                final venue = event["venue_name"];
                final city = event["venue_city"];
                final country = event["venue_country"];
                return EventCard(
                  title: title,
                  dateTime: dateTime,
                  bannerImg: img,
                  venue: venue,
                  city: city,
                  country: country,
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          EventDetails(id: event["id"].toString()),
                    ),
                  ),
                );
              }),
    );
  }

  void fetchEvents() async {
    const url =
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;

    final json = jsonDecode(body);

    setState(() {
      events = json['content']['data'];
      _isLoading = false;
    });
    //print(events);
  }
}
