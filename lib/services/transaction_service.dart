import 'dart:convert';

import 'package:bank_sha/models/request/data_plan_form_model.dart';
import 'package:bank_sha/models/request/top_up_form_model.dart';
import 'package:bank_sha/models/request/transfer_form_model.dart';
import 'package:bank_sha/models/response/data_plan_model.dart';
import 'package:bank_sha/services/auth_service.dart';
import 'package:bank_sha/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topUp(TopUpFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http
          .post(Uri.parse('$baseUrl/top_ups'), body: data.toJson(), headers: {
        'Authorization': token,
      });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }

      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http
          .post(Uri.parse('$baseUrl/transfers'), body: data.toJson(), headers: {
        'Authorization': token,
      });

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final res = await http.post(Uri.parse('$baseUrl/data_plans'),
          body: data.toJson(),
          headers: {
            'Authorization': token,
          });

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
