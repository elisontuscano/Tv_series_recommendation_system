x = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 6 Anfis Ready\Clusters\cluster2.xls');

x(:,'Reviewer_ID') = [];
x(:,'Cluster_No') = [];
x(:,'ImdbId') = [];

inputTable = x(1:2043 , :);
outputTable = x(2044:2045 , :);

anfisTrain = table2array(inputTable);
anfisTest = table2array(outputTable);

anfisedit;