package sfit.be.elison.tvshowapp;

import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ProgressBar;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import sfit.be.elison.tvshowapp.Dialog.GenreDialog;
import sfit.be.elison.tvshowapp.Model.User;

import static android.view.View.GONE;
import static android.view.View.VISIBLE;
import static sfit.be.elison.tvshowapp.Utility.getBaseUrl;


public class LoginActivity extends AppCompatActivity{

    private final String SIGN_IN_URL = getBaseUrl()+ "/users";
    private final String SIGN_UP_URL = getBaseUrl()+ "/create/users";

    private ProgressBar login_progress_bar ;
    private EditText mLoginView;
    private EditText mPasswordView;
    Button mSignInButton,mSignUpButton ;
    GenreDialog gd ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        gd = new GenreDialog(this);
        gd.requestWindowFeature(Window.FEATURE_NO_TITLE);
        gd.getWindow().setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT);
        mLoginView = (EditText) findViewById(R.id.login);
        mPasswordView = (EditText) findViewById(R.id.password);
        login_progress_bar = (ProgressBar) findViewById(R.id.login_progress_bar);
        mSignInButton = (Button) findViewById(R.id.email_sign_in_button);
        mSignUpButton = (Button) findViewById(R.id.email_register_button);
        mSignInButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                attemptLogin();
            }
        });

        mSignUpButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {

                gd.show();


                gd.setOnDismissListener(new DialogInterface.OnDismissListener() {
                    @Override
                    public void onDismiss(DialogInterface dialogInterface) {
                        attemptRegistration();

                    }
                });

            }
        });

    }




    private void attemptLogin() {

        String login = mLoginView.getText().toString();
        String password = mPasswordView.getText().toString();

        if (TextUtils.isEmpty(login) || TextUtils.isEmpty(password)) {
            Toast.makeText(this, R.string.error_field_required, Toast.LENGTH_LONG).show();
        } else {
            connectToServer(login, password);
            toggleProgressVisibility(GONE);
        }
    }


    private void attemptRegistration() {

        String login = mLoginView.getText().toString();
        String password = mPasswordView.getText().toString();

        if (TextUtils.isEmpty(login) || TextUtils.isEmpty(password)) {
            Toast.makeText(this, R.string.error_field_required, Toast.LENGTH_LONG).show();
        } else {
            registerToServer(login, password);
            toggleProgressVisibility(GONE);
        }
    }

    private void toggleProgressVisibility(int visibility_status)
    {
        if(visibility_status== GONE)
        {
            mSignInButton.setVisibility(GONE);
            login_progress_bar.setVisibility(View.VISIBLE);

        }
        else
        {
            mSignInButton.setVisibility(View.VISIBLE);
            login_progress_bar.setVisibility(GONE);

        }
    }

    public void connectToServer(String login, String password) {
        final String log = login;
        final String pass = password;

        Map<String,String> params = new HashMap<>();
        params.put(User.KEY_LOGIN,log);
        params.put(User.KEY_PASSWORD,pass);

        JsonObjectRequest objectRequest = new JsonObjectRequest(
                Request.Method.POST, SIGN_IN_URL, new JSONObject(params), response -> {
            toggleProgressVisibility(VISIBLE);
            try{

                        User user = new User();
                        user.setId(response.getInt(User.KEY_ID));
                        user.setLogin(response.getString(User.KEY_LOGIN));
                        user.setPassword(response.getString(User.KEY_PASSWORD));

                        Intent intent = new Intent(getApplicationContext(),MainActivity.class);
                        intent.putExtra("login",user.getLogin());
                        intent.putExtra("id",user.getId());
                        startActivity(intent);
                        }
                    catch (JSONException e){
                        e.printStackTrace();
                        Toast.makeText(getApplicationContext(),R.string.incorrect_login,Toast.LENGTH_LONG).show();
                    }
                },
                error -> Toast.makeText(getApplicationContext(),R.string.incorrect_login,Toast.LENGTH_LONG).show());

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(objectRequest);

    }


    public void registerToServer(String login, String password) {
        final String log = login;
        final String pass = password;

        Map<String,String> params = new HashMap<>();
        params.put(User.KEY_LOGIN,log);
        params.put(User.KEY_PASSWORD,pass);
        params.put("genre",gd.getGenreList());






        JsonObjectRequest objectRequest = new JsonObjectRequest(
                Request.Method.POST, SIGN_UP_URL, new JSONObject(params), response -> {
            toggleProgressVisibility(VISIBLE);
            try{

                User user = new User();
                user.setId(response.getInt(User.KEY_ID));
                user.setLogin(response.getString(User.KEY_LOGIN));
                user.setPassword(response.getString(User.KEY_PASSWORD));

                Intent intent = new Intent(getApplicationContext(),MainActivity.class);
                intent.putExtra("login",user.getLogin());
                intent.putExtra("id",user.getId());
                startActivity(intent);
            }
            catch (JSONException e){
                e.printStackTrace();
                Toast.makeText(getApplicationContext(),R.string.incorrect_login,Toast.LENGTH_LONG).show();
            }
        },
                error -> Toast.makeText(getApplicationContext(),R.string.incorrect_login,Toast.LENGTH_LONG).show());

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(objectRequest);

    }






}

