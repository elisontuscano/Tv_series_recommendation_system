%tvData = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\TV data with Desirability.xls');
%movie_tv_Rating = xlsread('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\IMDB DataSet\Data Collected\movie_Ratings.csv');

% tvData(:,'ID') = [];
% tvData(:,'TVTitle') = [];
% tvData(:,'Runtime') = [];
% tvData(:,'EpisodesCount') = [];
% tvData(:,'Votes') = [];
% tvData(:,'Popularity') = [];

%ImdbId = array2table(movie_tv_Rating(:,3));
%Reviewer_ID = array2table(movie_tv_Rating(:,7));



% ImdbIdvsReviewer_ID = table();
% ImdbIdvsReviewer_ID = [ImdbIdvsReviewer_ID ImdbId];
% ImdbIdvsReviewer_ID.Properties.VariableNames{1} = 'ImdbId';
% ImdbIdvsReviewer_ID = [ImdbIdvsReviewer_ID Reviewer_ID];
% ImdbIdvsReviewer_ID.Properties.VariableNames{2} = 'Reviewer_ID';

% tv_vs_Rating_join = outerjoin(tvData , ImdbIdvsReviewer_ID , 'Type' , 'left' );
% tv_vs_Rating_join(:,'ImdbId_ImdbIdvsReviewer_ID') = [];
% tv_vs_Rating_join.Properties.VariableNames{3} = 'ImdbId';
% tv_vs_Rating_join = sortrows(tv_vs_Rating_join,'ImdbId','ascend');

% T = tv_vs_Rating_join ;
% 
% tv_vs_Rating_join = unique(T);

% [row, column] = size(tv_vs_Rating_join);
% 
% splittedAnfisInput = table();
% 
% for i = 1 : row
%     
%     i
%     table_to_cell = table2cell(tv_vs_Rating_join(i,5));
%     Reviewer_ID = cell2mat(table_to_cell);
%     
%     table_to_cell = table2cell(tv_vs_Rating_join(i,1));
%     Rating = cell2mat(table_to_cell);
%     
%     table_to_cell = table2cell(tv_vs_Rating_join(i,3));
%     ImdbId = cell2mat(table_to_cell);
%     
%     table_to_cell = table2cell(tv_vs_Rating_join(i,4));
%     Desiribility = cell2mat(table_to_cell);
%     
%     
%     table_to_cell = table2cell(tv_vs_Rating_join(i,2));
%     cell_to_string = char(table_to_cell);
%     splitted_genre = strsplit(cell_to_string , '|');
%       
%     [garbage , no_of_string] = size(splitted_genre);
%     
%     for j = 1 : no_of_string
%         cellPatients = {'Reviewer_ID', 'ImdbId','Genre','Rating' , 'Desirability' ; Reviewer_ID ,ImdbId, splitted_genre(j),Rating,Desiribility};
%         T2 = cell2table(cellPatients(2:end,:));
%         T2.Properties.VariableNames = cellPatients(1,:);
% 
%         splittedAnfisInput = [splittedAnfisInput;T2];
%        
%     end
% end
% 
% splittedAnfisInput = sortrows(splittedAnfisInput,'Reviewer_ID','ascend');


% x = splittedAnfisInput(:,2);
% y = splittedAnfisInput(:,3) ;
% 
% validTV = table();
% validTV = [validTV x];
% 
% validTV = [validTV y];
% 
% validTV = sortrows(validTV,'ImdbId','ascend');


% validTV = unique(validTV);
% 
% tvTruthTable = table();
% counter = 0;
% 
% [row , column] = size(validTV);
% 
% prev_TV_id = 0 ;
% unique_id_count = 0 ;
% 
% for i = 1 : row %For all TV rated by IMDB User
%     
%     
%     table_to_cell = table2cell(validTV(i,1));
%     ImdbId = cell2mat(table_to_cell);
%     
%     table_to_cell = table2cell(validTV(i,2));
%     genre = char(table_to_cell);
%     
%     
%     if(prev_TV_id == 0)
%         unique_id_count = unique_id_count + 1 ;
%         prev_TV_id = ImdbId;
%         movie_count = 1;
%         
%         Action = 0;
%         Adventure = 0 ; 
%         Animation = 0 ; 
%         Children = 0 ; 
%         Comedy = 0 ;
%         Crime = 0 ;
%         Documentary= 0 ;
%         Drama = 0 ;
%         Fantasy = 0 ; 
%         Film_Noir = 0;
%         Horror = 0 ;
%         Musical = 0;
%         Mystery = 0;
%         Romance = 0;
%         Sci_Fi = 0;
%         Thriller = 0 ; 
%         War = 0 ;
%         Western = 0 ;
%         
%         if (strcmp(genre ,'Action') == 1)
%             Action = 1 ;
%            
%          
%         elseif (strcmp(genre ,'Adventure') == 1)
%                 Adventure = 1 ;
%                
%         elseif (strcmp(genre ,'Animation') == 1)
%             Animation = 1 ;
%             
%         elseif(strcmp(genre ,'Children') == 1)
%             Children = 1 ;
%          
%          elseif(strcmp(genre ,'Comedy') == 1)
%             Comedy =  1 ;
% 
%          elseif(strcmp(genre ,'Crime') == 1)
%             Crime =  1 ;
%  
%          elseif(strcmp(genre ,'Documentary') == 1)
%             Documentary =  1 ;
% 
%          elseif(strcmp(genre ,'Drama') == 1)
%             Drama =  1 ;
%  
%         elseif(strcmp(genre ,'Fantasy') == 1)
%             Fantasy =  1 ;
% 
%         elseif(strcmp(genre ,'Film-Noir') == 1)
%             Film_Noir = 1 ;
%  
%         elseif(strcmp(genre ,'Horror') == 1)
%             Horror =  1 ;
% 
%         elseif(strcmp(genre ,'Musical') == 1)
%             Musical =  1 ;
%  
%         elseif(strcmp(genre ,'Mystery') == 1)
%             Mystery = 1 ;
% 
%         elseif(strcmp(genre ,'Romance') == 1)
%             Romance = 1 ;
%             
%         elseif(strcmp(genre ,'Sci-Fi') == 1)
%             Sci_Fi = 1 ;
% 
%         elseif(strcmp(genre ,'Thriller') == 1)
%             Thriller =  1 ;
% 
%         elseif(strcmp(genre ,'War') == 1)
%             War =  1 ;
% 
%         elseif(strcmp(genre ,'Western') == 1)
%             Western =  1 ;
% 
%         else
%         end
%              
%              
%     elseif (ImdbId == prev_TV_id)
%         
%         if (strcmp(genre ,'Action') == 1)
%             Action = 1 ;
%            
%          
%         elseif (strcmp(genre ,'Adventure') == 1)
%                 Adventure = 1 ;
%                
%         elseif (strcmp(genre ,'Animation') == 1)
%             Animation = 1 ;
%             
%         elseif(strcmp(genre ,'Children') == 1)
%             Children = 1 ;
%          
%          elseif(strcmp(genre ,'Comedy') == 1)
%             Comedy =  1 ;
% 
%          elseif(strcmp(genre ,'Crime') == 1)
%             Crime =  1 ;
%  
%          elseif(strcmp(genre ,'Documentary') == 1)
%             Documentary =  1 ;
% 
%          elseif(strcmp(genre ,'Drama') == 1)
%             Drama =  1 ;
%  
%         elseif(strcmp(genre ,'Fantasy') == 1)
%             Fantasy =  1 ;
% 
%         elseif(strcmp(genre ,'Film-Noir') == 1)
%             Film_Noir = 1 ;
%  
%         elseif(strcmp(genre ,'Horror') == 1)
%             Horror =  1 ;
% 
%         elseif(strcmp(genre ,'Musical') == 1)
%             Musical =  1 ;
%  
%         elseif(strcmp(genre ,'Mystery') == 1)
%             Mystery = 1 ;
% 
%         elseif(strcmp(genre ,'Romance') == 1)
%             Romance = 1 ;
%             
%         elseif(strcmp(genre ,'Sci-Fi') == 1)
%             Sci_Fi = 1 ;
% 
%         elseif(strcmp(genre ,'Thriller') == 1)
%             Thriller =  1 ;
% 
%         elseif(strcmp(genre ,'War') == 1)
%             War =  1 ;
% 
%         elseif(strcmp(genre ,'Western') == 1)
%             Western =  1 ;
% 
%         else
%         end
%         
%     elseif (ImdbId ~= prev_TV_id)
%         prev_TV_id
%         cellPatients = {'ImdbId',...
%             'isAction',...
%             'isAdventure',...
%             'isAnimation',...
%             'isChildren',...
%             'isComedy',...
%             'isCrime',...
%             'isDocumentary',...
%             'isDrama',...
%             'isFantasy',...
%             'isFilm_Noir',...
%             'isHorror',...
%             'isMusical',...
%             'isMystery',...
%             'isRomance',...
%             'isSci_Fi',...
%             'isThriller',...
%             'isWar',...
%             'isWestern';
%             prev_TV_id,...
%             Action ,...
%             Adventure ,...
%             Animation,...
%             Children  ,...
%             Comedy  ,...
%             Crime  ,...
%             Documentary ,...
%             Drama  ,...
%             Fantasy ,...
%             Film_Noir  ,...
%             Horror  ,...
%             Musical  ,...
%             Mystery  ,...
%             Romance  ,...
%             Sci_Fi ,...
%             Thriller ,...
%             War ,...
%             Western
%             };
%         T2 = cell2table(cellPatients(2:end,:));
%         T2.Properties.VariableNames = cellPatients(1,:);
% 
%         tvTruthTable = [tvTruthTable;T2];
%         
%         
%         
%         unique_id_count = unique_id_count + 1 ;
%         prev_TV_id = ImdbId;
%         movie_count = 1;
%         
%         Action = 0;
%         Adventure = 0 ; 
%         Animation = 0 ; 
%         Children = 0 ; 
%         Comedy = 0 ;
%         Crime = 0 ;
%         Documentary= 0 ;
%         Drama = 0 ;
%         Fantasy = 0 ; 
%         Film_Noir = 0;
%         Horror = 0 ;
%         Musical = 0;
%         Mystery = 0;
%         Romance = 0;
%         Sci_Fi = 0;
%         Thriller = 0 ; 
%         War = 0 ;
%         Western = 0 ;
%         
%         if (strcmp(genre ,'Action') == 1)
%             Action = 1 ;
%            
%          
%         elseif (strcmp(genre ,'Adventure') == 1)
%                 Adventure = 1 ;
%                
%         elseif (strcmp(genre ,'Animation') == 1)
%             Animation = 1 ;
%             
%         elseif(strcmp(genre ,'Children') == 1)
%             Children = 1 ;
%          
%          elseif(strcmp(genre ,'Comedy') == 1)
%             Comedy =  1 ;
% 
%          elseif(strcmp(genre ,'Crime') == 1)
%             Crime =  1 ;
%  
%          elseif(strcmp(genre ,'Documentary') == 1)
%             Documentary =  1 ;
% 
%          elseif(strcmp(genre ,'Drama') == 1)
%             Drama =  1 ;
%  
%         elseif(strcmp(genre ,'Fantasy') == 1)
%             Fantasy =  1 ;
% 
%         elseif(strcmp(genre ,'Film-Noir') == 1)
%             Film_Noir = 1 ;
%  
%         elseif(strcmp(genre ,'Horror') == 1)
%             Horror =  1 ;
% 
%         elseif(strcmp(genre ,'Musical') == 1)
%             Musical =  1 ;
%  
%         elseif(strcmp(genre ,'Mystery') == 1)
%             Mystery = 1 ;
% 
%         elseif(strcmp(genre ,'Romance') == 1)
%             Romance = 1 ;
%             
%         elseif(strcmp(genre ,'Sci-Fi') == 1)
%             Sci_Fi = 1 ;
% 
%         elseif(strcmp(genre ,'Thriller') == 1)
%             Thriller =  1 ;
% 
%         elseif(strcmp(genre ,'War') == 1)
%             War =  1 ;
% 
%         elseif(strcmp(genre ,'Western') == 1)
%             Western =  1 ;
% 
%         else
%         end
%         
%     end
%         
%     
% end
% splittedAnfisInput(:,'Genre') = [];
% AnfisInputWithoutLikeliness = outerjoin(splittedAnfisInput , tvTruthTable , 'Type' , 'left');
% AnfisInputWithoutLikeliness = unique(AnfisInputWithoutLikeliness);

%Likeliness_IMDB_User_With_Cluster_No = readtable('C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\Likeliness_IMDB_User_With_Cluster_No.xls');

FinalAnfisInputWithCluster = outerjoin(AnfisInputWithoutLikeliness , Likeliness_IMDB_User_With_Cluster_No , 'Type' , 'left');
FinalAnfisInputWithCluster.Properties.VariableNames{1} = 'Reviewer_ID';
FinalAnfisInputWithCluster.Properties.VariableNames{2} = 'ImdbId';
FinalAnfisInputWithCluster(:,'Reviewer_ID_Likeliness_IMDB_User_With_Cluster_No') = [];
FinalAnfisInputWithCluster(:,'ImdbId_tvTruthTable') = [];
 FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:2 4:40 3 end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:2 4:39 3 40:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1 21 2:20 22:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:2 22 3:21 23:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1 4 2:3 5:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:4 23 5:22 24:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:5 24 6:23 25:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:6 25 7:24 26:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:7 26 8:25 27:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:8 27 9:26 28:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:9 28 10:27 29:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:10 29 11:28 30:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:11 30 12:29 31:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:12 31 13:30 32:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:13 32 14:31 33:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:14 33 15:32 34:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:15 34 16:33 35:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:16 35 17:34 36:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:17 36 18:35 37:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:18 37 19:36 38:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1:19 38 20:37 39:end]);
FinalAnfisInputWithCluster = FinalAnfisInputWithCluster(:,[1 41 2:40]);
FinalAnfisInputWithCluster = unique(FinalAnfisInputWithCluster);
writetable(FinalAnfisInputWithCluster , 'C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 0 All In One\FinalAnfisTrainingDataInput_WithExtraInfo.xls');
%need to delete some column after that 