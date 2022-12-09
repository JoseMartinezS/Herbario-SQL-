﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Apartado : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Apartado()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Apartado";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Apartado");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Apartado"];
        }


        private void btnModificar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string cantidad = textBox2.Text;
            string abono = textBox3.Text;
            string fecha = textBox4.Text;
            int idApartado = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Apartado SET nombre = '" + nombre + "',cantidad = '" + cantidad + "',abono = '" + abono + "',fecha = '" + fecha + "' WHERE idApartado = " + idApartado.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string cantidad = textBox2.Text;
            string abono = textBox3.Text;
            string fecha = textBox4.Text;
            consulta = "INSERT INTO Apartado (nombre, cantidad, abono, fecha) values('" + nombre + "', '" + cantidad + "', '" + abono + "', '" + fecha + "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            int idAgenda = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Apartado SET Estatus = 0 WHERE idApartado = " + idAgenda.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void Apartado_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            Bodega bodega = new Bodega();
            this.Hide();
            bodega.Show();
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Agenda apartado = new Agenda();
            apartado.Show();
        }
    }
}
