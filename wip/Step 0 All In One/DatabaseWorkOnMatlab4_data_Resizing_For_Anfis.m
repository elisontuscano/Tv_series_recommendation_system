%  ratings_TV_plus_Movie = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\movie_ratings.csv');
%  
%  ImdbID = ratings_TV_plus_Movie(:,3);
%  rating = ratings_TV_plus_Movie(:,6);
% 
%  ratings = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\movie_ratings.csv');
%  T = array2table(ImdbID);
%  T.Properties.VariableNames{1} = 'ImdbId';
%  ratings(:,'ImdbId') = [];
%  ratings = [ratings T];
%  
%  T = array2table(rating);
%  T.Properties.VariableNames{1} = 'Rating';
%  ratings(:,'Rating') = [];
%  ratings = [ratings T];

  
%genres_TV_plus_Movie = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\genres_1.csv');

% [row column] = size(genres_TV_plus_Movie);
% 
% splittedGenre = table();
% 
% for i = 1 : row
%     
%     
%     table_to_cell = table2cell(genres_TV_plus_Movie(i,1));
%     ImdbId = cell2mat(table_to_cell);
%     
%     
%     
%     table_to_cell = table2cell(genres_TV_plus_Movie(i,2));
%     cell_to_string = char(table_to_cell);
%     splitted_genre = strsplit(cell_to_string , '|');
%       
%     [garbage , no_of_string] = size(splitted_genre);
%     
%     for j = 1 : no_of_string
%         cellPatients = {'ImdbId', 'Genre' ; ImdbId , splitted_genre(j)};
%         T2 = cell2table(cellPatients(2:end,:));
%         T2.Properties.VariableNames = cellPatients(1,:);
% 
%         splittedGenre = [splittedGenre;T2];
%        
%     end
% end


%rating_left_join_genre = outerjoin(ratings , splittedGenre ,'Type','left');


anfisPreparationTable = outerjoin(datatable , rating_left_join_genre ,'Type','left');


