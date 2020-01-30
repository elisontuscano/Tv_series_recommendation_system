 
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

[row , column] = size(splittedTable);

averageRating = table();
ratioTable = table();

counter = 0;

prev_user_id = 0 ;
unique_id_count = 0 ;
prev_movie_id = 0 ; 

for i = 1 : 716305 %For 1853 User
    table_to_cell = table2cell(splittedTable(i,1));
    user_id = cell2mat(table_to_cell);
    
    table_to_cell = table2cell(splittedTable(i,2));
    movieId = cell2mat(table_to_cell);
    
    table_to_cell = table2cell(splittedTable(i,3));
    rating = cell2mat(table_to_cell);
    
    
    table_to_cell = table2cell(splittedTable(i,5));
    genre = char(table_to_cell);
    
    
    if(prev_user_id == 0)
        unique_id_count = unique_id_count + 1 ;
        prev_user_id = user_id;
        prev_movie_id = movieId;
        movie_count = 1;
        
        Action_Count = 0;
        Action_Rating = 0 ;
        Adventure_Count = 0 ; 
        Adventure_Rating = 0;
        Animation_Count = 0 ; 
        Animation_Rating = 0;
        Children_Count = 0 ; 
        Children_Rating = 0;
        Comedy_Count = 0 ;
        Comedy_Rating = 0;
        Crime_Count = 0 ;
        Crime_Rating= 0;
        Documentary_Count= 0 ;
        Documentary_Rating= 0;
        Drama_Count = 0 ;
        Drama_Rating = 0;
        Fantasy_Count = 0 ; 
        Fantasy_Rating = 0;
        Film_Noir_Count = 0;
        Film_Noir_Rating = 0;
        Horror_Count = 0 ;
        Horror_Rating = 0;
        Musical_Count = 0;
        Musical_Rating = 0;
        Mystery_Count = 0 ; 
        Mystery_Rating = 0;
        Romance_Count = 0 ;
        Romance_Rating = 0;
        Sci_Fi_Count = 0 ; 
        Sci_Fi_Rating = 0;
        Thriller_Count = 0 ; 
        Thriller_Rating = 0 ;
        War_Count = 0 ;
        War_Rating = 0;
        Western_Count = 0 ;
        Western_Rating = 0 ;
        
        if (strcmp(genre ,'Action') == 1)
            Action_Count = Action_Count + 1 ;
            Action_Rating = Action_Rating + rating;
         
        elseif (strcmp(genre ,'Adventure') == 1)
                Adventure_Count = Adventure_Count + 1 ;
                Adventure_Rating = Adventure_Rating + rating;
        elseif (strcmp(genre ,'Animation') == 1)
            Animation_Count = Animation_Count + 1 ;
            Animation_Rating = Animation_Rating + rating;
        elseif(strcmp(genre ,'Children') == 1)
            Children_Count = Children_Count + 1 ;
            Children_Rating = Children_Rating + rating;
         elseif(strcmp(genre ,'Comedy') == 1)
            Comedy_Count = Comedy_Count + 1 ;
            Comedy_Rating = Comedy_Rating + rating;
         elseif(strcmp(genre ,'Crime') == 1)
            Crime_Count = Crime_Count + 1 ;
            Crime_Rating = Crime_Rating + rating;
         elseif(strcmp(genre ,'Documentary') == 1)
            Documentary_Count = Documentary_Count + 1 ;
            Documentary_Rating = Documentary_Rating + rating;
         elseif(strcmp(genre ,'Drama') == 1)
            Drama_Count = Drama_Count + 1 ;
            Drama_Rating = Drama_Rating + rating;
        elseif(strcmp(genre ,'Fantasy') == 1)
            Fantasy_Count = Fantasy_Count + 1 ;
            Fantasy_Rating = Fantasy_Rating + rating;
        elseif(strcmp(genre ,'Film-Noir') == 1)
            Film_Noir_Count = Film_Noir_Count + 1 ;
            Film_Noir_Rating = Film_Noir_Rating + rating;
        elseif(strcmp(genre ,'Horror') == 1)
            Horror_Count = Horror_Count + 1 ;
            Horror_Rating = Horror_Rating + rating;
        elseif(strcmp(genre ,'Musical') == 1)
            Musical_Count = Musical_Count + 1 ;
            Musical_Rating = Musical_Rating + rating;
        elseif(strcmp(genre ,'Mystery') == 1)
            Mystery_Count = Mystery_Count + 1 ;
            Mystery_Rating = Mystery_Rating + rating;
        elseif(strcmp(genre ,'Romance') == 1)
            Romance_Count = Romance_Count + 1 ;
            Romance_Rating = Romance_Rating + rating;
        elseif(strcmp(genre ,'Sci-Fi') == 1)
            Sci_Fi_Count = Sci_Fi_Count + 1 ;
            Sci_Fi_Rating = Sci_Fi_Rating + rating;
        elseif(strcmp(genre ,'Thriller') == 1)
            Thriller_Count = Thriller_Count + 1 ;
            Thriller_Rating = Thriller_Rating + rating;
        elseif(strcmp(genre ,'War') == 1)
            War_Count = War_Count + 1 ;
            War_Rating = War_Rating + rating;
        elseif(strcmp(genre ,'Western') == 1)
            Western_Count = Western_Count + 1 ;
            Western_Rating = Western_Rating + rating;
        else
        end
             
             
    elseif (user_id == prev_user_id)
        if(prev_movie_id ~= movieId)
            prev_movie_id = movieId;
            movie_count = movie_count + 1;
        end
        
        if (strcmp(genre ,'Action') == 1)
            Action_Count = Action_Count + 1 ;
            Action_Rating = Action_Rating + rating;
         
        elseif (strcmp(genre ,'Adventure') == 1)
                Adventure_Count = Adventure_Count + 1 ;
                Adventure_Rating = Adventure_Rating + rating;
        elseif (strcmp(genre ,'Animation') == 1)
            Animation_Count = Animation_Count + 1 ;
            Animation_Rating = Animation_Rating + rating;
        elseif(strcmp(genre ,'Children') == 1)
            Children_Count = Children_Count + 1 ;
            Children_Rating = Children_Rating + rating;
         elseif(strcmp(genre ,'Comedy') == 1)
            Comedy_Count = Comedy_Count + 1 ;
            Comedy_Rating = Comedy_Rating + rating;
         elseif(strcmp(genre ,'Crime') == 1)
            Crime_Count = Crime_Count + 1 ;
            Crime_Rating = Crime_Rating + rating;
         elseif(strcmp(genre ,'Documentary') == 1)
            Documentary_Count = Documentary_Count + 1 ;
            Documentary_Rating = Documentary_Rating + rating;
         elseif(strcmp(genre ,'Drama') == 1)
            Drama_Count = Drama_Count + 1 ;
            Drama_Rating = Drama_Rating + rating;
        elseif(strcmp(genre ,'Fantasy') == 1)
            Fantasy_Count = Fantasy_Count + 1 ;
            Fantasy_Rating = Fantasy_Rating + rating;
        elseif(strcmp(genre ,'Film-Noir') == 1)
            Film_Noir_Count = Film_Noir_Count + 1 ;
            Film_Noir_Rating = Film_Noir_Rating + rating;
        elseif(strcmp(genre ,'Horror') == 1)
            Horror_Count = Horror_Count + 1 ;
            Horror_Rating = Horror_Rating + rating;
        elseif(strcmp(genre ,'Musical') == 1)
            Musical_Count = Musical_Count + 1 ;
            Musical_Rating = Musical_Rating + rating;
        elseif(strcmp(genre ,'Mystery') == 1)
            Mystery_Count = Mystery_Count + 1 ;
            Mystery_Rating = Mystery_Rating + rating;
        elseif(strcmp(genre ,'Romance') == 1)
            Romance_Count = Romance_Count + 1 ;
            Romance_Rating = Romance_Rating + rating;
        elseif(strcmp(genre ,'Sci-Fi') == 1)
            Sci_Fi_Count = Sci_Fi_Count + 1 ;
            Sci_Fi_Rating = Sci_Fi_Rating + rating;
        elseif(strcmp(genre ,'Thriller') == 1)
            Thriller_Count = Thriller_Count + 1 ;
            Thriller_Rating = Thriller_Rating + rating;
        elseif(strcmp(genre ,'War') == 1)
            War_Count = War_Count + 1 ;
            War_Rating = War_Rating + rating;
        elseif(strcmp(genre ,'Western') == 1)
            Western_Count = Western_Count + 1 ;
            Western_Rating = Western_Rating + rating;
        else
        end
        
    elseif (user_id ~= prev_user_id)
        prev_user_id
        cellPatients = {'userid',...
            'Action',...
            'Adventure',...
            'Animation',...
            'Children',...
            'Comedy',...
            'Crime',...
            'Documentary',...
            'Drama',...
            'Fantasy',...
            'Film_Noir',...
            'Horror',...
            'Musical',...
            'Mystery',...
            'Romance',...
            'Sci_Fi',...
            'Thriller',...
            'War',...
            'Western' ;
            prev_user_id,...
            Action_Rating/Action_Count ,...
            Adventure_Rating/Adventure_Count ,...
            Animation_Rating/Animation_Count,...
            Children_Rating /Children_Count  ,...
            Comedy_Rating /Comedy_Count  ,...
            Crime_Rating/Crime_Count  ,...
            Documentary_Rating/Documentary_Count ,...
            Drama_Rating /Drama_Count  ,...
            Fantasy_Rating/Fantasy_Count  ,...
            Film_Noir_Rating /Film_Noir_Count  ,...
            Horror_Rating/Horror_Count  ,...
            Musical_Rating /Musical_Count  ,...
            Mystery_Rating/Mystery_Count  ,...
            Romance_Rating/Romance_Count  ,...
            Sci_Fi_Rating / Sci_Fi_Count ,...
            Thriller_Rating /Thriller_Count ,...
            War_Rating / War_Count ,...
            Western_Rating /Western_Count  ,...
            };
        T2 = cell2table(cellPatients(2:end,:));
        T2.Properties.VariableNames = cellPatients(1,:);

        averageRating = [averageRating;T2];
        
        cellPatients = {'userid',...
            'Action',...
            'Adventure',...
            'Animation',...
            'Children',...
            'Comedy',...
            'Crime',...
            'Documentary',...
            'Drama',...
            'Fantasy',...
            'Film_Noir',...
            'Horror',...
            'Musical',...
            'Mystery',...
            'Romance',...
            'Sci_Fi',...
            'Thriller',...
            'War',...
            'Western' ;
            prev_user_id,...
            Action_Count/movie_count ,...
            Adventure_Count/movie_count ,...
            Animation_Count/movie_count,...
            Children_Count/movie_count  ,...
            Comedy_Count/movie_count  ,...
            Crime_Count/movie_count  ,...
            Documentary_Count/movie_count ,...
            Drama_Count/movie_count  ,...
            Fantasy_Count/movie_count  ,...
            Film_Noir_Count/movie_count  ,...
            Horror_Count/movie_count  ,...
            Musical_Count/movie_count  ,...
            Mystery_Count/movie_count  ,...
            Romance_Count/movie_count  ,...
            Sci_Fi_Count/movie_count ,...
            Thriller_Count/movie_count ,...
            War_Count/movie_count ,...
            Western_Count/movie_count  ,...
            };
        T2 = cell2table(cellPatients(2:end,:));
        T2.Properties.VariableNames = cellPatients(1,:);

        ratioTable = [ratioTable;T2];
        
        unique_id_count = unique_id_count + 1 ;
        prev_user_id = user_id;
        prev_movie_id = movieId;
        movie_count = 1;
        
        Action_Count = 0;
        Action_Rating = 0 ;
        Adventure_Count = 0 ; 
        Adventure_Rating = 0;
        Animation_Count = 0 ; 
        Animation_Rating = 0;
        Children_Count = 0 ; 
        Children_Rating = 0;
        Comedy_Count = 0 ;
        Comedy_Rating = 0;
        Crime_Count = 0 ;
        Crime_Rating= 0;
        Documentary_Count= 0 ;
        Documentary_Rating= 0;
        Drama_Count = 0 ;
        Drama_Rating = 0;
        Fantasy_Count = 0 ; 
        Fantasy_Rating = 0;
        Film_Noir_Count = 0;
        Film_Noir_Rating = 0;
        Horror_Count = 0 ;
        Horror_Rating = 0;
        Musical_Count = 0;
        Musical_Rating = 0;
        Mystery_Count = 0 ; 
        Mystery_Rating = 0;
        Romance_Count = 0 ;
        Romance_Rating = 0;
        Sci_Fi_Count = 0 ; 
        Sci_Fi_Rating = 0;
        Thriller_Count = 0 ; 
        Thriller_Rating = 0 ;
        War_Count = 0 ;
        War_Rating = 0;
        Western_Count = 0 ;
        Western_Rating = 0 ;
        
        if (strcmp(genre ,'Action') == 1)
            Action_Count = Action_Count + 1 ;
            Action_Rating = Action_Rating + rating;
         
        elseif (strcmp(genre ,'Adventure') == 1)
                Adventure_Count = Adventure_Count + 1 ;
                Adventure_Rating = Adventure_Rating + rating;
        elseif (strcmp(genre ,'Animation') == 1)
            Animation_Count = Animation_Count + 1 ;
            Animation_Rating = Animation_Rating + rating;
        elseif(strcmp(genre ,'Children') == 1)
            Children_Count = Children_Count + 1 ;
            Children_Rating = Children_Rating + rating;
         elseif(strcmp(genre ,'Comedy') == 1)
            Comedy_Count = Comedy_Count + 1 ;
            Comedy_Rating = Comedy_Rating + rating;
         elseif(strcmp(genre ,'Crime') == 1)
            Crime_Count = Crime_Count + 1 ;
            Crime_Rating = Crime_Rating + rating;
         elseif(strcmp(genre ,'Documentary') == 1)
            Documentary_Count = Documentary_Count + 1 ;
            Documentary_Rating = Documentary_Rating + rating;
         elseif(strcmp(genre ,'Drama') == 1)
            Drama_Count = Drama_Count + 1 ;
            Drama_Rating = Drama_Rating + rating;
        elseif(strcmp(genre ,'Fantasy') == 1)
            Fantasy_Count = Fantasy_Count + 1 ;
            Fantasy_Rating = Fantasy_Rating + rating;
        elseif(strcmp(genre ,'Film-Noir') == 1)
            Film_Noir_Count = Film_Noir_Count + 1 ;
            Film_Noir_Rating = Film_Noir_Rating + rating;
        elseif(strcmp(genre ,'Horror') == 1)
            Horror_Count = Horror_Count + 1 ;
            Horror_Rating = Horror_Rating + rating;
        elseif(strcmp(genre ,'Musical') == 1)
            Musical_Count = Musical_Count + 1 ;
            Musical_Rating = Musical_Rating + rating;
        elseif(strcmp(genre ,'Mystery') == 1)
            Mystery_Count = Mystery_Count + 1 ;
            Mystery_Rating = Mystery_Rating + rating;
        elseif(strcmp(genre ,'Romance') == 1)
            Romance_Count = Romance_Count + 1 ;
            Romance_Rating = Romance_Rating + rating;
        elseif(strcmp(genre ,'Sci-Fi') == 1)
            Sci_Fi_Count = Sci_Fi_Count + 1 ;
            Sci_Fi_Rating = Sci_Fi_Rating + rating;
        elseif(strcmp(genre ,'Thriller') == 1)
            Thriller_Count = Thriller_Count + 1 ;
            Thriller_Rating = Thriller_Rating + rating;
        elseif(strcmp(genre ,'War') == 1)
            War_Count = War_Count + 1 ;
            War_Rating = War_Rating + rating;
        elseif(strcmp(genre ,'Western') == 1)
            Western_Count = Western_Count + 1 ;
            Western_Rating = Western_Rating + rating;
        else
        end
        
    end
        
    
end

%making NAN to zero
averageRating{:,:}(isnan(averageRating{:,:})) = 0;


writetable(averageRating , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\averageRating_1853User.xls');
writetable(ratioTable , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\ratioTable_1853User.xls');


