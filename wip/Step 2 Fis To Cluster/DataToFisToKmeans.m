clc
clear
clc
%Import full data from xls file
%A = importdata('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Project\Journey Begins\Data Sets\Movie Lens\ratings.csv')
%
Model = readfis('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Initial Rules.fis');
ratings = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Data_Lord\Ratings.ods');
ratio = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Data_Lord\ratio.xls');

valueSet =   {'Action', 'Adventure', 'Animation', 'Children', 'Comedy', 'Crime', 'Documantary', 'Drama', 'Fantasy', 'Film_Noir', 'Horror', 'Musical', 'Mystery', 'Romance', 'Sci_Fi', 'Thriller', 'War', 'Western'};

dataTable = table();
for i = 1 : 18
    sRatings = ratings(:, (i+1));
    sRatio = ratio(:, (i+1));
    x = evalfis([sRatings sRatio] , Model);
    tempTable = table(x , 'VariableNames' , valueSet(i));
    dataTable = [dataTable tempTable];
end

%dataTable = table(mapObj(1), mapObj(2), mapObj(3), mapObj(4), mapObj(5), mapObj(6), mapObj(7), mapObj(8), mapObj(9), mapObj(10), mapObj(11), mapObj(12), mapObj(13), mapObj(14), mapObj(15), mapObj(16), mapObj(17), mapObj(18));

%advRatings = ratings(:,3)

%sci_fi = evalfis([scifiRatings scifiRatio] , Model);

%dataTable = table(action, adventure, animation , children , comedy , document , drama , fantasy , flim_noir , horror , musical , mystery , romance , sci_fi , thriller , war , western);
writetable(dataTable , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Data_Lord\fisDataTableNew.csv');

data = xlsread('C:\Users\Anirudha\Desktop\fisDataTableNew.xls');

[IDX , center] = kmeans(data , 5);
%writetable(center , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Project\Journey Begins\Data Sets\Manipulated Data\Data_Lord\Center of Cluster.csv');
[m, n] = size(IDX);
clusterNo = table(IDX);
dataTable2 = [dataTable clusterNo];

final = table2array(dataTable2);
cluster1 = table();
cluster2 = table();
cluster3 = table();
cluster4 = table();
cluster5 = table();

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
end

writetable(cluster1 , 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster1.xls');
writetable(cluster2 , 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster2.xls');
writetable(cluster3 , 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster3.xls');
writetable(cluster4 , 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster4.xls');
writetable(cluster5 , 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster5.xls');

a = xlsread( 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster1.xls');
b = xlsread( 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster2.xls');
c = xlsread( 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster3.xls');
d = xlsread( 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster4.xls');
e = xlsread( 'C:\Users\Anirudha\Desktop\Clusters XLS\cluster5.xls');

save 'C:\Users\Anirudha\Desktop\cluster1.dat' a -ASCII
save 'C:\Users\Anirudha\Desktop\cluster2.dat' b -ASCII
save 'C:\Users\Anirudha\Desktop\cluster3.dat' c -ASCII
save 'C:\Users\Anirudha\Desktop\cluster4.dat' d -ASCII
save 'C:\Users\Anirudha\Desktop\cluster5.dat' e -ASCII

% xlswrite(a , 'C:\Users\Anirudha\Desktop\cluster1.dat' , true);
% xlswrite(b , 'C:\Users\Anirudha\Desktop\cluster1.dat', true);
% xlswrite(c , 'C:\Users\Anirudha\Desktop\cluster3.dat', true);
% xlswrite(d , 'C:\Users\Anirudha\Desktop\cluster4.dat', true);
% xlswrite(e , 'C:\Users\Anirudha\Desktop\cluster5.dat', true);

