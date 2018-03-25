package com.sourcey.materiallogindemo;

import android.app.ProgressDialog;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import android.content.Intent;
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

public class LoginActivity extends AppCompatActivity {
    private static final String TAG = "LoginActivity";
    private static final int REQUEST_SIGNUP = 0;
    SharedPreferences sf;
    @BindView(R.id.college_id) EditText _college_id;
    @BindView(R.id.input_password) EditText _passwordText;
    @BindView(R.id.btn_login) Button _loginButton;
    @BindView(R.id.link_signup) TextView _signupLink;
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);
        ButterKnife.bind(this);
        sf=getSharedPreferences("access_token",MODE_PRIVATE);

        if(sf.getString("value",null)!=null)
        {
            Intent i = new Intent(getApplicationContext(), MainActivity.class);
            startActivity(i);
            finish();

        }
        _loginButton.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                login();
            }
        });

        _signupLink.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // Start the Signup activity
                Intent intent = new Intent(getApplicationContext(), SignupActivity.class);
                startActivityForResult(intent, REQUEST_SIGNUP);
                finish();
                overridePendingTransition(R.anim.push_left_in, R.anim.push_left_out);
            }
        });
    }

    public void login() {
        Log.d(TAG, "Login");

        if (!validate()) {
            onLoginFailed();
            return;
        }

        _loginButton.setEnabled(false);

        final ProgressDialog progressDialog = new ProgressDialog(LoginActivity.this,
                R.style.AppTheme);
        progressDialog.setIndeterminate(true);
        progressDialog.setMessage("Authenticating...");
        progressDialog.show();

        final String  college_id = _college_id.getText().toString();
        final String password = _passwordText.getText().toString();

        // TODO: Implement your own authentication logic here.

        new android.os.Handler().postDelayed(
                new Runnable() {
                    public void run() {
                        // On complete call either onLoginSuccess or onLoginFailed
                        String url = "https://kaustubhk.com/ecollege/token.php";
                        Map<String, String> params= new HashMap<String, String>();
                        params.put("grant_type", "client_credentials");
                        // params.put("email", email);
                        params.put("client_id", college_id);
                        params.put("client_secret",password);

                        JsonObjectRequest jsonRequest = new JsonObjectRequest
                                (Request.Method.POST, url, new JSONObject(params), new Response.Listener<JSONObject>() {
                                    @Override
                                    public void onResponse(JSONObject response) {
                                        // the response is already constructed as a JSONObject!
                                        Log.i("response",response.toString());
                                        try {
                                            String tokstr = response.getString("access_token");
                                            SharedPreferences loginState =getSharedPreferences("access_token",MODE_PRIVATE);
                                            SharedPreferences.Editor editor = loginState.edit();
                                            editor.putString("value", tokstr);
                                            editor.commit();

                                            progressDialog.dismiss();
                                            Intent i1 = new Intent(LoginActivity.this, MainActivity.class);
                                            startActivity(i1);
                                            return;
                                        } catch (JSONException e) {
                                            Toast.makeText(getBaseContext(), "Login failed", Toast.LENGTH_LONG).show();
                                            progressDialog.dismiss();
                                            _loginButton.setEnabled(true);
                                            return;
                                        }
                                    }
                                }, new Response.ErrorListener() {

                                    @Override
                                    public void onErrorResponse(VolleyError error) {
                                        Toast.makeText(getBaseContext(), "Login failed", Toast.LENGTH_LONG).show();
                                        progressDialog.dismiss();
                                        _loginButton.setEnabled(true);
                                      //  Log.i("error",error.getMessage());
                                        return;
                                    }
                                }) {
                            @Override
                            protected Map<String, String> getParams() {
                                Map<String, String> params = new HashMap<>();

                                return params;
                            }
                        };

                        Volley.newRequestQueue(LoginActivity.this).add(jsonRequest);
                        //onSignupSuccess();
                        // onSignupFailed();
                        progressDialog.dismiss();

                    }
                }, 3000);
    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_SIGNUP) {
            if (resultCode == RESULT_OK) {

                // TODO: Implement successful signup logic here
                // By default we just finish the Activity and log them in automatically
                this.finish();
            }
        }
    }

    @Override
    public void onBackPressed() {
        // Disable going back to the MainActivity
        moveTaskToBack(true);
    }

    public void onLoginSuccess() {
        _loginButton.setEnabled(true);
        Intent logSuccess = new Intent(this,MainActivity.class);
        startActivity(logSuccess);
    }

    public void onLoginFailed() {
        Toast.makeText(getBaseContext(), "Login failed", Toast.LENGTH_LONG).show();

        _loginButton.setEnabled(true);
    }

    public boolean validate() {
        boolean valid = true;

        String college_id = _college_id.getText().toString();
        String password = _passwordText.getText().toString();

        if (college_id.isEmpty() || college_id.length()< 3) {
            _college_id.setError("Enter a valid college id");
            valid = false;
        } else {
            _college_id.setError(null);
        }

        if (password.isEmpty() || password.length() < 7 || password.length() > 50) {
            _passwordText.setError("Between 7 and 50 alphanumeric characters");
            valid = false;
        } else {
            _passwordText.setError(null);
        }

        return valid;
    }
}
