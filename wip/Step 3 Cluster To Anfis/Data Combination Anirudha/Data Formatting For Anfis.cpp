#include <bits/stdc++.h>

using namespace std;

struct User
{
    vector <double> fisRating;
    vector <int> movieID ;
    vector <double> rating;
    int cluster ;
}user[465];  //460

struct MOVIE
{
    bool genre[19];  // 18
}movie[131265]; // 131262

map<string , int> genreVSgenreID ;

int main()
{
    ifstream inputFile;
    inputFile.open("IDvsCluster.txt");
    int clusterNo ;
    int counter = 1;
    while(inputFile >> clusterNo)
    {
        //cout << clusterNo << endl ;
        user[counter].cluster = clusterNo;
        counter++;
    }
    for(int i = 1 ; i < 461 ; i++)
    {
        cout << user[i].cluster << endl;
    }
    inputFile.close();
    inputFile.open("userid_movie_id_rating.txt");
    //freopen("Separated.txt" , "w" , stdout);

    int movie_id ;
    int user_id ;
    double rating;

    counter = 0 ;
    while(inputFile >>user_id >> movie_id >> rating )
    {
        if(user_id > 460 )
        {
            break ;
        }

        user[user_id].movieID.push_back(movie_id);
        user[user_id].rating.push_back(rating);

    }
    inputFile.close();
//    for(int i = 1 ; i <= 460 ; i++)
//    {
//        for(int j = 0 ;  j < user[i].movieID.size() ; j++)
//        {
//            cout << i << " " << user[i].movieID[j] << " " << user[i].rating[j] << endl ;
//        }
//    }


    genreVSgenreID["Action"] = 1;
    genreVSgenreID["Adventure"] = 2;
    genreVSgenreID["Animation"] = 3;
    genreVSgenreID["Children"] = 4;
    genreVSgenreID["Comedy"] = 5;
    genreVSgenreID["Crime"] = 6;
    genreVSgenreID["Documantary"] = 7;
    genreVSgenreID["Drama"] = 8;
    genreVSgenreID["Fantasy"] = 9;
    genreVSgenreID["Film_Noir"] = 10;
    genreVSgenreID["Horror"] = 11;
    genreVSgenreID["Musical"] = 12;
    genreVSgenreID["Mystery"] = 13;
    genreVSgenreID["Romance"] = 14;
    genreVSgenreID["Sci_Fi"] = 15;
    genreVSgenreID["Thriller"] = 16;
    genreVSgenreID["War"] = 17;
    genreVSgenreID["Western"] = 18;

    string tags ;
    string genre ;
    int length ;
    inputFile.open("id_vs_tag.txt");

    while(inputFile >> movie_id >> tags)
    {

        genre = "";
        length = tags.length();

        for(int i = 0 ; i < length ; i++)
        {
            if(tags[i]=='|')
            {
                if(genre == "(no")
                {
                    for(int j = 0 ; j < 19 ; j++)
                    {
                        movie[movie_id].genre[j] = false ;
                    }
                    genre = "";
                }
                else
                {
                    movie[movie_id].genre[genreVSgenreID[genre]] = true ;
//                    cout << "Movie id = " << movie_id << "::" << genreVSgenreID[genre]<< "::" << genre<<  endl;
//
//                    cout << movie[movie_id].genre[genreVSgenreID[genre]] << endl ;
                    genre = "";
                }
            }
            else if(i==length-1)
            {

                genre += tags[i];
                if(genre == "(no")
                {
                    for(int j = 0 ; j < 19 ; j++)
                    {
                        movie[movie_id].genre[j] = false ;
                    }
                    genre = "";
                }
                else
                {
                    movie[movie_id].genre[genreVSgenreID[genre]] = true ;
 //                   cout << movie[movie_id].genre[genreVSgenreID[genre]] << endl ;
                    genre = "";
                }

            }
            else
            {
                genre += tags[i];
            }
        }

    }
    inputFile.close();

//    for(int i = 1 ; i < 10  ; i++)
//    {
//        cout << i << " = ";
//
//        for(int j = 0 ; j < 19 ; j++)
//        {
//            if(movie[i].genre[j] == true)
//            {
//               // cout << "Here";
//                cout << j <<" ";
//            }
//        }
//        cout << endl ;
//    }
//
    counter = 1;
    double val;

    inputFile.open("fisDataTableNew.txt");
    string line;
    while(getline(inputFile,line))
    {
        stringstream ss;
        ss << line;
        while(ss>>val)
        {
            user[counter].fisRating.push_back(val);
            //cout << val << endl;
        }
        counter++;
    }
    inputFile.close();
//    for(int i=1;i<=10;i++)
//    {
//        cout << "user:" << i << endl;
//        for(int j=0;j<user[i].fisRating.size();j++)
//        {
//            cout << user[i].fisRating[j] << endl;
//        }
//    }


    //freopen("Formatted Data For Anfis.txt", "w" , stdout);


    vector <User> clusters[10];

    for(int i = 1 ; i <= 460 ; i++)
    {
        clusters[user[i].cluster].push_back(user[i]);
    }

    for(int i = 1 ; i < 10 ; i++)
    {
        if(clusters[i].empty() != true)
        {
            int dataSize = clusters[i].size();
            string fileName = "C:\Users\Anirudha\Google Drive\NSU\CSE 470\Our Research Work\Data Sets\Manipulated Data\Matlab Works\Step 3 Cluster To Anfis\Data Combination Anirudha\";
             "Cluster_"  + i ;
            fileName += "_members.txt" ;

            ofstream outputFile;

            outputFile.open(fileName);

            for(int i = 0 ; i < dataSize ; i++)
            {
                int watchedMovie = user[i].movieID.size();

                for(int j = 0 ; j < watchedMovie ; j++)
                {
                    for(int k = 0; k < 18 ; k++)
                    {
                        cout << user[i].fisRating[k] <<" " ;
                    }
                    for(int k = 1 ; k <= 18 ; k++)
                    {
                        cout << movie[user[i].movieID[j]].genre[k] << " " ;
                    }
                    cout << user[i].rating[j] << " " << user[i].cluster<< endl ;

                }
            }

            outputFile.close();
        }
    }

    return 0 ;
}
