package com.sena.adso55_lite.actividades;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import com.sena.adso55_lite.R;
import com.sena.adso55_lite.controladores.CtrlUsuario;
import com.sena.adso55_lite.utilidades.Db_Sqlite;

import java.util.List;

public class Login extends AppCompatActivity {

    private EditText eUsuario, eContrasena;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login);

        eUsuario = (EditText) findViewById(R.id.eLogin);
        eContrasena = (EditText) findViewById(R.id.eContrasena);

    }

    public void validarUsuario(){
        eUsuario.setError(null);
        eContrasena.setError(null);

        String vUsu = eUsuario.getText().toString();
        String vCon = eContrasena.getText().toString();

        boolean cancelar = false;
        View focusView = null;

        if (TextUtils.isEmpty(vUsu)){
            eUsuario.setError("El usuario no es valido!");
            focusView = eUsuario;
            cancelar = true;
        }

        if (TextUtils.isEmpty(vCon)){
            eContrasena.setError("La contraseña no es valida!");
            focusView = eContrasena;
            cancelar = true;
        }

        if (cancelar){
            focusView.requestFocus();
        } else {

            List<CtrlUsuario> lUsuarioValidar;

            Db_Sqlite base = new Db_Sqlite(this,null,null,1);

            lUsuarioValidar = base.loginUsuario(vUsu,vCon);

            if(!lUsuarioValidar.isEmpty()){
                Toast.makeText(this, "Inicio de sesión correcto!", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(this,"Inicio de sesión incorrecto!",Toast.LENGTH_SHORT).show();
            }
        }

    }

    public void bInicioSesion(View view) {
        validarUsuario();
    }

    public void bCrearUsu(View view) {
        Intent ir = new Intent(this, RegistroUsuario.class);
        startActivity(ir);
    }
}