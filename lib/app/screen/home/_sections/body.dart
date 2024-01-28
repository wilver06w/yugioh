part of 'package:yugioh/app/screen/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Gap(YuGiOhSpacing.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox.shrink(),
            Center(
              child: YuGiOhText.title(
                label: YuGiOhUiValues.archetypes.toUpperCase(),
                color: Colors.black,
                textStyle: GoogleFonts.lato(),
              ),
            ),
            const Icon(
              Icons.search,
            ),
          ],
        ),
        const Gap(YuGiOhSpacing.md),
        const Header(),
        BuilderList(size: size),
      ],
    );
  }
}
