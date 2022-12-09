//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Pedido : Form
    {

        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Pedido()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Pedido";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Pedido");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Pedido"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Paquete paque = new Paquete();
            paque.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Prestacion pre = new Prestacion();
            pre.Show();
        }

        private void Pedido_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string productos = textBox1.Text;
            string cantidad = textBox2.Text;
            string costo = textBox3.Text;
            consulta = "INSERT INTO Pedido (productos, cantidad, costo) values('" + productos + "', '" + cantidad + "', '" + costo +"')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string productos = textBox1.Text;
            string cantidad = textBox2.Text;
            string costo = textBox3.Text;
            int idPedido = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Pedido SET productos = '" + productos + "',cantidad = '" + cantidad + "',costo = '" + costo + "' WHERE idPedido = " + idPedido.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idPedido = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Pedido SET Estatus = 0 WHERE idPedido = " + idPedido.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}
