using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
public class BDHelper
{
    //Atributos
    private string cadenaConexion;
    private SqlConnection conexion;
    private SqlCommand comando;

    //Métodos
    public string CadenaConexion
    {
        get { return cadenaConexion; }
        set { cadenaConexion = value; }
    }

    public SqlConnection Conexion
    {
        get { return conexion; }
        set { conexion = value; }
    }

    public SqlCommand Comando
    {
        get { return comando; }
        set { comando = value; }
    }

    public BDHelper()
    {
        cadenaConexion = "";
        conexion = null;
        comando = null;
    }

    public BDHelper(string cadenaConexion)
    {
        this.cadenaConexion = cadenaConexion;
        conexion = new SqlConnection();
        comando = new SqlCommand();
    }

    public void Conectar()
    {
        conexion = new SqlConnection();
        conexion.ConnectionString = this.cadenaConexion;
        conexion.Open();
        comando = new SqlCommand();
        comando.Connection = conexion;
        comando.CommandType = CommandType.Text;
    }

    public void Desconectar()
    {
        conexion.Close();
    }

    public DataTable ConsultarTabla(string nombreTabla)
    {
        DataTable tabla = new DataTable();
        Conectar();
        comando.CommandText = "SELECT * FROM " + nombreTabla;
        tabla.Load(comando.ExecuteReader());
        Desconectar();
        return tabla;
    }

    public DataTable ConsultaSql(string consultaSql)
    {
        DataTable tabla = new DataTable();
        Conectar();
        comando.CommandText = consultaSql;
        tabla.Load(comando.ExecuteReader());
        Desconectar();
        return tabla;
    }

    public void ActualizarBD(string sql)
    {
        Conectar();
        comando.CommandText = sql;
        comando.ExecuteNonQuery();
        Desconectar();
    }
}