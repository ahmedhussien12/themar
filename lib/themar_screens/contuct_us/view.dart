import 'package:api/core/designs/app_input.dart';
import 'package:api/core/logic/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'states.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({super.key});

  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  late ContactUsCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact Us"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppInput(
                  controller: cubit.fullNameController,
                  label: "full name",
                  hint: "enter your full name",
                  border: const OutlineInputBorder(),
                ),
                SizedBox(
                  height: 16,
                ),
                AppInput(
                  controller: cubit.phoneController,
                  label: "phone",
                  hint: "enter your phone number",
                  border: const OutlineInputBorder(),
                ),
                SizedBox(
                  height: 16,
                ),
                AppInput(
                  controller: cubit.titleController,
                  label: "title",
                  hint: "enter your title",
                  border: const OutlineInputBorder(),
                ),
                SizedBox(
                  height: 16,
                ),
                AppInput(
                  controller: cubit.contentController,
                  label: "content",
                  maxLines: 5,
                  hint: "enter your content",
                  border: const OutlineInputBorder(),
                ),
                SizedBox(
                  height: 16,
                ),
                BlocConsumer(
                    bloc: cubit,
                    listener: (context, state) {
                      if (state is SendContactUsSuccessStates) {
                        print("*****");
                        print(state.message);
                        showMessage(state.message, messageType: MessageType.success);
                      } else if (state is SendContactUsErrorStates) {
                        print("*****");
                        print(state.message);
                        showMessage(state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is SendContactUsLoadingStates) {
                        return  Center(child: CircularProgressIndicator());
                      } else {
                        return FilledButton(
                          onPressed: () => cubit.send(),
                          child: const Text("send"),
                        );
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
