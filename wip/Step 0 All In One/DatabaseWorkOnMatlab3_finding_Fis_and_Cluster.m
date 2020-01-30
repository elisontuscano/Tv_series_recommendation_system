
Model = readfis('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Initial Rules.fis');
rating = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\rating.xls');
ratio = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\ratio.xls');

valueSet =   {'Action', 'Adventure', 'Animation', 'Children', 'Comedy', 'Crime', 'Documantary', 'Drama', 'Fantasy', 'Film_Noir', 'Horror', 'Musical', 'Mystery', 'Romance', 'Sci_Fi', 'Thriller', 'War', 'Western'};
keySet = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
mapObj = containers.Map(keySet,valueSet);
dataTable = table();
for i = 1 : 18
    sRatings = rating(:, (i+1));
    sRatio = ratio(:, (i+1));
    x = evalfis([sRatings sRatio] , Model);
    tempTable = table(x , 'VariableNames' , valueSet(i));
    dataTable = [dataTable tempTable];
end

writetable(dataTable , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\fisDataTable.xls');

data = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\fisDataTable.xls');
[IDX , center] = kmeans(data , 10);
[m, n] = size(IDX);
clusterNo = table(IDX);
dataTable2 = [dataTable clusterNo];

final = table2array(dataTable2);

cluster1 = table();
cluster2 = table();
cluster3 = table();
cluster4 = table();
cluster5 = table();
cluster6 = table();
cluster7 = table();
cluster8 = table();
cluster9 = table();
cluster10 = table();

for i = 1 : m
    if (final(i,19) == 1)
        cluster1 = [cluster1 ; dataTable(i,:)];
    end
    if (final(i,19) == 2)
        cluster2 = [cluster2 ; dataTable(i,:)];
    end
    if (final(i,19) == 3)
        cluster3 = [cluster3 ; dataTable(i,:)];
    end
    if (final(i,19) == 4)
        cluster4 = [cluster4 ; dataTable(i,:)];
    end
    if (final(i,19) == 5)
        cluster5 = [cluster5 ; dataTable(i,:)];
    end
    if (final(i,19) == 6)
        cluster6 = [cluster6 ; dataTable(i,:)];
    end
    if (final(i,19) == 7)
        cluster7 = [cluster7 ; dataTable(i,:)];
    end
    if (final(i,19) == 8)
        cluster8 = [cluster8 ; dataTable(i,:)];
    end
    if (final(i,19) == 9)
        cluster9 = [cluster9 ; dataTable(i,:)];
    end
    if (final(i,19) == 10)
        cluster10 = [cluster10 ; dataTable(i,:)];
    end
end

writetable(cluster1 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster1.xls');
writetable(cluster2 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster2.xls');
writetable(cluster3 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster3.xls');
writetable(cluster4 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster4.xls');
writetable(cluster5 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster5.xls');
writetable(cluster6 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster6.xls');
writetable(cluster7 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster7.xls');
writetable(cluster8 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster8.xls');
writetable(cluster9 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster9.xls');
writetable(cluster10 , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster10.xls');

a = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster1.xls');
b = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster2.xls');
c = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster3.xls');
d = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster4.xls');
e = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster5.xls');
f = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster6.xls');
g = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster7.xls');
h = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster8.xls');
i = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster9.xls');
j = xlsread( 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters XLS\cluster10.xls');

save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster1.dat' a -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster2.dat' b -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster3.dat' c -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster4.dat' d -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster5.dat' e -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster6.dat' f -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster7.dat' g -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster8.dat' h -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster9.dat' i -ASCII
save 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Clusters DAT\cluster10.dat' j -ASCII

clusterTable = array2table(center);

writetable(clusterTable , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Cluster_Center.xls');
