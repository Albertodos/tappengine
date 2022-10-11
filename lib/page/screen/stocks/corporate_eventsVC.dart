import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tappengine/widgets/views/events/events.dart';
import '../../../dependencies/datepicker/datepicker.dart';
import '../../../helpers/cliper.dart';
import '../../../helpers/globals.dart' as globals;
import '../../../constants/app_colors.dart';
import '../../../model/objects/pull_data.dart';
import '../../../widgets/structural/list_Structural.dart';
import '../../../widgets/views/cards/user/userCard.dart';

class CorporateEventsVC extends StatefulWidget {
  const CorporateEventsVC({super.key});

  @override
  State<CorporateEventsVC> createState() => _CorporateEventsVCState();
}

class _CorporateEventsVCState extends State<CorporateEventsVC> {
  var eventesPosition = 0.obs;
  @override
  Widget build(BuildContext context) {
    var pulldata = PullData(data: [
      EventsCards().cardHearder(context, (v) {
        eventesPosition.value = v;
      })
    ], more: "", title: "", position: Axis.vertical);
    var pulldata1 = PullData(
        data: [EventsCards().cards02(context), EventsCards().cards02(context), EventsCards().cards02(context)],
        more: "View All",
        title: "Events",
        position: Axis.vertical);
    var pulldata2 = PullData(
        data: [EventsCards().cards01(context), EventsCards().cards01(context), EventsCards().cards01(context)],
        more: "View All",
        title: "Events",
        position: Axis.vertical);

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
                children: [
                  ListStrutural(
                    data: pulldata,
                    colorTitle: AppColors.black,
                    height: null,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.purpura.withAlpha(25),
                            spreadRadius: 4,
                            blurRadius: 8,
                            offset: const Offset(2, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: DatePickerService().buildCalender(context),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  eventesPosition.value == 0
                      ? ListStrutural(
                          data: pulldata1,
                          colorTitle: AppColors.black,
                          height: null,
                        )
                      : ListStrutural(
                          data: pulldata2,
                          colorTitle: AppColors.black,
                          height: null,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
