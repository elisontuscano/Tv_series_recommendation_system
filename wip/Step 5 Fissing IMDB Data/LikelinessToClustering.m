
likelinessTable = xlsread('E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\Likeliness_IMDB_User.xls');
center = xlsread('E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\ClusterCenter.xls');

centerT = transpose(center);

Reviewer_ID = likelinessTable(:,1);
likelinessTable(:,1) = [];
likelinessTableArray = table2array(likelinessTable);
manhattanDistance = mandist(likelinessTable , centerT);
% % Value and index of the closest cluster
[value,index] = min(manhattanDistance, [], 2);


likelinessTable = [Reviewer_ID likelinessTable];

likelinessTable = array2table(likelinessTable);

% % Adding Cluster number at the end of likeliness
clusterNumber = array2table(index);
likelinessTable = [likelinessTable clusterNumber];

likelinessTable.Properties.VariableNames{1} = 'Reviewer_ID';
likelinessTable.Properties.VariableNames{2} = 'Action';
likelinessTable.Properties.VariableNames{3} = 'Adventure';
likelinessTable.Properties.VariableNames{4} = 'Animation';
likelinessTable.Properties.VariableNames{5} = 'Children';
likelinessTable.Properties.VariableNames{6} = 'Comedy';
likelinessTable.Properties.VariableNames{7} = 'Crime';
likelinessTable.Properties.VariableNames{8} = 'Documentary';
likelinessTable.Properties.VariableNames{9} = 'Drama';
likelinessTable.Properties.VariableNames{10} = 'Fantasy';
likelinessTable.Properties.VariableNames{11} = 'Film_Noir';
likelinessTable.Properties.VariableNames{12} = 'Horror';
likelinessTable.Properties.VariableNames{13} = 'Musical';
likelinessTable.Properties.VariableNames{14} = 'Mystery';
likelinessTable.Properties.VariableNames{15} = 'Romance';
likelinessTable.Properties.VariableNames{16} = 'Sci_Fi';
likelinessTable.Properties.VariableNames{17} = 'Thriller';
likelinessTable.Properties.VariableNames{18} = 'War';
likelinessTable.Properties.VariableNames{19} = 'Western';

likelinessTable.Properties.VariableNames{20} = 'Cluster_No';

writetable(likelinessTable, 'E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\Likeliness_IMDB_User_With_Cluster_No.xls');
IDCluster = table();
Reviewer_ID = array2table(Reviewer_ID);
IDCluster = [IDCluster Reviewer_ID];
IDCluster = [IDCluster clusterNumber];
writetable(IDCluster, 'E:\NSU\163 Fall\CSE470\Research\Project\Matlab Works\Step 0 All In One\IMDB_User_With_Cluster_No.xls');

