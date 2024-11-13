import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:textile_app/model/data_modal.dart';

class dataController extends ChangeNotifier {
  List<datamodel> imagelist = [
    datamodel(images: "poutstanding.svg", title: "Purchase\nOutstanding"),
    datamodel(images: "soutstanding.svg", title: "Sales\nOutstanding"),
    datamodel(images: "purchase.svg", title: "Purchase"),
    datamodel(images: "sale.svg", title: "Sales"),
    datamodel(images: "ledger.svg", title: "Ledger"),
    datamodel(images: "bank.svg", title: "Cash &\nBank"),
    datamodel(images: "purchase.svg", title: "Purchase\nOrder"),
    datamodel(images: "sales.svg", title: "sales\nOrder"),
    datamodel(images: "beam.svg", title: "Beam\nReport"),
    datamodel(images: "stock.svg", title: "Stock\nReport"),
    datamodel(images: "delivery.svg", title: "Delivery\nChallan"),
    datamodel(images: "contacts.svg", title: "Our\nContacts"),
    datamodel(images: "credit.svg", title: "Credit\nNote"),
    datamodel(images: "debit.svg", title: "Debit\nNote"),
    datamodel(images: "preturn.svg", title: "Purchase\nReturn"),
    datamodel(images: "sreturn.svg", title: "Sales\nReturn"),
    datamodel(images: "items.svg", title: "Our\nItems"),
    datamodel(images: "broker.svg", title: "Our\nContacts"),
  ];

  List<datamodel> companyList = [
    datamodel(images: "user.svg", title: "Munjapara Fabrics (03)"),
    datamodel(images: "user.svg", title: "Munjapara Textile Pvt.Ltd. (02)"),
    datamodel(images: "user.svg", title: "Munjapara Textile......(01)"),
  ];
  Future<void> refreshCompanyList() async {
    var updatedList = await fetchUpdatedCompanyList();
    companyList.assignAll(updatedList);
  }

  Future<List<datamodel>> fetchUpdatedCompanyList() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      datamodel(images: "user.svg", title: "Munjapara Fabrics (03)"),
      datamodel(images: "user.svg", title: "Munjapara Textile Pvt.Ltd. (02)"),
      datamodel(images: "user.svg", title: "Munjapara Textile......(01)"),
    ];
  }

  List<datamodel> itemList = [
    datamodel(images: "user.svg", title: "Yarn Stock [Yarn Base]"),
    datamodel(images: "user.svg", title: "Gray Stock - 1"),
    datamodel(images: "user.svg", title: "Millgine Stock - 1"),
    datamodel(images: "user.svg", title: "Weaver Wise Yarn Stock - 2"),
    datamodel(images: "user.svg", title: "Weaver Wise Roll Stock - 2"),
    datamodel(images: "user.svg", title: "Weaver Wise Pipe Stock - 2"),
  ];
  List<Company> filteredCompanyDetails = [];

  List<Company> companyDetails = [
    Company(
        address:
            "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
        title: "Varni Infotech",
        balance: "₹26,548,23.00"),
    Company(
        address:
            "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
        title: " Infotech",
        balance: "₹26,548,23.00"),
    Company(
        address:
            "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016",
        title: "Varni",
        balance: "₹26,548,23.00"),
  ];

  List<Balance> balancelist = [
    Balance(
        title: "Varni Infotech", balance: "69,000.00", images: "call_ic.svg"),
    Balance(
        title: "Sky Infotech", balance: "1,15,000.00", images: "call_ic.svg"),
  ];

  var searchText = ''.obs;

  var invoices = [
    {
      "billNo": "27",
      "date": "05-07-24",
      "fix": "45",
      "due": "77",
      "amount": "₹6,122.00",
      "chack": false,
    },
    {
      "billNo": "318",
      "date": "28-07-24",
      "fix": "30",
      "due": "36",
      "amount": "₹7,293.00",
      "chack": false,
    },
    {
      "billNo": "26",
      "date": "28-07-24",
      "fix": "30",
      "due": "36",
      "amount": "₹7,293.00",
      "chack": false,
    },
    {
      "billNo": "317",
      "date": "28-07-24",
      "fix": "30",
      "due": "36",
      "amount": "₹7,293.00",
      "chack": false,
    },
  ].obs;
  var biles = [
    {
      "billNo": "Text 1",
      "date": "0",
      "fix": "0",
      "due": "0",
    },
    {
      "billNo": "Text 2",
      "date": "0",
      "fix": "0",
      "due": "0",
    },
    {
      "billNo": "Text 3",
      "date": "0",
      "fix": "0",
      "due": "0",
    }
  ].obs;

  void searchInvoice(String value) {
    searchText.value = value;
  }

  var receivable = 2900000.0.obs;
  var billType = 'All'.obs;
  var sortBy = 'Party Asc'.obs;
  var searchQuery = ''.obs;
  TextEditingController searchController = TextEditingController();

  bool isChecked1 = false;

  var startDate = DateTime(2024, 8, 5).obs;
  var endDate = DateTime(2024, 8, 11).obs;

  // You can add methods to update the date range
  void updateDateRange(DateTime start, DateTime end) {
    startDate.value = start;
    endDate.value = end;
  }

  var beamData = [
    {"name": "Text 1", "value1": 0, "value2": 0, "value3": 0}.obs,
    {"name": "Text 2", "value1": 0, "value2": 0, "value3": 0}.obs,
    {"name": "Text 3", "value1": 0, "value2": 0, "value3": 0}.obs,
  ];

  var companyDetailsList = [
    {
      "title": "Varni Infotech",
      "Pur Rate": "0",
      "Sale Rate": "0",
      "Group": "",
      "Unit": "KGS",
      "HSN": "540210",
    },
    {
      "title": "Sky Infotech",
      "Pur Rate": "0",
      "Sale Rate": "0",
      "Group": "",
      "Unit": "KGS",
      "HSN": "540710",
    }
  ].obs;

  List<datamodel> callList = [
    datamodel(title: "Varni Infotech", images: "1234567890")
  ];
}
