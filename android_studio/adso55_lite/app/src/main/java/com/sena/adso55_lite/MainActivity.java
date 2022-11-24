package com.sena.adso55_lite;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import com.sena.adso55_lite.actividades.Login;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void mainIngresar(View view) {
        // Toast.makeText(this,"Proceso interno...",Toast.LENGTH_LONG).show();

        Intent ir = new Intent(this, Login.class);
        startActivity(ir);

    }
}