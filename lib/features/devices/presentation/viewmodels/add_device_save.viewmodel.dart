import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_automation_app/features/devices/data/models/device.model.dart';
import 'package:home_automation_app/features/devices/presentation/providers/add_device_providers.dart';
import 'package:home_automation_app/features/devices/presentation/providers/device_providers.dart';
import 'package:home_automation_app/helpers/enums.dart';
import 'package:home_automation_app/helpers/utils.dart';

class AddDeviceSaveViewModel extends StateNotifier<AddDeviceStates> {

  final Ref ref;
  AddDeviceSaveViewModel(super.state, this.ref);

  void saveDevice() async {

    state = AddDeviceStates.saving;
    await Future.delayed(1.seconds);

    // collect the info
    final label = ref.read(deviceNameValueProvider);
    final outletIndex = ref.read(outletValueProvider.notifier).state++;
    final deviceType = ref.read(deviceTypeSelectionVMProvider.notifier).getSelectedDeviceType();

    ref.read(deviceListVMProvider.notifier).addDevice(
      DeviceModel(
        iconOption: deviceType.iconOption,
        label: label,
        isSelected: false,
        outlet: outletIndex
      )
    );

    final updatedList = ref.read(deviceListVMProvider);
    ref.read(deviceRepositoryProvider).saveDeviceList(updatedList);

    state = AddDeviceStates.saved;
    await Future.delayed(1.seconds);
    GoRouter.of(Utils.mainNav.currentContext!).pop();
  }

  void resetAllValues() {
    state = AddDeviceStates.none;

    ref.read(deviceNameFieldProvider).clear();
    ref.read(deviceNameValueProvider.notifier).state = '';
    ref.read(outletValueProvider.notifier).state = -1;
    var rawList = ref.read(deviceTypeListProvider);
    ref.read(deviceTypeSelectionVMProvider.notifier).state = rawList;
  }
}