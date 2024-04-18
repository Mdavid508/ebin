class BusinessToCustomer {
  final String originatorConversationID;
  final String initiatorName;
  final String securityCredential;
  final String commandID;
  final String amount;
  final String partyA;
  final String partyB;
  final String remarks;
  final String queueTimeOutURL;
  final String resultURL;
  final String occasion;

  BusinessToCustomer({
    required this.originatorConversationID,
    required this.initiatorName,
    required this.securityCredential,
    required this.commandID,
    required this.amount,
    required this.partyA,
    required this.partyB,
    required this.remarks,
    required this.queueTimeOutURL,
    required this.resultURL,
    required this.occasion,
  });

  Map<String, dynamic> toJson() {
    return {
      'OriginatorConversationID': originatorConversationID,
      'InitiatorName': initiatorName,
      'SecurityCredential': securityCredential,
      'CommandID': commandID,
      'Amount': amount,
      'PartyA': partyA,
      'PartyB': partyB,
      'Remarks': remarks,
      'QueueTimeOutURL': queueTimeOutURL,
      'ResultURL': resultURL,
      'Occassion': occasion,
    };
  }
}
