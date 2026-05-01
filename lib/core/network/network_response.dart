class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String errorMsg;
  final Map<String, dynamic>? responseBody;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.errorMsg='Something went wrong',
     this.responseBody,
  });
}
