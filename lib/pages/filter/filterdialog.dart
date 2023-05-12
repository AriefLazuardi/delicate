import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  final List<String> filters;
  final List<String> selectedfilter;

  FilterDialog({
    required this.filters,
    required this.selectedfilter,
  });

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> filters = [
    'Semua Kategori',
    'Makanan',
    'Aneka nasi',
    'Ayam',
    'Sapi',
    'Sayuran',
    'Bakso',
    'Aneka Minuman',
  ];
  List<String> _selectedFilter = [];

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.selectedfilter;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: widget.filters.map((filters) {
            return CheckboxListTile(
              title: Text(filters),
              value: _selectedFilter.contains(filters),
              onChanged: (value) {
                setState(() {
                  if (value != null && value) {
                    _selectedFilter.add(filters);
                  } else {
                    _selectedFilter.remove(filters);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, _selectedFilter);
          },
          child: Text('Terapkan'),
        ),
        
      ],
      
    );
  }
}
