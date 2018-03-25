package com.sourcey.materiallogindemo;

import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.charts.HorizontalBarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import butterknife.BindView;
import butterknife.ButterKnife;

public class ResultActivity extends AppCompatActivity {

    @BindView(R.id.barchart)
    BarChart barchart;
    SharedPreferences sf;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);
        ButterKnife.bind(this);
        String url = "https://kaustubhk.com/ecollege/marks.php";
        Map<String, String> params = new HashMap<String, String>();
        sf = getSharedPreferences("access_token", MODE_PRIVATE);
        String token = sf.getString("value", null);
        if (token == null) {
            Intent i = new Intent(getApplicationContext(), LoginActivity.class);
            startActivity(i);
            finish();

        }
        params.put("access_token", token);

        final ProgressDialog progressDialog = new ProgressDialog(ResultActivity.this,
                R.style.AppTheme);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Loading");
        progressDialog.show();

        JsonObjectRequest jsonRequest = new JsonObjectRequest
                (Request.Method.POST, url, new JSONObject(params), new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        // the response is already constructed as a JSONObject!
                        Log.i("response", response.toString());
                        try {
                            Boolean success = response.getBoolean("success");
                            ArrayList<String> labels = new ArrayList<String>();
                            ArrayList<BarEntry> bt = new ArrayList<BarEntry>();
                            JSONArray keys = response.names ();

                            for (int i = 0,j=0; i < keys.length (); ++i) {
                                String key = keys.getString (i); // Here's your key
                                if(!key.equals("success")) {
                                    JSONObject value = response.getJSONObject(key); // Here's your value
                                    labels.add(key);
                                    int semester = value.getInt("semester");
                                    bt.add(new BarEntry(semester,j++));
                                }
                            }
                            BarDataSet bardataset = new BarDataSet(bt, "Marks");
                            BarData data = new BarData(labels, bardataset);
                            bardataset.setColors(ColorTemplate.COLORFUL_COLORS);
                            barchart.animateX(1500);
                            barchart.setData(data);
                            barchart.setDescription("Subject Wise Mark");


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

        Volley.newRequestQueue(ResultActivity.this).add(jsonRequest);
        //onSignupSuccess();
        // onSignupFailed();
        progressDialog.dismiss();

    }
}
