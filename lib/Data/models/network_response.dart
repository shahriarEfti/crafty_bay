class NetworkResponse{

  final int statusCode;
  dynamic responseData;
  String ? errorMessage;
  final bool isSucess;

  NetworkResponse({
    required this.isSucess,
    required this.statusCode,
    this.errorMessage,
    this.responseData

});


}