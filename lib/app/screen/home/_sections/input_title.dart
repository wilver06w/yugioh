part of 'package:yugioh/app/screen/home/page.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocHome, HomeState>(
      builder: (context, state) {
        final controllers = TextEditingController(
          text: state.model.searchArchetype,
        );

        return YuGiOhTextField(
          controller: controllers
            ..selection = TextSelection.fromPosition(
              TextPosition(
                offset: controllers.text.length,
              ),
            ),
          hintText: YuGiOhUiValues.title,
          fillColor: Colors.white,
          filled: true,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return '${YuGiOhUiValues.title} ${YuGiOhUiValues.onRequired}';
            }
            return null;
          },
          textInputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
          ],
          onChanged: (value) {
            //TODO: revisar
            // context.read<BlocTask>().add(
            //       ChangeTitleEvent(
            //         title: value,
            //       ),
            //     );
          },
        );
      },
    );
  }
}
