import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yugioh/app/models/list_yugioh.dart';
import 'package:yugioh/app/utils/spacing.dart';
import 'package:yugioh/app/utils/text/text.dart';
import 'package:yugioh/app/utils/yugioh_ui.dart';
import 'package:yugioh/app/widget/item_yugi/bloc/bloc.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({
    super.key,
    required this.taskItem,
    required this.onTap,
    required this.onTapDelete,
  });

  final YuGiOh taskItem;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocItemTask(
        itemTask: taskItem,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: YuGiOhSpacing.md,
        ),
        child: InkWell(
          onTap: onTap,
          child: Card(
            elevation: 3,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(YuGiOhSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      YuGiOhText.body(
                        label: taskItem.name,
                        color: Colors.black,
                        textStyle: GoogleFonts.lato(),
                        fontWeight: FontWeight.bold,
                      ),
                      //TODO: descomentar
                      // ContainerTime(
                      //   dateTime: Functions.timeText(initial: taskItem.),
                      // ),
                    ],
                  ),
                  const Gap(YuGiOhSpacing.md),
                  YuGiOhText.labelText(
                    label: taskItem.desc,
                    color: Colors.black,
                    textStyle: GoogleFonts.lato(),
                  ),
                  const Gap(YuGiOhSpacing.md),
                  BlocSelector<BlocItemTask, ItemTaskState, bool>(
                    selector: (state) {
                      return state.model.isViewTraslate;
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          context.read<BlocItemTask>().add(
                                ChangeIsViewTraslateEvent(),
                              );
                        },
                        child: YuGiOhText.small(
                          label: YuGiOhUiValues.organizeTextTraduction(
                            primary: state
                                ? YuGiOhUiValues.see
                                : YuGiOhUiValues.gone,
                            description: YuGiOhUiValues.spanishTranslation,
                          ),
                          color: Colors.blue,
                          textStyle: GoogleFonts.robotoMono(),
                        ),
                      );
                    },
                  ),
                  const Gap(YuGiOhSpacing.md),
                  BlocBuilder<BlocItemTask, ItemTaskState>(
                    builder: (context, state) {
                      return BlocSelector<BlocItemTask, ItemTaskState, bool>(
                        selector: (state) {
                          return state.model.isViewTraslate;
                        },
                        builder: (context, state) {
                          return state
                              ? const SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    YuGiOhText.body(
                                      label: taskItem.name,
                                      color: Colors.black,
                                      textStyle: GoogleFonts.lato(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const Gap(YuGiOhSpacing.md),
                                    YuGiOhText.labelText(
                                      label: taskItem.desc,
                                      color: Colors.black,
                                      textStyle: GoogleFonts.lato(),
                                    ),
                                  ],
                                );
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: onTapDelete,
                        child: const Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
