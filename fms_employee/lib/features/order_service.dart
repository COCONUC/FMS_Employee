import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:fms_employee/constants/backend_querry.dart';
import 'package:fms_employee/models/order_data.dart';
import 'package:http/http.dart' as http;


class OrderServices{


  // lấy ra danh sách order của staff
  Future<List<OrderData>> getOrderListForStaff(employeeId
      ) async{
    try {
      print("ben trong try");
      http.Response response = await http.get(
        Uri.parse('https://furnituremanagementservice.azurewebsites.net/employee/ViewAssign/employeeId/2'),
        headers: <String, String>{
          'content-encoding': 'gzip',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("ben trong status code");
      if(response.statusCode == 200){
        final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
        return  parsed.map<OrderData>((json) => OrderData.fromJson(json)).toList();
      }
      else{
        /*AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.WARNING,
          title: 'Hết phiên đăng nhập',
          desc: 'Vui lòng đăng nhập lại',
          dismissOnTouchOutside: false,
          btnOkOnPress: () { AuthService().logOut(context);},
        ).show();*/
        throw Exception('Lấy dữ liệu thất bại');
      }
    } catch (e){
      throw Exception(e);
    }
  }

}