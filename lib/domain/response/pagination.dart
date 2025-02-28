class PaginationMeta {
  final int currentPage;
  final int pageSize;
  final int totalPages;
  final int totalRecords;

  PaginationMeta({
    required this.currentPage,
    required this.pageSize,
    required this.totalPages,
    required this.totalRecords,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: json['current_page'],
      pageSize: json['page_size'],
      totalPages: json['total_pages'],
      totalRecords: json['total_records'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_page': currentPage,
      'page_size': pageSize,
      'total_pages': totalPages,
      'total_records': totalRecords,
    };
  }
}
