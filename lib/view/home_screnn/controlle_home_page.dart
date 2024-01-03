import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  var bpm = 0.obs;
  var gloc = 0.obs;
  var temp = 0.obs;
  var glocuse = 0.obs;
  var insulin = 0.obs;
  void writeDataToFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fip5");
    ref.set({
      "BPM": 20,
      "Temp": 28,
      "glocuse": 10,
      "insulin": 100,
      "Glocusion": 55
    });
  }
  void readDataFromDatabase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("fip5");
    var data = await ref.get();
    if (data.exists) {
      Map<dynamic, dynamic> myData = data.value as Map<dynamic, dynamic>;
      _fillData(myData);
      ref.onValue.listen((event) {
        _fillData(event.snapshot.value as Map<dynamic, dynamic>);
      });
    }
  }
  void _fillData(Map<dynamic, dynamic> myData) {
    if (myData["BPM"] != null) bpm.value = myData["BPM"];
    if (myData["Temp"] != null) temp.value = myData["Temp"];
    if (myData["glocuse"] != null) glocuse.value = myData["glocuse"];
    if (myData["insulin"] != null) insulin.value = myData["insulin"];
    if (myData["Glocusion"] != null) gloc.value = myData["Glocusion"];
  }
}