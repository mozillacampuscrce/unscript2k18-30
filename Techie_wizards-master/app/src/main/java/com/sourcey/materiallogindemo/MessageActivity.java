package com.sourcey.materiallogindemo;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import az.plainpie.animation.PieAngleAnimation;
import butterknife.BindView;
import butterknife.ButterKnife;

public class MessageActivity extends AppCompatActivity {

    @BindView(R.id.icon_lecture_text1)
    TextView iconLectureText1;
    SharedPreferences sf;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_message);
        ButterKnife.bind(this);
        String url = "https://kaustubhk.com/ecollege/getmessages.php";
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
                            JSONArray messages = response.getJSONArray("messages");
                            for (int i = 0; i < messages.length(); ++i) {
                                String message = messages.getString(i);
                                iconLectureText1.setText(iconLectureText1.getText()+"\n\nTeacher: "+message);
                            }
                            return;
                        } catch (JSONException e) {
                            Toast.makeText(getBaseContext(), "Loading failed", Toast.LENGTH_LONG).show();
                            return;
                        }
                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(getBaseContext(), "Loading failed", Toast.LENGTH_LONG).show();
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

        Volley.newRequestQueue(MessageActivity.this).add(jsonRequest);
    }
}
