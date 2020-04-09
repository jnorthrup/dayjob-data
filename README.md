fetch, decomopress:

```bash
wget 'https://github.com/jnorthrup/dayjob-data/blob/master/superannuated1909.fwf.zst?raw=true'
zstd -d superannuated1909.fwf.zst
```


test: (python)

```python
import pandas as pd;
d1names=['SalesNo', 'SalesAreaID', 'date', 'PluNo', 'ItemName', 'Quantity', 'Amount', 'TransMode']
d1=pd.read_fwf('superannuated1909.fwf', 
names=d1names, 
colspecs=[(0, 11), (11, 15), (15, 25), (25, 40), (40, 60), (60, 82), (82, 103), (103, 108)])
for i in d1names: print( (i,len( d1[i].unique() )) )
```


on my system:
```
Python 3.6.9 (default, Nov  7 2019, 10:44:02) 
[GCC 8.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pandas as pd;
>>> d1names=['SalesNo', 'SalesAreaID', 'date', 'PluNo', 'ItemName', 'Quantity', 'Amount', 'TransMode']
>>> d1=pd.read_fwf('superannuated1909.fwf', 
... names=d1names, 
... colspecs=[(0, 11), (11, 15), (15, 25), (25, 40), (40, 60), (60, 82), (82, 103), (103, 108)])
>>> for i in d1names: print( (i,len( d1[i].unique() )) )
... 
('SalesNo', 1149924)
('SalesAreaID', 70)
('date', 226)
('PluNo', 260)
('ItemName', 268)
('Quantity', 68)
('Amount', 83)
('TransMode', 3)
>>> 
```
