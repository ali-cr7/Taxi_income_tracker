import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taxi_app/views/add%20fules/widgets/fules_transaction_view_body.dart';

//import '../../../models/fules_transaction_model.dart';

class FuelsTransactionView extends StatelessWidget {
  const FuelsTransactionView({super.key});
  // FuelTransactionModel fuelTransactionModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FuelTransactionsViewBody(),
        )
      ],
    );
  }
}
