import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/cubit/fuel%20transcaction%20cubit/fuel_transactions_cubit.dart';
import 'package:taxi_app/utils/app_styles.dart';
import 'package:taxi_app/views/add%20fules/widgets/custom_text_from_field.dart';

class AddFuelBody extends StatelessWidget {
  AddFuelBody({Key? key});
  final priceController = TextEditingController();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FuelTransactionsCubit, FuelTransactionsState>(
      listener: (context, state) {
        if (state is SuccessInsertToDatabaseState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = FuelTransactionsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Fuel Details',
              style: AppStyles.styleSemiBold24(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fuel Amount
                Text(
                  'Enter The ',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: amountController,
                  inputType: TextInputType.number,
                  iconColor: const Color(0xFF4EB7F2),
                  labelTextColor: const Color(0xFF4EB7F2),
                  labelText:
                      'Fuel Amount (in liters)', // Specify the label text
                  iconData: Icons.oil_barrel_rounded, // Specify the icon
                ),
                const SizedBox(height: 16),
                Text(
                  'Enter The ',
                  style: AppStyles.styleMedium16(context),
                ),
                CustomeTextFromField(
                  controller: priceController,
                  inputType: TextInputType.number,
                  iconColor: Color(0xFF4EB7F2),
                  labelTextColor: Color(0xFF4EB7F2),
                  labelText: 'Fuel Price (per liter)', // Specify the label text
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
                  iconColor: Color(0xFF4EB7F2),
                  labelTextColor: Color(0xFF4EB7F2),
                  labelText: 'Fuel Date', // Specify the label text
                  iconData: Icons.date_range_outlined, // Specify the icon
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      double moneyValue = double.parse(priceController.text);
                      int moneyInCents = (moneyValue).toInt();
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
                          price: moneyInCents,
                          amount: amount1);
                      // Add logic to save fuel details

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Process completed!')),
                      );
                    },
                    child: Text(
                      'Save',
                      style: AppStyles.styleMedium16(context),
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
