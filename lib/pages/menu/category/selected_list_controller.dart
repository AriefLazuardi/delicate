class Filter {
  int filterId;
  String category;

  Filter({required this.filterId, required this.category});

  static List<Filter> getFilters() {
    return <Filter>[
      Filter(filterId: 1, category: "Semua Kuliner"),
      Filter(filterId: 2, category: "Makanan"),
      Filter(filterId: 3, category: "Aneka nasi"),
      Filter(filterId: 4, category: "Ayam"),
      Filter(filterId: 5, category: "Sapi"),
      Filter(filterId: 6, category: "Sayuran"),
      Filter(filterId: 7, category: "Bakso"),
      Filter(filterId: 8, category: "Aneka minuman"),
    ];
  }
}
