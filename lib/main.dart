import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GajiPegawai(),
    );
  }
}

class GajiPegawai extends StatefulWidget {
  const GajiPegawai({super.key});

  @override
  State<GajiPegawai> createState() => _GajiPegawaiState();
}

class _GajiPegawaiState extends State<GajiPegawai> {
  TextEditingController kodeController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController gajiController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  double bonus = 0.0;
  double tunjangan = 0.0;
  double totalGaji = 0.0;

  void hitungGaji() {
    double gaji = double.tryParse(gajiController.text) ?? 0.0;
    String status = statusController.text.toLowerCase();

    //Menghitung bonus (10% dari gaji)
    bonus = 0.1 * gaji;
    tunjangan = status == 'menikah' ? 0.08 * gaji : 0.05 * gaji;

    //Menghitung total gaji
    totalGaji = gaji + bonus + tunjangan;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Gaji Pegawai"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: kodeController,
              decoration: const InputDecoration(labelText: 'Kode Pegawai'),
            ),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Pegawai'),
            ),
            TextField(
              controller: gajiController,
              decoration: const InputDecoration(labelText: 'Gaji Pegawai'),
            ),
            TextField(
              controller: statusController,
              decoration:
                  const InputDecoration(labelText: 'Status (menikah/tidak)'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                hitungGaji();
              },
              child: const Text('Hitung Gaji'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Bonus: $bonus'),
            Text('Tunjangan: $tunjangan'),
            Text('Total Gaji: $totalGaji'),
          ],
        ),
      ),
    );
  }
}
