package com.sourcey.materiallogindemo;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import az.plainpie.PieView;
import az.plainpie.animation.PieAngleAnimation;
import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class MainActivity extends AppCompatActivity {
    SharedPreferences sf;
    @BindView(R.id.pieView)
    PieView pieView;
    @BindView(R.id.textView)
    TextView textView;
    @BindView(R.id.tot_lec)
    TextView totLec;
    @BindView(R.id.lec_attd)
    TextView lecAttd;
    @BindView(R.id.lec_ntattd)
    TextView lecNtattd;
    @BindView(R.id.def)
    TextView def;
    @BindView(R.id.rem)
    TextView rem;
    @BindView(R.id.tot_lec_val)
    TextView totLecVal;
    @BindView(R.id.lec_attd_val)
    TextView lecAttdVal;
    @BindView(R.id.lec_ntatt_val)
    TextView lecNtattVal;
    @BindView(R.id.def_val)
    TextView defVal;
    @BindView(R.id.rem_val)
    TextView remVal;
    @BindView(R.id.button)
    Button button;
    @BindView(R.id.button2)
    Button button2;
    @BindView(R.id.button3)
    Button button3;
    @BindView(R.id.button4)
    Button button4;


    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

        pieView = findViewById(R.id.pieView);
        pieView.setPercentageBackgroundColor(getResources().getColor(R.color.colorAccent));


        final ProgressDialog progressDialog = new ProgressDialog(MainActivity.this,
                R.style.AppTheme);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Loading");
        progressDialog.show();


        // TODO: Implement your own authentication logic here.

        String url = "https://kaustubhk.com/ecollege/home.php";
        Map<String, String> params = new HashMap<String, String>();
        sf = getSharedPreferences("access_token", MODE_PRIVATE);
        String token = sf.getString("value", null);
        if (token == null) {
            Intent i = new Intent(getApplicationContext(), LoginActivity.class);
            startActivity(i);
            finish();

        }
        params.put("access_token", token); //SUCCESSFULLY DONE {"conducted":"10","attended":"9","success":true}

        JsonObjectRequest jsonRequest = new JsonObjectRequest
                (Request.Method.POST, url, new JSONObject(params), new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        // the response is already constructed as a JSONObject!
                        Log.i("response", response.toString());
                        try {
                            Boolean success = response.getBoolean("success");
                            int attended = Integer.parseInt(response.getString("attended"));
                            int conducted = Integer.parseInt(response.getString("conducted"));
                            float percentage = ((float) attended * 100) / (conducted);
                            PieAngleAnimation animation = new PieAngleAnimation(pieView);

//                                            animation.setDuration(1000); //This is the duration of the animation in millis
//                                            pieView.startAnimation(animation);
                            pieView.setInnerText(Float.toString(percentage));
                            pieView.setMaxPercentage(100);
                            pieView.setPercentage(percentage);
                            totLecVal.setText(Integer.toString(conducted));
                            lecAttdVal.setText(Integer.toString(attended));
                            lecNtattVal.setText(Integer.toString((conducted - attended)));
                            if (percentage < 75) {
                                defVal.setText("Yes");
                                defVal.setTextColor(Color.RED);
                                remVal.setText("Bring parents");
                            } else {
                                defVal.setText("No");
                                pieView.setPercentageBackgroundColor(Color.GREEN);
                                remVal.setText("None");
                            }


                            progressDialog.dismiss();
                            return;
                        } catch (JSONException e) {
                            Toast.makeText(getBaseContext(), "Loading failed", Toast.LENGTH_LONG).show();
                            progressDialog.dismiss();
                            return;
                        }
                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getBaseContext(), "Loading failed", Toast.LENGTH_LONG).show();
                        progressDialog.dismiss();
                        //  Log.i("error",error.getMessage());
                        return;
                    }
                }) {
            @Override
            protected Map<String, String> getParams() {
                Map<String, String> params = new HashMap<>();

                return params;
            }

//                            @Override
//                            public String getBodyContentType() {
//                                return "application/x-www-form-urlencoded; charset=UTF-8";
//                            }
        };

        Volley.newRequestQueue(MainActivity.this).add(jsonRequest);
        //onSignupSuccess();
        // onSignupFailed();
        progressDialog.dismiss();

    }

    @OnClick(R.id.button)
    public void onViewClicked() {
        Intent i = new Intent(getApplicationContext(), SubjectAtt.class);
        startActivity(i);
    }

    @OnClick(R.id.button2)
    public void onViewClicked2() {
        Intent i = new Intent(getApplicationContext(), ResultActivity.class);
        startActivity(i);
    }

    @OnClick(R.id.button3)
    public void onViewClicked3() {
        Intent i = new Intent(getApplicationContext(), MessageActivity.class);
        startActivity(i);
    }

    @OnClick(R.id.button4)
    public void onViewClicked4() {
        Intent i = new Intent(getApplicationContext(), EventActivity.class);
        startActivity(i);
    }
}
