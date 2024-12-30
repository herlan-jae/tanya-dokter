import 'package:flutter/material.dart';

class PrescriptionField extends StatefulWidget {
  const PrescriptionField({super.key});

  @override
  State<PrescriptionField> createState() => _PrescriptionField();
}

class _PrescriptionField extends State<PrescriptionField> {
  final List<String> medicines = ['Paracetamol', 'Amoxicillin', 'Ibuprofen'];
  final List<String> dose = ['1x sehari', '2x sehari', '3x sehari'];
  final List<String> time = ['Sebelum Makan', 'Sesudah Makan'];

  String? selectedMed;
  String? selectedDose;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: SizedBox(
              height: 40.0,
              child: DropdownButtonFormField<String>(
                value: selectedMed,
                decoration: InputDecoration(
                  hintText: 'Pilih opsi',
                  hintStyle:
                      const TextStyle(fontSize: 12.0, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                ),
                items: medicines.map((obat) {
                  return DropdownMenuItem(
                    value: obat,
                    child: Text(
                      obat,
                      style: const TextStyle(
                          fontSize: 12.0, overflow: TextOverflow.ellipsis),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Selected Medicine: $value');
                  setState(() {
                    selectedMed = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            flex: 2,
            child: SizedBox(
              height: 40.0,
              child: DropdownButtonFormField<String>(
                value: selectedDose,
                decoration: InputDecoration(
                  hintText: 'Pilih opsi',
                  hintStyle:
                      const TextStyle(fontSize: 12.0, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                ),
                items: dose.map((obat) {
                  return DropdownMenuItem(
                    value: obat,
                    child: Text(
                      obat,
                      style: const TextStyle(
                          fontSize: 12.0, overflow: TextOverflow.ellipsis),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Selected Dose: $value');
                  setState(() {
                    selectedDose = value;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            flex: 2,
            child: SizedBox(
              height: 40.0,
              child: DropdownButtonFormField<String>(
                value: selectedTime,
                decoration: InputDecoration(
                  hintText: 'Pilih opsi',
                  hintStyle:
                      const TextStyle(fontSize: 12.0, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                ),
                items: time.map((obat) {
                  return DropdownMenuItem(
                    value: obat,
                    child: Text(
                      obat,
                      style: const TextStyle(
                          fontSize: 12.0, overflow: TextOverflow.ellipsis),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  print('Selected Time: $value');
                  setState(() {
                    selectedTime = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
