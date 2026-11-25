import 'package:test/test.dart';
import 'package:api/api.dart';

/// tests for PaymentApi
void main() {
  final instance = Api().getPaymentApi();

  group(PaymentApi, () {
    //Future<DownloadLink> getSlipDownloadLink(int id) async
    test('test getSlipDownloadLink', () async {
      // TODO
    });

    //Future<List<Payment>> getUserPayments() async
    test('test getUserPayments', () async {
      // TODO
    });
  });
}
