class ApiResponse<T> {
  final int code;
  final String status;
  final String message;
  final T data;

  ApiResponse({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse<T>(
      code: json['code'] as int,
      status: json['status'] as String,
      message: json['message'] as String,
      data: fromJsonT(json['data']),
    );
  }
}
