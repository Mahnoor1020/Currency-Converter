import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController usdController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  double result = 0.0;

  void convertCurrency() {
    double? usd = double.tryParse(usdController.text);
    double? price = double.tryParse(priceController.text);

    if (usd == null || price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter valid numeric values.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      setState(() {
        result = usd * price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter (USD to PKR)'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/home2.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Price of 1 USD in PKR',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: usdController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount in USD',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: IconButton(
                  onPressed: convertCurrency,
                  icon: Icon(Icons.currency_exchange),
                  tooltip: 'Convert',
                  iconSize: 50.0,
                  color: Colors.blue.shade200.withOpacity(1.0),
                ),
              ),

              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade200.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Result: ${result.toStringAsFixed(2)} PKR',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  'Developed by Mahnoor',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade200.withOpacity(1.0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
