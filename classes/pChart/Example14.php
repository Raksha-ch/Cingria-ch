<?php
 /*
     Example14: A smooth flat pie graph
 */

 // Standard inclusions
 include("pChart/pData.class");
 include("pChart/pChart.class");

 // Dataset definition
 $DataSet = new pData;
 $DataSet->AddPoint(array(60,5,35),"Serie1");
 $DataSet->AddPoint(array("Unavail.","Available","Booked"),"Serie2");
 $DataSet->AddAllSeries();
 $DataSet->SetAbsciseLabelSerie("Serie2");

 // Initialise the graph
 $Test = new pChart(300,200);
 $Test->loadColorPalette("Sample/myverbtones.txt");
 $Test->drawFilledRoundedRectangle(7,7,293,193,5,240,240,240);
 $Test->drawRoundedRectangle(5,5,295,195,5,230,230,230);

 // This will draw a shadow under the pie chart
 $Test->drawFilledCircle(122,102,70,200,200,200);

 // Draw the pie chart
 $Test->setFontProperties("Fonts/tahoma.ttf",8);
 $Test->AntialiasQuality = 0;
 $Test->drawBasicPieGraph($DataSet->GetData(),$DataSet->GetDataDescription(),120,100,70,PIE_PERCENTAGE,255,255,255);
 $Test->drawPieLegend(205,15,$DataSet->GetData(),$DataSet->GetDataDescription(),250,250,250);

 $Test->Render("availability_chart.png");
?>

<img src="availability_chart.png">