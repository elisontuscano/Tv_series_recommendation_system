datatable = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\TV Data With Episode and Vote Count And IMDB ID.xls');
datatableforfis = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\TV Data With Episode and Vote Count And IMDB ID.xls');
pfis = readfis('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 4 TV Data\FIS\TVPopularity.fis');
tfis = readfis('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 4 TV Data\FIS\popularity plus NoOfEpisodesNew.fis');

totalruntime = table();

ratings = datatableforfis(:,3);
vote = datatableforfis(:,7);
epino = datatableforfis(:,6);

popularity = evalfis([ratings vote], pfis);
desirability = evalfis([popularity epino], tfis);

valueset = {'Popularity', 'Desirability'};
temptable = table(popularity, 'VariableNames', valueset(1));

datatable = [datatable temptable];

temptable = table(desirability, 'VariableNames', valueset(2));

datatable = [datatable temptable];

writetable(datatable, 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\TV data with Desirability.xls');

% rating_left_join_genre(:,'ImdbId_ratings') = [];
% rating_left_join_genre.Properties.VariableNames{7} = 'ImdbId';
% datatable(:,'ID') = [];
% datatable(:,'TVTitle') = [];
% datatable(:,'Rating') = [];
% datatable(:,'Runtime') = [];
% datatable(:,'Genre') = [];
% datatable(:,'EpisodesCount') = [];
% datatable(:,'Votes') = [];
% datatable(:,'Popularity') = [];
