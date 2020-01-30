Model = readfis('E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 5 Fissing IMDB Data\InitialFisForNewData.fis');
averageRating = xlsread('E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\averageRating_579_IMDB_User.xls');
ratioTable = xlsread('E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\ratioTable_579_IMDB_User.xls');

valueSet =   {'Action', 'Adventure', 'Animation', 'Children', 'Comedy', 'Crime', 'Documantary', 'Drama', 'Fantasy', 'Film_Noir', 'Horror', 'Musical', 'Mystery', 'Romance', 'Sci_Fi', 'Thriller', 'War', 'Western'};

likelinessTable = table();

for i = 1 : 18
    sRatings = averageRating(:, (i+1));
    sRatio = ratioTable(:, (i+1));
    x = evalfis([sRatings sRatio] , Model);
    tempTable = table(x , 'VariableNames' , valueSet(i));
    likelinessTable = [likelinessTable tempTable];
end
userIDTable = array2table(averageRating(:,1));
likelinessTable = [userIDTable likelinessTable];
likelinessTable.Properties.VariableNames{1} = 'Reviewer_ID';
writetable(likelinessTable, 'E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\Likeliness_IMDB_User.xls');