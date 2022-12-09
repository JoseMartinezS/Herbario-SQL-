﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Paciente : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Paciente()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Paciente";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Paciente");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Paciente"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Oferta ofer = new Oferta();
            ofer.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            PagoServicio pago = new PagoServicio();
            pago.Show();
        }

        private void Paciente_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string fechaNacimiento = textBox4.Text;
            consulta = "INSERT INTO Paciente (nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento) values('" + nombre + "', '" + apellidoPaterno + "', '" + apellidoMaterno + "', '" + fechaNacimiento + "')";
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

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string nombre = textBox1.Text;
            string apellidoPaterno = textBox2.Text;
            string apellidoMaterno = textBox3.Text;
            string fechaNacimiento = textBox4.Text;
            int idPaciente = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Paciente SET nombre = '" + nombre + "',apellidoPaterno = '" + apellidoPaterno + "',apellidoMaterno = '" + apellidoMaterno + "',fechaNacimiento = '" + fechaNacimiento + "' WHERE idPaciente = " + idPaciente.ToString();
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
            //Borrar
            int idPaciente = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Paciente SET Estatus = 0 WHERE idPaciente = " + idPaciente.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}
