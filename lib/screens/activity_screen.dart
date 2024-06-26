import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:mobile_bl/screens/payment_table.dart';

class ActivityPage extends StatefulWidget {
  final String idUser;

  const ActivityPage({Key? key, required this.idUser}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

Future<List<Map<String, dynamic>>> fetchActivities(String idUser) async {
  final response = await http.get(Uri.parse('http://cuebilliard.my.id/projek_api/get_activity.php?iduser=$idUser'));

  if (response.statusCode == 200) {
    List<dynamic> jsonResponse = json.decode(response.body);
    print('Response Body: $jsonResponse'); // Tambahkan print statement untuk respons API

    // Mapping data dari API ke dalam struktur yang sesuai
    List<Map<String, dynamic>> activities = jsonResponse.map((item) {
      print('Processing item: $item'); // Tambahkan print statement untuk setiap item

      return {
        'title': item['nm'], // Sesuaikan dengan struktur data di API
        'description': 'Jam Main: ${item['jam_sewa']}', // Deskripsi statis, bisa diganti dengan data dari API jika ada
        'imagePath': 'http://cuebilliard.my.id/projek_api/image/${item['foto']}', // Sesuaikan dengan struktur data di API
        'price': item['tot'], // Sesuaikan dengan struktur data di API
        'status': item['status'], // Sesuaikan dengan struktur data di API // Sesuaikan dengan struktur data di API
        'idsewa': item['idsewa'], // Sesuaikan dengan struktur data di API // Sesuaikan dengan struktur data di API
      };
    }).toList();
    print('Fetched activities: $activities'); // Tambahkan print statement untuk daftar kegiatan yang diambil
    return activities;
  } else {
    throw Exception('Failed to load activities');
  }
}

class _ActivityPageState extends State<ActivityPage> {
  int _selectedTab = 0;
  List<Map<String, dynamic>> allActivities = [];

  @override
  void initState() {
    super.initState();
    fetchActivities(widget.idUser).then((activities) {
      setState(() {
        allActivities = activities;
      });
      print(
          'Initialized allActivities: $allActivities'); // Tambahkan logging di sini
    }).catchError((error) {
      print('Error fetching activities: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ID User: ${widget.idUser}');

    final screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> displayedActivities = _selectedTab == 0
        ? allActivities
        : allActivities
            .where((activity) =>
                activity['status'] ==
                (_selectedTab == 1 ? 'Belum Bayar' : 'Dikonfirmasi'))
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Activity!',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05,
                ),
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt.',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/data/latar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenWidth * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ChoiceChip(
                        label: Text('All'),
                        selected: _selectedTab == 0,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTab = 0;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ChoiceChip(
                        label: Text('Belum Bayar'),
                        selected: _selectedTab == 1,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTab = 1;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ChoiceChip(
                        label: Text('Dikonfirmasi'),
                        selected: _selectedTab == 2,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedTab = 2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.02),
                Expanded(
  child: ListView.builder(
    itemCount: displayedActivities.length,
    itemBuilder: (context, index) {
      return _buildActivityCard(
        context,
        displayedActivities[index]['title'],
        displayedActivities[index]['description'],
        displayedActivities[index]['imagePath'],
        displayedActivities[index]['price'],
        displayedActivities[index]['status'],
        displayedActivities[index]['idsewa'],
      );
    },
  ),
),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(BuildContext context, String title,
    String description, String imagePath, String price, String status, String idsewa) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Card(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      leading:
          Image.network(imagePath, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(
        title,
        style: TextStyle(fontSize: screenWidth * 0.04), // Ukuran font responsif
      ),
      subtitle: Text(
        description,
        style: TextStyle(fontSize: screenWidth * 0.03), // Ukuran font responsif
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(price,
              style: TextStyle(
                  color: Colors.orange, fontWeight: FontWeight.bold)),
          if (status == 'Belum Bayar')
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentTablePage(
                          items: [
                            CartItem(
                              name: title,
                              price: int.parse(price),
                              quantity: 1,
                              image: imagePath,
                              description: description,
                              idsewa: idsewa,
                            )
                          ],
                          idUser : widget.idUser
                      )),
                );
              },
              
              child: Text(
                'Belum Bayar',
                style: TextStyle(color: Colors.red,),
              ),
            ),
          if (status == 'Dikonfirmasi')
            Text(
              'Dikonfirmasi',
              style: TextStyle(color: Colors.green),
            ),
          if (status == 'Menunggu')
            Text(
              'Menunggu',
              style: TextStyle(color: Colors.blue),
            ),
        ],
      ),
    ),
  );
}
}