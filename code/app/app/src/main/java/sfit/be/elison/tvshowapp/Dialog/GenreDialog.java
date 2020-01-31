package sfit.be.elison.tvshowapp.Dialog;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.view.View;
import android.view.Window;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.LinearLayout;
import android.widget.TextView;

import sfit.be.elison.tvshowapp.R;

public class GenreDialog  extends Dialog implements
        android.view.View.OnClickListener {

    public Activity c;
    public Dialog d;


    public GenreDialog(Activity a) {
        super(a);
        // TODO Auto-generated constructor stub
        this.c = a;
    }



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.select_genre_dialog);


    }


    // get genre list
    public String getGenreList()
    {
        String genreList = "";
        LinearLayout ll = (LinearLayout) this.findViewById(android.R.id.content).findViewById(R.id.genre_container);

        for(int i=1 ;i< ll.getChildCount() ;i++ )
        {
            LinearLayout myChildLL = ((LinearLayout)ll.getChildAt(i)) ;
            boolean checkBoxStatus = ((CheckBox)myChildLL.getChildAt(0)).isChecked();
            String genreText = ((TextView)myChildLL.getChildAt(1)).getText().toString();

            if(checkBoxStatus)
            {
                genreList += genreText + "," ;
            }


        }

        return  genreList ;
    }



    @Override
    public void onClick(View v) {
    }


}