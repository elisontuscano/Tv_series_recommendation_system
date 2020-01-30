 
% %Dataset loading
%movies = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Movie Lens\movies.csv');
%ratings = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Movie Lens\ratings.csv');

% %Table to string code
% % str = table2cell(movies(1,3));
% % y = char(str);
% % z = strsplit(y , '|');

% % z(1)
% % [garbage no_of_string] = size(z)

% % Table to int 
% % str = table2cell(movies(1,1));
% % y = cell2mat(str)

% moviesVSratings = outerjoin(ratings, movies);
% 
% moviesVSratings(:,'timestamp') = [];
% moviesVSratings = sortrows(moviesVSratings,'userId','ascend');

[row column] = size(moviesVSratings);

splittedTable = table();
counter = 0;
for i = 1 : row
    table_to_cell = table2cell(moviesVSratings(i,1));
    user_id = cell2mat(table_to_cell);
    
    table_to_cell = table2cell(moviesVSratings(i,2));
    movie_id = cell2mat(table_to_cell);
    
    table_to_cell = table2cell(moviesVSratings(i,5));
    movie_title = char(table_to_cell);
    
    table_to_cell = table2cell(moviesVSratings(i,6));
    cell_to_string = char(table_to_cell);
    splitted_ratings = strsplit(cell_to_string , '|');
    
    table_to_cell = table2cell(moviesVSratings(i,3));
    rating = cell2mat(table_to_cell);
    
    
    
    
    [garbage , no_of_string] = size(splitted_ratings);
    
    for j = 1 : no_of_string
        cellPatients = {'userid','movieid', 'title' , 'genre', 'rating' ;user_id, movie_id , movie_title , splitted_ratings(j) , rating};
        T2 = cell2table(cellPatients(2:end,:));
        T2.Properties.VariableNames = cellPatients(1,:);

        splittedTable = [splittedTable;T2];
        
        counter = counter +1;
       
    end
    counter
end

