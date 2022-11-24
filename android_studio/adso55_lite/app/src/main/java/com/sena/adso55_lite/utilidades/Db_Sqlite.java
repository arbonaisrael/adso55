package com.sena.adso55_lite.utilidades;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.sena.adso55_lite.controladores.CtrlUsuario;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import androidx.annotation.Nullable;

public class Db_Sqlite extends SQLiteOpenHelper {

    private static String dbname = "adso55.db";
    private static int dbversion = 1;

    private SimpleDateFormat fecha = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);

    public Db_Sqlite(Context context, String name,
                     SQLiteDatabase.CursorFactory factory, int version){
        super(context,dbname,factory,dbversion);
    }


    @Override
    public void onCreate(SQLiteDatabase db) {

        String dllUsuario = "CREATE TABLE usuarios(";
        dllUsuario += "id INTEGER PRIMARY KEY AUTOINCREMENT,";
        dllUsuario += "login TEXT,";
        dllUsuario += "contrasena TEXT,";
        dllUsuario += "fec_creacion TEXT,";
        dllUsuario += "estado INTEGER,";
        dllUsuario += "rol INTEGER);";

        String insertUsuarios = "INSERT INTO usuarios (login,contrasena,fec_creacion,estado, rol)";
        insertUsuarios += "SELECT 'admin','admin','2022-11-16',1,1 UNION ALL ";
        insertUsuarios += "SELECT 'usuario','usuario','2022-11-16',1,2;";

        db.execSQL(dllUsuario);
        db.execSQL(insertUsuarios);

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {

        String dllUsuario = "DROP TABLE IF EXISTS usuarios;";
        db.execSQL(dllUsuario);
        onCreate(db);

    }

    public List<CtrlUsuario> loginUsuario(String usu, String con){

        List<CtrlUsuario> listUsuario = new ArrayList<CtrlUsuario>();
        SQLiteDatabase base = this.getWritableDatabase();

        String consulta = "SELECT id,login,contrasena,fec_creacion,estado,rol ";
        consulta       += "FROM usuarios WHERE login = '";
        consulta       += usu;
        consulta       += "' AND contrasena = '";
        consulta       += con;
        consulta       += "';";

        Cursor cursor = base.rawQuery(consulta,null);

        if(cursor.moveToFirst()){
            CtrlUsuario cUsuario = new CtrlUsuario();

            cUsuario.setLogin(cursor.getString(1));
            cUsuario.setLogin(cursor.getString(2));
            cUsuario.setFec_creacion(cursor.getString(3));
            cUsuario.setEstado(cursor.getInt(4));
            cUsuario.setRol(cursor.getInt(5));

            listUsuario.add(cUsuario);
        }

        cursor.close();
        base.close();

        return listUsuario;

    }

    public void insertUsuario(CtrlUsuario miUsuario){

        ContentValues values = new ContentValues();
        values.put("login",miUsuario.getLogin());
        values.put("contrasena", miUsuario.getContrasena());
        values.put("fec_creacion",miUsuario.getFec_creacion());
        values.put("estado",miUsuario.getEstado());
        values.put("rol",miUsuario.getRol());

        SQLiteDatabase base = this.getWritableDatabase();
        base.insert("usuarios",null,values);
        base.close();
    }

}
