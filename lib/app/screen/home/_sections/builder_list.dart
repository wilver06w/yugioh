part of 'package:yugioh/app/screen/home/page.dart';

class BuilderList extends StatelessWidget {
  const BuilderList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.md),
      child: BlocBuilder<BlocHome, HomeState>(
        builder: (context, state) {
          if ((state.model.listYuGiOh ?? []).isEmpty) {
            return Center(
              child: YuGiOhText.body(
                label: YuGiOhUiValues.selectArchetype,
              ),
            );
          }
          return SizedBox(
            height: size.height * 0.75,
            child: ListView.builder(
              itemCount: state.model.listYuGiOh?.length,
              itemBuilder: (BuildContext context, int index) {
                final itemYuGiOh = state.model.listYuGiOh?[index];
                return ItemCard(
                  itemYuGiOh: itemYuGiOh,
                  size: size,
                  onTap: () {
                    YuGiOhRoute.navDetail(
                      yuGiOh: itemYuGiOh,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
