package sfit.be.elison.tvshowapp.Adapter;

import android.content.Context;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONObject;

import sfit.be.elison.tvshowapp.Model.Show;
import sfit.be.elison.tvshowapp.R;
import sfit.be.elison.tvshowapp.RecommendationList;

public class RecommendationAdapter extends RecyclerView.Adapter<RecommendationAdapter.RecommendationViewHolder> {

    JSONArray ar ;
     RecommendationList rl ;

    public RecommendationAdapter(JSONArray ar, RecommendationList rl)
    {
        this.ar= ar;
        this.rl = rl ;
        Log.i("recommedation list",""+ar);
    }

    @Override
    public RecommendationViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        return new RecommendationViewHolder(LayoutInflater.from(parent.getContext()).inflate(R.layout.single_recomendation_item,parent,false));
    }

    @Override
    public void onBindViewHolder(RecommendationViewHolder holder, int position) {

        try {
            // attcah image to single items
            JSONObject object = ar.getJSONObject(position);
            Show show = new Show();
            show.setId(object.getInt(Show.KEY_ID));
            show.setPoster(object.getString(Show.KEY_POSTER));
            Log.i("post path","http://"+show.getPoster());
            Picasso.get().load("http://"+show.getPoster()).into(holder.showImage);
            holder.showImage.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    rl.showDetails(show.getId());
                }
            });
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    @Override
    public int getItemCount() {
        return ar.length();
    }

    public class RecommendationViewHolder extends RecyclerView.ViewHolder
    {
        public ImageView showImage ;

        public RecommendationViewHolder(View itemView) {
            super(itemView);

            showImage = (ImageView) itemView.findViewById(R.id.show_image);


        }
    }
}
