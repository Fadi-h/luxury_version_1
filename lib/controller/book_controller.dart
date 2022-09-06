import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';


class BookController extends GetxController {

  RxInt selectRentalModel = 0.obs;

  /// date & time section
  RxString selectedDate = ''.obs;
  RxString dateCount = ''.obs;
  RxString range = ''.obs;
  RxString rangeCount = ''.obs;
  RxBool saveDate = false.obs;
  var pickUpValidate = true.obs;
  Rx<String> pickTime ="non".obs;
  var dropOffValidate = true.obs;
  Rx<String> dropTime ="non".obs;


  void onSelectionDateChanges(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      saveDate.value = false;
      range.value = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
      // ignore: lines_longer_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    } else if (args.value is DateTime) {
      selectedDate.value = args.value.toString();
    } else if (args.value is List<DateTime>) {
      dateCount.value = args.value.length.toString();
    } else {
      rangeCount.value = args.value.length.toString();
    }
  }
  clear() {
    selectRentalModel.value = 0;
    selectedDate.value = '';
    saveDate.value = false;
    pickTime = "non".obs;
  }

}