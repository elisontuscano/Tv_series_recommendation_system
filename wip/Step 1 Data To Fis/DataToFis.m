clc
clear
clc

Model = readfis('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Project\Journey Begins\Data Sets\Manipulated Data\Matlab Works\Initial Rules.fis');
ratings = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Project\Journey Begins\Data Sets\Manipulated Data\Data_Lord\Ratings.ods');
ratio = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Project\Journey Begins\Data Sets\Manipulated Data\Data_Lord\ratio.xls');

valueSet =   {'Action', 'Adventure', 'Animation', 'Children', 'Comedy', 'Crime', 'Documantary', 'Drama', 'Fantasy', 'Film_Noir', 'Horror', 'Musical', 'Mystery', 'Romance', 'Sci_Fi', 'Thriller', 'War', 'Western'};
keySet = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18];
mapObj = containers.Map(keySet,valueSet);
%arr = zeros(18);
%dataTable := array(....);
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
writetable(dataTable , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Project\Journey Begins\Data Sets\Manipulated Data\Data_Lord\fisDataTableNew.csv');
