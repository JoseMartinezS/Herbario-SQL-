//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Produccion : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Produccion()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Produccion";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Produccion");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Produccion"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Prestacion pre = new Prestacion();
            pre.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Producto produ = new Producto();
            produ.Show();
        }

        private void Produccion_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string cantidadFinal = textBox1.Text;
            string ingresos = textBox2.Text;
            consulta = "INSERT INTO Produccion (cantidadFinal, ingresos) values('" + cantidadFinal + "', '" + ingresos +  "')";
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
            string cantidadFinal = textBox1.Text;
            string ingresos = textBox2.Text;
            int idProduccion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Produccion SET cantidadFinal = '" + cantidadFinal + "',ingresos = '" + ingresos + "' WHERE idProduccion = " + idProduccion.ToString();
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
            int idProduccion = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Produccion SET Estatus = 0 WHERE idProduccion = " + idProduccion.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}
