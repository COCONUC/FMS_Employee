
class OrderData {
  int? assignId;
  int? orderId;
  int? managerId;
  int? employeeId;
  String? createAssignAt;

  OrderData({this.assignId, this.orderId, this.managerId, this.employeeId, this.createAssignAt});

  OrderData.fromJson(Map<String, dynamic> json) {
    assignId = json["assignId"];
    orderId = json["orderId"];
    managerId = json["managerId"];
    employeeId = json["employeeId"];
    createAssignAt = json["createAssignAt"];
  }

  static List<OrderData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => OrderData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["assignId"] = assignId;
    _data["orderId"] = orderId;
    _data["managerId"] = managerId;
    _data["employeeId"] = employeeId;
    _data["createAssignAt"] = createAssignAt;
    return _data;
  }
}