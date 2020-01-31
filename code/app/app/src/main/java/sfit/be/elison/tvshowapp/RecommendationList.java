package sfit.be.elison.tvshowapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.RecyclerView;

import org.json.JSONArray;

import sfit.be.elison.tvshowapp.Adapter.RecommendationAdapter;

public class RecommendationList extends AppCompatActivity {


    JSONArray arr ;
    RecommendationList recomendatiin_list ;
    RecyclerView recomendation_recycler ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.recomendation_list);


        try {
            arr = MainActivity.ar;
            recomendation_recycler = (RecyclerView)findViewById(R.id.recomendatiin_list);
            recomendation_recycler.setLayoutManager(new GridLayoutManager(this,3));
            recomendation_recycler.setAdapter(new RecommendationAdapter(arr,this));

        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    // open show details
    public void showDetails(int id)
    {
        Intent intent = new Intent(getApplicationContext(),ShowActivity.class);
        intent.putExtra("showId",id);
        startActivity(intent);
    }

}
