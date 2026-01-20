import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color blue = Color(0xFF0074D9);

    // Dummy reports list – add as many as you like
    final reports = [
      ReportItem(
        id: '#CM1342',
        status: 'In Progress',
        statusColor: blue,
        complaint: 'Parked illegally',
        vehicle: 'Car',
        date: '10.09.2025',
      ),
      ReportItem(
        id: '#CM997',
        status: 'Completed',
        statusColor: Colors.green,
        complaint: 'Reckless driving',
        vehicle: 'Bus',
        date: '10.07.2025',
      ),
      ReportItem(
        id: '#CM872',
        status: 'Completed',
        statusColor: Colors.green,
        complaint: 'Parked illegally',
        vehicle: 'Car',
        date: '10.09.2025',
      ),
      // extra dummy items to show scrolling
      ReportItem(
        id: '#CM555',
        status: 'In Progress',
        statusColor: blue,
        complaint: 'Dangerous overtaking',
        vehicle: 'Three-wheeler',
        date: '02.08.2025',
      ),
      ReportItem(
        id: '#CM421',
        status: 'Rejected',
        statusColor: Colors.red,
        complaint: 'Noise pollution',
        vehicle: 'Motorcycle',
        date: '29.07.2025',
      ),
    ];

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
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: reports.length + 1, // +1 for the title at top
        itemBuilder: (context, index) {
          if (index == 0) {
            // Top title
            return Column(
              children: const [
                SizedBox(height: 8),
                Text(
                  'Reports',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
              ],
            );
          }

          final item = reports[index - 1];
          return _ReportCard(item: item);
        },
      ),
    );
  }
}

class ReportItem {
  final String id;
  final String status;
  final Color statusColor;
  final String complaint;
  final String vehicle;
  final String date;

  ReportItem({
    required this.id,
    required this.status,
    required this.statusColor,
    required this.complaint,
    required this.vehicle,
    required this.date,
  });
}

class _ReportCard extends StatelessWidget {
  final ReportItem item;
  const _ReportCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // id + status pill
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.id,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: item.statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.status,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const _LabelText('Complaint'),
            Text(
              item.complaint,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const _LabelText('Vehicle'),
            Text(
              item.vehicle,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const _LabelText('Date'),
            Text(
              item.date,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1),
            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: open detailed report page
                },
                child: const Text(
                  'More info',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String text;
  const _LabelText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
