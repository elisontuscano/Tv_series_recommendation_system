 
%Dataset loading
movies = readtable('E:\NSU\163 Fall\CSE470\Research\Project\Data Set\Movie Lens\movies.csv');
ratings = readtable('E:\NSU\163 Fall\CSE470\Research\Project\Data Set\Movie Lens\ratings.csv');

%Table to string code
% str = table2cell(movies(1,3));
% y = char(str);
% z = strsplit(y , '|');

% z(1)
% [garbage no_of_string] = size(z)

% Table to int 
% str = table2cell(movies(1,1));
% y = cell2mat(str)

% moviesVSratings = outerjoin(ratings, movies);
% 
% moviesVSratings(:,'timestamp') = [];
% moviesVSratings = sortrows(moviesVSratings,'userId','ascend');

ratings(:,'timestamp') = [];
[row column] = size(movies);

splittedTable = table();

for i = 1 : row
    
    
    table_to_cell = table2cell(movies(i,1));
    movie_id = cell2mat(table_to_cell);
    
    table_to_cell = table2cell(movies(i,2));
    movie_title = char(table_to_cell);
    
    table_to_cell = table2cell(movies(i,3));
    cell_to_string = char(table_to_cell);
    splitted_genre = strsplit(cell_to_string , '|');
      
    [garbage , no_of_string] = size(splitted_genre);
    
    for j = 1 : no_of_string
        cellPatients = {'movieId', 'genre' ; movie_id , splitted_genre(j)};
        T2 = cell2table(cellPatients(2:end,:));
        T2.Properties.VariableNames = cellPatients(1,:);

        splittedTable = [splittedTable;T2];
       
    end
end

userVSratings = outerjoin(splittedTable, ratings);