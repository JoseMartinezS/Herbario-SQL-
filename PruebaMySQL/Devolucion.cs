﻿//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;


namespace PruebaMySQL
{
    public partial class Devolucion : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Devolucion()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Devolucion";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Devolucion");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Devolucion"];
        }
        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Departamento depa = new Departamento();
            depa.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Doctor doc = new Doctor();
            doc.Show();
        }

        private void Devolucion_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string producto = textBox1.Text;
            string cantidad = textBox2.Text;
            string cantidadmonetaria = textBox3.Text;
            string fecha = textBox4.Text;
            consulta = "INSERT INTO Devolucion (producto, cantidad, cantidadmonetaria, fecha) values('" + producto + "', '" + cantidad + "', '" + cantidadmonetaria + "', '" + fecha + "')";
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
            string producto = textBox1.Text;
            string cantidad = textBox2.Text;
            string cantidadmonetaria = textBox3.Text;
            string fecha = textBox4.Text;
            int idDevolucion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Devolucion SET producto = '" + producto + "',cantidad = '" + cantidad + "',cantidadmonetaria = '" + cantidadmonetaria + "',fecha = '" + fecha + "' WHERE idDevolucion = " + idDevolucion.ToString();
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
            int idDevolucion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Devolucion SET fecha = 0 WHERE idDevolucion = " + idDevolucion.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}
