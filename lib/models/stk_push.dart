class StkPush {
  final String businessShortCode;
  final String password;
  final String timestamp;
  final String transactionType;
  final String amount;
  final String partyA;
  final String partyB;
  final String phoneNumber;
  final String callBackURL;
  final String accountReference;
  final String transactionDesc;

  StkPush({
    required this.businessShortCode,
    required this.password,
    required this.timestamp,
    required this.transactionType,
    required this.amount,
    required this.partyA,
    required this.partyB,
    required this.phoneNumber,
    required this.callBackURL,
    required this.accountReference,
    required this.transactionDesc,
  });

  Map<String, dynamic> toJson() {
    return {
      'BusinessShortCode': businessShortCode,
      'Password': password,
      'Timestamp': timestamp,
      'TransactionType': transactionType,
      'Amount': amount,
      'PartyA': partyA,
      'PartyB': partyB,
      'PhoneNumber': phoneNumber,
      'CallBackURL': callBackURL,
      'AccountReference': accountReference,
      'TransactionDesc': transactionDesc,
    };
  }
}
