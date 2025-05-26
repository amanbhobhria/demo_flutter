import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../controllers/timeline_controller.dart';


class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TimelineController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline Screen'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.steps.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final step = controller.steps[index];
            final isActive = index <= controller.currentStep.value;
            final isCurrent = index == controller.currentStep.value;

            return FixedTimeline.tileBuilder(
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: controller.steps.length,
                indicatorBuilder: (_, i) => DotIndicator(
                  color: i <= controller.currentStep.value
                      ? Colors.green
                      : Colors.grey,
                ),
                connectorBuilder: (_, i, __) => SolidLineConnector(
                  color: i < controller.currentStep.value
                      ? Colors.green
                      : Colors.grey.shade400,
                ),
                contentsBuilder: (_, i) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 24),
                  child: Text(
                    controller.steps[i],
                    style: TextStyle(
                      fontSize: 16,
                      color: isActive ? Colors.black : Colors.grey,
                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
      floatingActionButton: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (controller.currentStep.value > 0)
              FloatingActionButton(
                heroTag: "prev",
                backgroundColor: Colors.teal,
                onPressed: controller.previousStep,
                child: const Icon(Icons.arrow_back),
              ),
            const SizedBox(width: 12),
            if (controller.currentStep.value < controller.steps.length - 1)
              FloatingActionButton(
                heroTag: "next",
                backgroundColor: Colors.teal,
                onPressed: controller.nextStep,
                child: const Icon(Icons.arrow_forward),
              ),
          ],
        );
      }),
    );
  }
}
