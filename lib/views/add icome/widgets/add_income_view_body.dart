import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/incomes%20cubit/incomes_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/add%20fules/widgets/custom_text_from_field.dart';

class AddIncomeViewBody extends StatelessWidget {
  AddIncomeViewBody({super.key});

  final moneyController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IncomesCubit, IncomesState>(
      listener: (context, state) {
        if (state is SuccessInsertToDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = IncomesCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Income Details',
              style: AppStyles.styleSemiBold24(context).copyWith(
                color: Color(0xFFB71C1C),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fuel Amount
                Text(
                  'Enter The',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: moneyController,
                  inputType: TextInputType.number,
                  iconColor: Color(0xFFB71C1C),
                  labelTextColor: Color(0xFFB71C1C),
                  labelText: 'The Total Income', // Specify the label text
                  iconData: Icons.attach_money_sharp, // Specify the icon
                ),
                const SizedBox(height: 16),

                Text(
                  'Enter The ',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: dateController,
                  inputType: TextInputType.datetime,
                  iconColor: Color(0xFFB71C1C),
                  labelTextColor: Color(0xFFB71C1C),
                  labelText: 'Income Date', // Specify the label text
                  iconData: Icons.date_range_outlined,
                  // Specify the icon
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      double moneyValue = double.parse(moneyController.text);
                      int moneyInCents = (moneyValue).toInt();

                      String dateText =
                          dateController.text; // Assuming "12/4/2024"
                      List<String> dateComponents =
                          dateText.split('/'); // Split by '/'
                      int day = int.parse(dateComponents[0]);
                      int month = int.parse(dateComponents[1]);
                      int year = int.parse(dateComponents[2]);

                      DateTime selectedDate = DateTime(year, month, day);
                      cubit.insertToDatabase(
                          date: selectedDate.toString(), money: moneyInCents);

                      ScaffoldMessenger.of(context).showSnackBar(
                      const  SnackBar(content: Text('Process completed!')),
                      );
                    },
                    child: Text(
                      'Save',
                      style: AppStyles.styleMedium16(context).copyWith(
                        color: Color(0xFFB71C1C),
                      ),
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
