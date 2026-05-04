import 'package:ecommerce/app/app_color.dart';
import 'package:ecommerce/core/widgets/centered_progress_indicator.dart';
import 'package:ecommerce/core/widgets/scaffold_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:uuid/uuid.dart';

class Payment extends StatefulWidget {
  const Payment(this.totalAmount, {super.key});

  final double totalAmount;

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool _isLoading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MakePayment')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120),
              Text(
                "Total Amount: ${widget.totalAmount}",
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: AppColors.themeColor),
              ),
              const Spacer(),
              Visibility(
                visible: _isLoading==false,
                  replacement: CenteredProgressIndicator(),
                  child: ElevatedButton(onPressed: paymentGatewayIntegration, child: Text('Pay Now'))),
              SizedBox(height: 24,)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> paymentGatewayIntegration() async {
    var uuid = Uuid();
    String tracId = uuid.v1();
    Sslcommerz sslcommerz = Sslcommerz(
      initializer: SSLCommerzInitialization(
        //   ipn_url: "www.ipnurl.com",
        multi_card_name: "visa,master,bkash",
        currency: SSLCurrencyType.BDT,
        product_category: "Food",
        sdkType: SSLCSdkType.TESTBOX,
        store_id: "adnan69e93282e870a",
        store_passwd: "adnan69e93282e870a@ssl",
        total_amount:widget.totalAmount,
        tran_id: tracId,
      ),
    );
    _isLoading=true;
    setState(() {

    });
    final response = await sslcommerz.payNow();
    _isLoading=false;
    setState(() {

    });
    if(response.status=='VALID'){
      if(!mounted)return;
      snackBarMsg(context: context, msg: 'Payment Successful');
    }
    if(response.status=='Closed'){
      if(!mounted)return;
      snackBarMsg(context: context, msg: 'Payment Closed');
    }
    if(response.status=='FAILED'){
      if(!mounted)return;
      snackBarMsg(context: context, msg: 'Payment Failed');
    }

  }
}
