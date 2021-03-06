import 'package:maps/models/itemListingModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/painting/text_style.dart' as painting;

class OrderItemsTable extends StatefulWidget {
  List<dynamic> itemListings;
  OrderItemsTable({Key key, this.itemListings}) : super(key: key);

  @override
  _OrderItemsTableState createState() =>
      _OrderItemsTableState(itemListings: itemListings);
}

class _OrderItemsTableState extends State<OrderItemsTable> {
  List<dynamic> itemListings;

  _OrderItemsTableState({this.itemListings});
  

  List<DataRow> itemsRows=new List();

  _buildRows(){
    for (var itemobj in itemListings) {
      var totalcost=itemobj['quantity'] * itemobj['itemPrice']??0;
      itemsRows.add(DataRow(cells: [DataCell(Text('${itemobj['itemName']}',style: painting.TextStyle(color:Colors.grey[700],fontSize: 15),)),
      DataCell(Text('${itemobj['quantity']??1}',style: painting.TextStyle(color:Colors.grey[700],fontSize: 15),)),
      DataCell(Text("${totalcost}",style: painting.TextStyle(color:Colors.grey[700],fontSize: 15),)),
      ],));
      
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buildRows();
  }
  @override
  Widget build(BuildContext context) {
  print (itemListings.length);
    return (itemListings == null)
        ? CircularProgressIndicator()
        : SingleChildScrollView(
            child: DataTable(
            
              
          columns: kTableColumns,
             
             rows: itemsRows,
             // rows: ItemTableDataSource(source: itemListings),
            ),
          );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text('Item Name',style: painting.TextStyle(fontSize: 16),),
    
  ),
  DataColumn(
    label: const Text('Qty',style: painting.TextStyle(fontSize: 16),),
    tooltip: 'Quantity',
    numeric: true,
  ),
  
  DataColumn(
    label: const Text('Price (\u20B9)',style: painting.TextStyle(fontSize: 16),),
    tooltip: 'Price',
    numeric: true,
  ),
];

////// Data source class for obtaining row data for PaginatedDataTable.
class ItemTableDataSource extends DataTableSource {
  int _selectedCount = 0;

  ItemTableDataSource({
    this.source,
  });
  List<ItemListingModel> source;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= source.length) return null;
    final ItemListingModel itemElement = source[index];
    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text('${itemElement.itemName}',style: painting.TextStyle(color:Colors.grey[700],fontSize: 15),)),
      DataCell(Text("\u20B9 ${itemElement.itemPrice}",style: painting.TextStyle(color:Colors.grey[700],fontSize: 15),)),
     
  
    ]);
  }

  @override
  int get rowCount => source.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
