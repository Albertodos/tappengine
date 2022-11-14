import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/cliper.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../constants/app_colors.dart';
import '../../../widgets/structural/list_Structural.dart';
import '../../../widgets/ui_kits/labels_ui/label_ui.dart';
import '../../../widgets/views/cards/crypto/model/tab_menu.dart';
import '../../../widgets/views/cards/menu/menuCard.dart';
import '../../../widgets/views/cards/user/userCard.dart';
import '../products/controller/productsC.dart';

class InvestVC extends StatefulWidget {
  const InvestVC({super.key});

  @override
  State<InvestVC> createState() => _InvestVCState();
}

class _InvestVCState extends State<InvestVC> {
  final ProductsC productsC = Get.put(ProductsC());

  @override
  void initState() {
    productsC.getproductsView("invest.json", context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            collapsedHeight: 100,
            backgroundColor: AppColors.purpura.withAlpha(0),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              // title: Obx(
              //   () => Padding(
              //     padding: const EdgeInsets.only(bottom: 20),
              //     child: UserCards(
              //       user: globals.userPersonal.userPersonal.value.toJsonInfo(),
              //     ).userWelcome(context),
              //   ),
              // ),
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
            child: Obx(
              () => Column(
                  children: productsC.pullData.map((element) {
                PageController controller = PageController(viewportFraction: 1, keepPage: true);

                return element.type == "MenuTab"
                    ? element.data is List<TabMenu>
                        ? Padding(
                            padding: const EdgeInsets.only(left: 32, right: 32),
                            child: Column(
                              children: [
                                if (element.title != "")
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                          child: UILabels(
                                        text: element.title ?? "",
                                        textLines: 1,
                                        color: AppColors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      )),
                                      if (element.more != "")
                                        const UILabels(
                                          text: "All More",
                                          textLines: 1,
                                          color: AppColors.purpura,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        )
                                    ],
                                  ),
                                MenuCards().tabMenu((element.data as List<TabMenu>).map((e) => e.name.toString()).toList(), (p) {
                                  controller.animateToPage(p,
                                      curve: Curves.decelerate,
                                      duration: const Duration(milliseconds: 300)); // for animated jump. Requires a curve and a duration
                                }),
                                ExpandablePageView(
                                  controller: controller,
                                  onPageChanged: (value) {},
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: (element.data as List<TabMenu>).map((e) => e.widget.value).toList(),
                                ),
                              ],
                            ),
                          )
                        : const CircularProgressIndicator(
                            color: AppColors.black,
                          )
                    : ListStrutural(
                        data: element,
                        colorTitle: AppColors.black,
                        height: element.height,
                      );
              }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
