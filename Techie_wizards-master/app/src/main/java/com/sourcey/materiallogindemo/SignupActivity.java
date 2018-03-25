package com.sourcey.materiallogindemo;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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

import butterknife.BindView;
import butterknife.ButterKnife;

public class SignupActivity extends AppCompatActivity {
    private static final String TAG = "SignupActivity";

    @BindView(R.id.college_id) EditText _college_id;
    @BindView(R.id.token) EditText _token;
    @BindView(R.id.input_password) EditText _passwordText;
    @BindView(R.id.input_reEnterPassword) EditText _reEnterPasswordText;
    @BindView(R.id.btn_signup) Button _signupButton;
    @BindView(R.id.link_login) TextView _loginLink;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);
        ButterKnife.bind(this);

        _signupButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                signup();
            }
        });

        _loginLink.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Finish the registration screen and return to the Login activity
                Intent intent = new Intent(getApplicationContext(),LoginActivity.class);
                startActivity(intent);
                finish();
                overridePendingTransition(R.anim.push_left_in, R.anim.push_left_out);
            }
        });
    }

    public void signup() {
        Log.d(TAG, "Signup");

        if (!validate()) {
            Log.d("??","wtf");
            onSignupFailed();
            return;
        }

        _signupButton.setEnabled(false);

        final ProgressDialog progressDialog = new ProgressDialog(SignupActivity.this,
                R.style.AppTheme);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Creating Account...");
        progressDialog.show();

        final String collegeid = _college_id.getText().toString();
       final String token = _token.getText().toString();
       final String password = _passwordText.getText().toString();
       final String reEnterPassword = _reEnterPasswordText.getText().toString();

        // TODO: Implement your own signup logic here.

        new android.os.Handler().postDelayed(
                new Runnable() {
                    public void run() {
                        // On complete call either onSignupSuccess or onSignupFailed
                        // depending on success
                        String url = "https://kaustubhk.com/ecollege/register.php";
                        Map<String, String> params= new HashMap<String, String>();
                        params.put("accountid", collegeid);
                       // params.put("email", email);
                        params.put("password", password);
                        params.put("token", token);

                        JsonObjectRequest jsonRequest = new JsonObjectRequest
                                (Request.Method.POST, url, new JSONObject(params), new Response.Listener<JSONObject>() {
                                    @Override
                                    public void onResponse(JSONObject response) {
                                        // the response is already constructed as a JSONObject!
                                        Log.i("response",response.toString());
                                        try {
                                            response.getBoolean("success");
                                            progressDialog.dismiss();
                                            Intent i1 = new Intent(SignupActivity.this, LoginActivity.class);
                                            startActivity(i1);
                                            return;
                                        } catch (JSONException e) {
                                            Toast.makeText(getBaseContext(), "Registration failed", Toast.LENGTH_LONG).show();
                                            progressDialog.dismiss();
                                            _signupButton.setEnabled(true);
                                            return;
                                        }
                                    }
                                }, new Response.ErrorListener() {

                                    @Override
                                    public void onErrorResponse(VolleyError error) {
                                        Toast.makeText(getBaseContext(), "Registration failed", Toast.LENGTH_LONG).show();
                                        progressDialog.dismiss();
                                        _signupButton.setEnabled(true);
                                        Log.i("error",error.getMessage());
                                        return;
                                    }
                                }) {
                            @Override
                            protected Map<String, String> getParams() {
                                Map<String, String> params = new HashMap<>();

                                return params;
                            }
                        };

                        Volley.newRequestQueue(SignupActivity.this).add(jsonRequest);
                        //onSignupSuccess();
                        // onSignupFailed();
                        progressDialog.dismiss();
                    }
                }, 3000);
    }


    public void onSignupSuccess() {
        _signupButton.setEnabled(true);
        setResult(RESULT_OK, null);
        finish();
    }

    public void onSignupFailed() {
        Toast.makeText(getBaseContext(), "Registration failed", Toast.LENGTH_LONG).show();

        _signupButton.setEnabled(true);
    }

    public boolean validate() {
        boolean valid = true;

        String collegeid = _college_id.getText().toString();
        String token = _token.getText().toString();
        String password = _passwordText.getText().toString();
        String reEnterPassword = _reEnterPasswordText.getText().toString();

        if (collegeid.isEmpty() || collegeid.length() < 3) {
            _college_id.setError("Enter Valid College ID");
            valid = false;
        } else {
            _college_id.setError(null);
        }


        if (token.isEmpty()) {
            _token.setError("Enter Valid Token Number");
            valid = false;
        } else {
            _token.setError(null);
        }

        if (password.isEmpty() || password.length() < 7 || password.length() > 50) {
            _passwordText.setError("between 7 and 50 alphanumeric characters");
            valid = false;
        } else {
            _passwordText.setError(null);
        }

        if (reEnterPassword.isEmpty() || !(reEnterPassword.equals(password))) {
            _reEnterPasswordText.setError("Password Do not match");
            valid = false;
        } else {
            _reEnterPasswordText.setError(null);
        }

        return valid;
    }
}