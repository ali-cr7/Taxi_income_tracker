import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/maintainance%20cubit/maintainance_cubit_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/add%20fules/widgets/custom_text_from_field.dart';

class AddMainTainanceViewBody extends StatelessWidget {
  AddMainTainanceViewBody({super.key});
  final priceController = TextEditingController();
  final descriptiontController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintainanceCubitCubit, MaintainanceCubitState>(
      listener: (context, state) {
        if (state is SuccessInsertToDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = MaintainanceCubitCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add MAintainance Details',
              style: AppStyles.styleSemiBold24(context)
                  .copyWith(color: const Color(0xFF2E7D32)),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fuel Amount
                Text(
                  'Enter The ',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: descriptiontController,
                  inputType: TextInputType.text,
                  iconColor: Color(0xFF2E7D32),
                  labelTextColor: Color(0xFF2E7D32),
                  labelText: 'The Maintinance', // Specify the label text
                  iconData: Icons.car_repair, // Specify the icon
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter The ',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: priceController,
                  inputType: TextInputType.number,
                  iconColor: Color(0xFF2E7D32),
                  labelTextColor: Color(0xFF2E7D32),
                  labelText: 'Maintinance Price', // Specify the label text
                  iconData: Icons.monetization_on_outlined, // Specify the icon
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter The ',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: dateController,
                  inputType: TextInputType.datetime,
                  iconColor: Color(0xFF2E7D32),
                  labelTextColor: Color(0xFF2E7D32),
                  labelText: 'Maintinance Date', // Specify the label text
                  iconData: Icons.date_range_outlined, // Specify the icon
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      double amount = double.parse(priceController.text);
                      int amount1 = (amount).toInt();
                      String dateText =
                          dateController.text; // Assuming "12/4/2024"
                      List<String> dateComponents =
                          dateText.split('/'); // Split by '/'
                      int day = int.parse(dateComponents[0]);
                      int month = int.parse(dateComponents[1]);
                      int year = int.parse(dateComponents[2]);

                      DateTime selectedDate = DateTime(year, month, day);
                      cubit.insertToDatabase(
                          date: selectedDate.toString(),
                          price: amount1,
                          description: descriptiontController.text);
                      // Add logic to save fuel details.
                         ScaffoldMessenger.of(context).showSnackBar(
                       const SnackBar(content: Text('Process completed!')),
                      );
                    },
                    child: Text(
                      'Save',
                      style: AppStyles.styleMedium16(context)
                          .copyWith(color: const Color(0xFF2E7D32)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
