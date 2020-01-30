
data = xlsread('C:\Users\Anirudha\Desktop\fisDataTableNew.xls');

[IDX , center] = kmeans(data , 5);
clusterNo = table(IDX);
writetable(clusterNo , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 2 Fis To Cluster\IDvsCluster.txt');