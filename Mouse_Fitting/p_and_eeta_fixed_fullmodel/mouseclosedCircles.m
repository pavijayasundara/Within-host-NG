function f=mouseclosedCircles()
NGdataclosedCircles=[5.53014553;5.617463617;3.318087318;1.440748441;2.823284823;3.507276507;...
    3.812889813;5.108108108;6.417879418;];
 
PMNdataclosedCircles=[8.438520438;28.63802284;66.71566698;39.01839791;2.232807724;...
    0.123285819;0.007813058;4.174663815;10^-3];%adjusted PMN data per 100 cells
PMNdataclosedCircles=log10(PMNdataclosedCircles);

f=[NGdataclosedCircles,PMNdataclosedCircles]
end