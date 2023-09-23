import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventDetails extends StatefulWidget {
  final String id;

  const EventDetails({super.key, required this.id});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool _isLoading = false; //todo:make it true
  List<dynamic> details = [];

  @override
  void initState() {
    super.initState();
    fetchEventDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomSheet:  BottomAppBar(
        elevation:0,
        child: Container(
          height: 181,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.00, -1.00),
              end: const Alignment(0, 1),
              colors: [Colors.white.withOpacity(0), Colors.blue],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Event Details'),
        actions: const [Icon(Icons.save)],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          :Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 244,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'International Band Music Concert',
                    style: TextStyle(fontSize: 35, color: Colors.black),
                  ),
                  const CustomTile(),
                  const SizedBox(height: 15),
                  const Text('About Events',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  Text('id = ${widget.id}',
                      style: const TextStyle(fontSize: 16, color: Colors.black)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void fetchEventDetails() async {
    final url =
        'https://sde-007.api.assignment.theinternetfolks.works/v1/event/${widget.id}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
       details = json['content']['data'];
      _isLoading = false;
    });
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: ShapeDecoration(
              color: const Color(0xFF5668FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            children: [
              Text(
                "Title",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Text(
                "Dec..",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
