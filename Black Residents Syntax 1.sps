* Encoding: UTF-8.
GET
    FILE = '﻿/Users/lesrene/Desktop/Spring 2022/Datasets SPring 2022/archive (1)/Black Residents SPSS 1.sav'
DATASET NAME $data WINDOW = FRONT.
DATASET ACTIVATE $data.

* Chart Builder. 
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=State PercentBlack MISSING=LISTWISE REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: State=col(source(s), name("State"), unit.category()) 
  DATA: PercentBlack=col(source(s), name("PercentBlack")) 
  GUIDE: axis(dim(1), label("State")) 
  GUIDE: axis(dim(2), label("PercentBlack")) 
  GUIDE: text.title(label("Percent of Each State's Population Identifying as Black (in 2018)")) 
  SCALE: linear(dim(2), include(0)) 
  ELEMENT: interval(position(State*PercentBlack), shape.interior(shape.square)) 
END GPL.

GGRAPH 
  /GRAPHDATASET NAME="graphdataset" 
    VARIABLES=PercentBlack[LEVEL=scale] State[LEVEL=nominal] 
    MISSING=LISTWISE REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=VIZTEMPLATE(NAME="Choropleth of Means"[LOCATION=LOCAL] 
    MAPPING( "color"="PercentBlack"[DATASET="graphdataset"] 
    "Animation"="PercentBlack"[DATASET="graphdataset"] "Data_Key"="State"[DATASET="graphdataset"] 
    "Title"='Mean Percent of Population that Identifies as Black (in 2018)')) 
    VIZSTYLESHEET="Traditional"[LOCATION=LOCAL] 
    LABEL='CHOROPLETH OF MEANS: State-PercentBlack' 
    DEFAULTTEMPLATE=NO 
    VIZMAP="UnitedStates"[LOCATION=LOCAL TYPE=DATA mapkey="State" SHOWALLFEATURES=YES].

GGRAPH 
  /GRAPHDATASET NAME="graphdataset" 
    VARIABLES=PercentBlack[LEVEL=scale] State[LEVEL=nominal] 
    MISSING=LISTWISE REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=VIZTEMPLATE(NAME="2-D Dot Plot"[LOCATION=LOCAL] 
    MAPPING( "x"="State"[DATASET="graphdataset"] "y"="PercentBlack"[DATASET="graphdataset"] 
    "Title"='Mean Percent of Population that Identifies as Black (in 2018)')) 
    VIZSTYLESHEET="Traditional"[LOCATION=LOCAL] 
    LABEL='2-D DOT PLOT: State-PercentBlack' 
    DEFAULTTEMPLATE=NO.

GGRAPH 
  /GRAPHDATASET NAME="graphdataset" 
    VARIABLES=PercentBlack[LEVEL=scale] State[LEVEL=nominal] 
    MISSING=LISTWISE REPORTMISSING=NO 
  /GRAPHSPEC SOURCE=VIZTEMPLATE(NAME="Bar"[LOCATION=LOCAL] 
    MAPPING( "values"="PercentBlack"[DATASET="graphdataset"] 
    "categories"="State"[DATASET="graphdataset"] "Summary"="sum" "Title"='Mean Percent of Population '+ 
    'that Identifies as Black (in 2018)')) 
    VIZSTYLESHEET="Traditional"[LOCATION=LOCAL] 
    LABEL='BAR: State-PercentBlack' 
    DEFAULTTEMPLATE=NO.

