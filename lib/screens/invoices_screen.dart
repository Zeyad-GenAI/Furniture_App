import 'package:flutter/material.dart';
import '../models/furniture_item.dart';
import '../models/invoice.dart';

class InvoicesScreen extends StatefulWidget {
  @override
  _InvoicesScreenState createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  int _selectedInvoiceIndex = 0;

  final List<Invoice> invoices = [
    Invoice(
      id: '17477537',
      date: DateTime(2025, 5, 20),
      items: [
        FurnitureItem(name: 'table', price: 1500.00, quantity: 1),
        FurnitureItem(name: 'chair', price: 700.00, quantity: 2),
      ],
      totalAmount: 2900.00,
    ),
    Invoice(
      id: '17477535',
      date: DateTime(2025, 5, 20),
      items: [
        FurnitureItem(name: 'sofa', price: 2500.00, quantity: 1),
        FurnitureItem(name: 'coffee table', price: 800.00, quantity: 1),
        FurnitureItem(name: 'lamp', price: 200.00, quantity: 5),
      ],
      totalAmount: 4300.00,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Furniture Store - Invoices',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF594137),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Responsive layout: use column for narrow screens, row for wide screens
          bool isWideScreen = constraints.maxWidth > 600;

          if (isWideScreen) {
            return Row(
              children: [
                _buildInvoiceList(constraints.maxWidth * 0.3),
                Expanded(child: _buildInvoiceDetails()),
              ],
            );
          } else {
            return Column(
              children: [
                Container(
                  height: 120,
                  child: _buildInvoiceListHorizontal(),
                ),
                Expanded(child: _buildInvoiceDetails()),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildInvoiceList(double width) {
    return Container(
      width: width,
      color: Color(0xFFE0E0E0),
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          return Container(
            margin: EdgeInsets.only(bottom: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedInvoiceIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _selectedInvoiceIndex == index
                      ? Color(0xFFB0B0B0)
                      : Color(0xFFD0D0D0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice #${invoice.id}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${invoice.date.day}/${invoice.date.month}/${invoice.date.year}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${invoice.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInvoiceListHorizontal() {
    return Container(
      color: Color(0xFFE0E0E0),
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          return Container(
            width: 160,
            margin: EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedInvoiceIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _selectedInvoiceIndex == index
                      ? Color(0xFFB0B0B0)
                      : Color(0xFFD0D0D0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invoice #${invoice.id}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${invoice.date.day}/${invoice.date.month}/${invoice.date.year}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '\$${invoice.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInvoiceDetails() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Invoice Header
            _buildInvoiceHeader(),
            SizedBox(height: 20),

            // Items Section
            Text(
              'Items:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),

            // Items List
            Expanded(
              child: _buildItemsList(),
            ),

            // Total Section
            _buildTotalSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoiceHeader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Invoice #${invoices[_selectedInvoiceIndex].id}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9D8980),
                  ),
                ),
              ),
              Text(
                'Date: ${invoices[_selectedInvoiceIndex].date.day}/${invoices[_selectedInvoiceIndex].date.month}/${invoices[_selectedInvoiceIndex].date.year}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice #${invoices[_selectedInvoiceIndex].id}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF594137),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Date: ${invoices[_selectedInvoiceIndex].date.day}/${invoices[_selectedInvoiceIndex].date.month}/${invoices[_selectedInvoiceIndex].date.year}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildItemsList() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool showTable = constraints.maxWidth > 500;

        if (showTable) {
          return Column(
            children: [
              // Table Header
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Item',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Qty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Price',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Total',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Items List
              Expanded(
                child: ListView.builder(
                  itemCount: invoices[_selectedInvoiceIndex].items.length,
                  itemBuilder: (context, index) {
                    final item = invoices[_selectedInvoiceIndex].items[index];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      margin: EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              item.name,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              '${item.quantity}',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '\$${item.price.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '\$${item.total.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          // Card layout for narrow screens
          return ListView.builder(
            itemCount: invoices[_selectedInvoiceIndex].items.length,
            itemBuilder: (context, index) {
              final item = invoices[_selectedInvoiceIndex].items[index];
              return Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Quantity: ${item.quantity}'),
                        Text('Price: \$${item.price.toStringAsFixed(2)}'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Total: \$${item.total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF594137),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildTotalSection() {
    return Column(
      children: [
        Divider(thickness: 1.5),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Total Amount: ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '\$${invoices[_selectedInvoiceIndex].totalAmount.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}