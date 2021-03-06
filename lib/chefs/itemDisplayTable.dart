import 'package:maps/models/itemListingModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemsListTable extends StatelessWidget {
  List<ItemListingModel> itemListings;

  ItemsListTable({this.itemListings});
  
  List<DataRow> itemsRows=new List();

  Widget build(BuildContext context) {
    for (var itemobj in itemListings) {
      itemsRows.add(DataRow(cells: [DataCell(Text('${itemobj.itemName}',style: TextStyle(color:Colors.grey[700],fontSize: 15),)),
      DataCell(Text('${itemobj.itemPrice}',style: TextStyle(color:Colors.grey[700],fontSize: 15),)),],));
      
    }
  print (itemListings.length);
    return (itemListings == null)
        ? CupertinoActivityIndicator()
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
    label: const Text('Item',style: TextStyle(fontSize: 16),),
    
  ),
  DataColumn(
    label: const Text('Price',style: TextStyle(fontSize: 16),),
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
      DataCell(Text('${itemElement.itemName}',style: TextStyle(color:Colors.grey[700],fontSize: 15),)),
      DataCell(Text("\u20B9 ${itemElement.itemPrice}",style: TextStyle(color:Colors.grey[700],fontSize: 15),)),
     
  
    ]);
  }

  @override
  int get rowCount => source.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
