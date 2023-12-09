///The exception that will be thrown should an
///error occur within the transaction layer
/// To be handled on UI by letting the user know
///the status of their internet. Either bad network or
///no network
class TransactionException implements Exception {
  ///Default constructor, will contain the error message
  TransactionException({required this.exceptionMessage});

  ///The message to be shown
  final String exceptionMessage;

  @override
  String toString() => exceptionMessage;
}