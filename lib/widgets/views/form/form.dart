import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../ui_kits/labels_ui/label_ui.dart';
import '../../ui_kits/textFields/textFields_ui.dart';
import '../../../helpers/globals.dart' as globals;

class FromView extends StatelessWidget {
  final List<dynamic> user;
  final void Function(String) onSubmitted;
  const FromView({super.key, required this.user, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: user
          .map(
            (e) => Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (e['name'].isNotEmpty)
                      Column(
                        children: [
                          UILabels.semiBold(text: e['name'], textLines: 1, color: AppColors.black),
                          const SizedBox(
                            height: 12,
                          )
                        ],
                      ),
                    getTextefields(e),
                    const SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget getTextefields(Map<String, dynamic> value) {
    // var inputText = TextEditingController();
    // inputText.text = value['value'];
    switch (value['key']) {
      case 'sms':
        return UITextFields(
          maxLines: 5,
          text: value['hintText'],
          cname: value['key'],
          // inputText: inputText,
          cbChenge: (v, k) {
            globals.userPersonal.changeUser(v, k);
          },
          // onSub: (v, k) => onSubmitted(k),
          type: value['keyboardType'],
          suffixIcon: value['sufix'],
          prefixIcon: value['prefix'],
          passwordVisible: value['passVisible'] ?? true,
        );
      case 'observacoes':
        return UITextFields(
          maxLines: 5,
          text: value['hintText'],
          cname: value['key'],
          // inputText: inputText,
          cbChenge: (v, k) {
            globals.userPersonal.changeUser(v, k);
          },
          // onSub: (v, k) => onSubmitted(k),
          type: value['keyboardType'],
          suffixIcon: value['sufix'],
          prefixIcon: value['prefix'],
          passwordVisible: value['passVisible'] ?? true,
        );
      // case 'genre':
      //   return dropdownSexo();
      // case 'estado':
      //   return dropdownEstado();
      // case 'cartaoCredito':
      //   return dropdownCartaoCredete();
      // case 'typoDoc':
      //   return value['sufix'];

      default:
        return UITextFields(
          text: value['hintText'],
          cname: value['key'],
          // inputText: inputText,
          // nextFocus: value['nextFocus'],
          cbChenge: (v, k) {
            globals.userPersonal.changeUser(v, k);
          },
          // onSub: (v, k) => onSubmitted(k),
          type: value['keyboardType'],
          suffixIcon: value['sufix'],
          prefixIcon: value['prefix'],
          passwordVisible: value['passVisible'] ?? true,
        );
    }
  }

  // Widget dropdownSexo() {
  //   final selectedValue = "".obs;
  //   return Obx(
  //     () => SizedBox(
  //       width: Get.width,
  //       child: CustomDropdownButton2(
  //         hint: globals.userPersonal.userFroms.value.genre != '' ? globals.userPersonal.userFroms.value.genre ?? "" : 'Sexo',
  //         offset: const Offset(0, -10),
  //         itemHeight: 50,
  //         buttonHeight: 50,
  //         dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.green, width: 1)),
  //         buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.black, width: 1)),
  //         dropdownItems: const ["Masculino", "Feminino"],
  //         value: selectedValue.value == "" ? null : selectedValue.value,
  //         dropdownWidth: 420,
  //         onChanged: (value) {
  //           selectedValue.value = value ?? "";
  //           globals.userPersonal.changeUser(value, "sexo");
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget dropdownEstado() {
  //   final selectedValue = "".obs;
  //   return Obx(
  //     () => SizedBox(
  //       width: Get.width,
  //       child: CustomDropdownButton2(
  //         hint: globals.userPersonal.userFroms.value.endereco?.estado != '' ? globals.userPersonal.userFroms.value.endereco?.estado ?? "" : 'Estado',
  //         offset: const Offset(0, -10),
  //         itemHeight: 50,
  //         buttonHeight: 50,
  //         dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.green, width: 1)),
  //         buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.black, width: 1)),
  //         dropdownItems: Lists.states,
  //         value: selectedValue.value == "" ? null : selectedValue.value,
  //         dropdownWidth: 420,
  //         onChanged: (value) {
  //           selectedValue.value = value ?? "";
  //           globals.userPersonal.changeUser(value, "estado");
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget dropdownCartaoCredete() {
  //   final selectedValue = "".obs;
  //   return Obx(
  //     () => SizedBox(
  //       width: Get.width,
  //       child: CustomDropdownButton2(
  //         hint: globals.userPersonal.userFroms.value.endereco?.estado != ''
  //             ? globals.userPersonal.userFroms.value.endereco?.estado ?? ""
  //             : 'Cartāo de crédito',
  //         offset: const Offset(0, -10),
  //         itemHeight: 50,
  //         buttonHeight: 50,
  //         dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.green, width: 1)),
  //         buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.black, width: 1)),
  //         dropdownItems: const ["Tranferéncia / PIX", "Boleto"],
  //         value: selectedValue.value == "" ? null : selectedValue.value,
  //         dropdownWidth: 420,
  //         onChanged: (value) {
  //           selectedValue.value = value ?? "";
  //           globals.userPersonal.changeUser(value, "cartaoCredito");
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget dropdownTipoDoc() {
  //   final selectedValue = "".obs;
  //   return Obx(
  //     () => SizedBox(
  //       width: Get.width,
  //       child: CustomDropdownButton2(
  //         hint: globals.userPersonal.userFroms.value.endereco?.estado != ''
  //             ? globals.userPersonal.userFroms.value.endereco?.estado ?? ""
  //             : 'Tipo de Documento',
  //         offset: const Offset(0, -10),
  //         itemHeight: 50,
  //         buttonHeight: 50,
  //         dropdownDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.green, width: 1)),
  //         buttonDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.black, width: 1)),
  //         dropdownItems: const ["CPF", "RG", "Passaporte", "DNI"],
  //         value: selectedValue.value == "" ? null : selectedValue.value,
  //         dropdownWidth: 420,
  //         onChanged: (value) {
  //           selectedValue.value = value ?? "";
  //           globals.userPersonal.changeUser(value, "typoDoc");
  //           globals.userPersonal.chenge(value);
  //         },
  //       ),
  //     ),
  //   );
  // }
}
