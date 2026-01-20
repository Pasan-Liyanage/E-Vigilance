import 'package:flutter/material.dart';
import 'report_data.dart';

class AdditionalDetailsPage extends StatefulWidget {
  final ReportData reportData;
  const AdditionalDetailsPage({super.key, required this.reportData});

  @override
  State<AdditionalDetailsPage> createState() => _AdditionalDetailsPageState();
}

class _AdditionalDetailsPageState extends State<AdditionalDetailsPage> {
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF0074D9);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Additional Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Please describe any other details'),
            const SizedBox(height: 8),
            Expanded(
              child: TextField(
                controller: _detailsController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: 'Optional – write a short note if needed.',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: blue),
                  onPressed: () {
                    widget.reportData.additionalDetails =
                        _detailsController.text;

                    // TODO: send to backend / Firebase etc.
                    // For now just print to console.
                    // ignore: avoid_print
                    print(widget.reportData.toString());

                    // Return to home screen
                    Navigator.popUntil(
                      context,
                      (route) =>
                          route.settings.name == '/home' || route.isFirst,
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
