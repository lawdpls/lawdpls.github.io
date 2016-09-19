* Encoding: UTF-8.
GET 
  FILE='cars_spss.sav'. 
DATASET NAME DataSet1 WINDOW=FRONT.  
* Chart Builder. 
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Weight MPG Manufacturer MISSING=LISTWISE 
    REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Weight=col(source(s), name("Weight")) 
  DATA: MPG=col(source(s), name("MPG")) 
  DATA: Manufacturer=col(source(s), name("Manufacturer"), unit.category()) 
  GUIDE: text.title( label( "Cars Sample" ) )
  GUIDE: axis(dim(1), label("Weight")) 
  GUIDE: axis(dim(2), label("MPG")) 
  SCALE: linear(dim(1), min(1200), max(5000) )
  SCALE: linear(dim(2), min(8), max(48) )
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("Manufacturer")) 
  ELEMENT: point(position(Weight*MPG), color.interior(Manufacturer), transparency.interior(transparency."0.5"), transparency.exterior(transparency."0.8"), size(Weight)) 
END GPL.