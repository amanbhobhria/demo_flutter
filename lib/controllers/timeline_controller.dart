import 'package:get/get.dart';

class TimelineController extends GetxController {
  final RxInt currentStep = 0.obs;

  final List<String> steps = [
    'Step 1: Application Submitted',
    'Step 2: Under Review',
    'Step 3: Interview Scheduled',
    'Step 4: Offer Extended',
    'Step 5: Hired',
  ];

  void nextStep() {
    if (currentStep.value < steps.length - 1) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}
