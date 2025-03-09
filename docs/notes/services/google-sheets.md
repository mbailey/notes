# Google Sheets


# Colour days

```
=weekday($A1,2)>5 # weekend
=weekday($A1,2)<=5 # weekday
```

```
# Victorian Public Holidays 2023
=OR($A1=date(2023,1,2),$A1=date(2023,1,26),$A1=date(2023,3,13),$A1=date(2023,4,7),$A1=date(2023,4,10),$A1=date(2023,4,25),$A1=date(2023,6,12),$A1=date(2023,9,29),$A1=date(2023,11,7),$A1=date(2023,12,25),$A1=date(2023,12,26))
```



## Show current day's row when sheet opened

```javascript
function onOpen() {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getActiveSheet();
  var today = new Date();
  var dataRange = sheet.getDataRange();
  var numRows = dataRange.getNumRows();
  var values = dataRange.getValues();
  for (var i = 1; i < numRows; i++) {
    if (values[i][0].getTime() == today.getTime()) {
      sheet.setActiveRange(dataRange.offset(i, 0, 1));
      break;
    }
  }
}
```