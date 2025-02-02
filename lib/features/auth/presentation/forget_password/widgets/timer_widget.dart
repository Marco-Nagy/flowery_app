import 'package:flowery_e_commerce/core/styles/colors/my_colors.dart';
import 'package:flowery_e_commerce/features/auth/presentation/forget_password/ViewModel/forget_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flowery_e_commerce/core/utils/extension/media_query_values.dart';
import '../../../../../core/localization/lang_keys.dart';
import '../../../../../core/styles/fonts/my_fonts.dart';
import '../../../domain/entities/request/forget_password_request_entity.dart';
import '../ViewModel/forget_password_base_actions.dart';



class TimerWidget extends StatefulWidget {
  final String email;

  const TimerWidget({
    super.key,
    required this.email,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    ForgetPasswordViewModelCubit cubit =
        context.read<ForgetPasswordViewModelCubit>();

    return ValueListenableBuilder(
      valueListenable: cubit.timeMessage,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              const SizedBox(width: 5),
              cubit.time == 0
                  ? InkWell(
                      onTap: () async {
                        context
                            .read<ForgetPasswordViewModelCubit>()
                            .initTimer();
                        context.read<ForgetPasswordViewModelCubit>().doAction(
                            ForgetPasswordAction(ForgetPasswordRequestEntity(
                                email: widget.email)));
                      },
                      child: Text(
                         context.translate(LangKeys.resend),
                        textAlign: TextAlign.center,
                        style: MyFonts.styleRegular400_16
                            .copyWith(color: MyColors.blue),
                      ),
                    )
                  : Text(
                      cubit.timeMessage.value,
                      style: const TextStyle(color: MyColors.baseColor, fontSize: 16),
                    ),
            ],
          ),
        );
      },
    );
  }
}
