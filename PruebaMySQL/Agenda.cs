﻿using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Agenda : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Agenda()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }


        private void Form1_Load(object sender, EventArgs e)
        {
            MostrarDatos();
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

        private void button1_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string fecha = textBox2.Text;
            string idDoctor = textBox3.Text;
            string estatus = textBox4.Text;
            consulta = "INSERT INTO Agenda (nombre, fecha, idDoctor, estatus) values('" + nombre + "', '" + fecha + "', '" + idDoctor + "', '" + estatus + "')";
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
            int idAgenda = (int) dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Agenda SET Estatus = 0 WHERE idAgenda = " + idAgenda.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            string nombre = textBox1.Text;
            string fecha = textBox2.Text;
            string idDoctor = textBox3.Text;
            string estatus = textBox4.Text;
            int idAgenda = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Agenda SET nombre = '" + nombre + "',fecha = '" + fecha + "',idDoctor = '" + idDoctor + "',estatus = '" + estatus + "' WHERE idAgenda = "+ idAgenda.ToString();
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

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            Apartado apar = new Apartado();
            this.Hide();
            apar.Show();
            
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
