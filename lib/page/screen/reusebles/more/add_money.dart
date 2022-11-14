import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappengine/page/sheet/payment_method/payment_method.dart';
import '../../../../helpers/cliper.dart';
import '../../../../constants/app_colors.dart';
import '../../../../widgets/ui_kits/button_ui/button_ui.dart';
import '../../../../widgets/ui_kits/labels_ui/label_ui.dart';
import 'controller/buy.dart';

class AddMoneyVC extends StatefulWidget {
  const AddMoneyVC({super.key});

  @override
  State<AddMoneyVC> createState() => _AddMoneyVCState();
}

class _AddMoneyVCState extends State<AddMoneyVC> {
  final BuyC buyC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 100,
                  collapsedHeight: 100,
                  backgroundColor: AppColors.purpura.withAlpha(0),
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    background: ClipPath(
                      clipper: InBorderBotton(),
                      child: ClipPath(
                        clipper: InBorderBotton(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          color: AppColors.purpura,
                        ),
                      ),
                    ),
                    expandedTitleScale: 1,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Hero(tag: 'cardsAmount', child: cardsAmount()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40),
            child: UILabels(
                text: "All trading transactions are excuted in USD. You may incur FX charges when funding your trading account.",
                textLines: 2,
                color: AppColors.gray2,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                textAlign: TextAlign.center),
          ),
          GestureDetector(
              onTap: () {
                //TODO
              },
              child: const UILabels(
                  text: "Learn more",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  textLines: 0,
                  color: AppColors.purpura,
                  textAlign: TextAlign.center)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32),
            child: SizedBox(
              height: 50,
              width: Get.width,
              child: Expanded(
                child: SizedBox(
                    height: 50,
                    child: UIBottons(
                        labels: const UILabels(
                          text: 'Found',
                          textLines: 0,
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        colorList: const [],
                        cb: (v) {
                          PaymentMethodSheet().MoneyAdded(context);
                        })),
              ),
            ),
          ),
          const SizedBox(height: 32),
          listMoney(),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 16),
            child: NumberGridCard(cb: (v) {
              v == "-1"
                  ? buyC.amoutSelect.value = buyC.amoutSelect.value.substring(0, buyC.amoutSelect.value.length - 1)
                  : buyC.amoutSelect.value = buyC.amoutSelect.value + v;
            }),
          ),
        ],
      ),
    );
  }

  Widget cardsAmount() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.purpura.withAlpha(25),
            spreadRadius: 0,
            blurRadius: 28,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: UILabels(
                        text: "USD",
                        textLines: 1,
                        color: AppColors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Obx(() => UILabels(
                          text: "\$${buyC.amoutSelect.value}",
                          textLines: 1,
                          color: AppColors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                const UILabels(
                  text: "Balance: 11,34.55",
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listMoney() {
    var list = ["\$10", "\$50", "\$100", "\$500", "\$1000"];
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(left: 7, right: 7),
                margin: const EdgeInsets.only(left: 17, right: 17),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // color: UserPersonalC().selectedIndex == index ? AppColors.purpura : AppColors.white,
                ),
                child: UILabels(
                  text: list[index],
                  textLines: 1,
                  color: AppColors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onTap: () {
                buyC.amoutSelect.value = list[index].replaceFirst("\$", "");
                buyC.currentValue();
              },
            );
          }),
    );
  }
}

class NumberGridCard extends StatelessWidget {
  final Function(String) cb;
  const NumberGridCard({Key? key, required this.cb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var num = [1, 2, 3, 4, 5, 6, 7, 8, 9, ".", 0, -1];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: num.map(
        (e) => e == -1
            ? InkWell(
                onTap: () {
                  cb(e.toString());
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: (Get.width / 3) - 42,
                    decoration: BoxDecoration(
                      color: AppColors.purpura3,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: AppColors.purpura,
                    )),
              )
            : InkWell(
                onTap: () {
                  cb(e.toString());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: (Get.width / 3) - 42,
                  decoration: BoxDecoration(
                    color: AppColors.purpura3,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: UILabels(
                    text: e.toString(),
                    textLines: 0,
                    color: AppColors.purpura,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ).toList(),
    );
  }
}
