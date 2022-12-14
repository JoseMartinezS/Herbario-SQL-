//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Mantenimiento : Form
    {
        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Mantenimiento()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }
        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Mantenimiento";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Mantenimiento");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Mantenimiento"];
        }


        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Instrumento ins = new Instrumento();
            ins.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Marca marca = new Marca();
            marca.Show();
        }

        private void Mantenimiento_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string costo = textBox1.Text;
            string persona = textBox2.Text;
            string fecha = textBox3.Text;
            string idSucursal = textBox4.Text;
            string estatus = textBox5.Text;
            consulta = "INSERT INTO Mantenimiento (costo, persona, fecha, idSucursal, estatus) values('" + costo + "', '" + persona + "', '" + fecha + "', '" + idSucursal + "', '"+estatus+ "')";
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string costo = textBox1.Text;
            string persona = textBox2.Text;
            string fecha = textBox3.Text;
            string idSucursal = textBox4.Text;
            string estatus = textBox5.Text;
            int idMantenimiento = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Mantenimiento SET costo = '" + costo + "',persona = '" + persona + "',fecha = '" + fecha + "',idSucursal = '" + idSucursal + "', estatus = '" +estatus + "' WHERE idMantenimiento = " + idMantenimiento.ToString();
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();


            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idMantenimiento = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Mantenimiento SET Estatus = 0 WHERE idMantenimiento = " + idMantenimiento.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();
        }
    }
}
