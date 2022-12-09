﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
namespace PruebaMySQL
{
    public partial class Marca : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Marca()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Agenda";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Agenda");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Agenda"];
        }
        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Mantenimiento man = new Mantenimiento();
            man.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Marketing mark = new Marketing();
            mark.Show();
        }

        private void Marca_Load(object sender, EventArgs e)
        {
            MostrarDatos();

        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string nombre = textBox1.Text;
            string modelo = textBox2.Text;
            consulta = "INSERT INTO Agenda (nombre, modelo) values('" + nombre + "', '" + modelo + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {

            //Modificar
            string nombre = textBox1.Text;
            string modelo = textBox2.Text;
            int idAgenda = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Agenda SET nombre = '" + nombre + "',modelo = '" + modelo + "' WHERE idAgenda = " + idAgenda.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();

        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idAgenda = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Agenda SET Estatus = 0 WHERE idAgenda = " + idAgenda.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}
