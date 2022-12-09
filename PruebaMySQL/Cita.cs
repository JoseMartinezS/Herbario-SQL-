//LIBRERIAS
using System;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace PruebaMySQL
{
    public partial class Cita : Form
    {

        SqlConnection conexion;
        string consulta;
        SqlCommand comando;
        public Cita()
        {
            InitializeComponent();
            string cadena = @"Server=localhost\SQLEXPRESS;Database=Herbarioo;Trusted_Connection=True";
            conexion = new SqlConnection(cadena);
            //conexion.Open();
        }

        private void MostrarDatos()
        {
            consulta = "SELECT *FROM Cita";
            conexion.Open();
            SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
            DataSet ds = new DataSet();
            adaptador.Fill(ds, "Cita");
            conexion.Close();
            dataGridView1.DataSource = ds.Tables["Cita"];
        }

        private void btnAnterior_Click(object sender, EventArgs e)
        {
            this.Hide();
            Capacitacion capa = new Capacitacion();
            capa.Show();
        }

        private void btnSiguiente_Click(object sender, EventArgs e)
        {
            this.Hide();
            Cliente cliente = new Cliente();
            cliente.Show();
        }

        private void Cita_Load(object sender, EventArgs e)
        {
            MostrarDatos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            //Agregar
            string fecha = textBox1.Text;
            string asunto = textBox2.Text;
            string nombre = textBox3.Text;
            string edad = textBox4.Text;
            string idAgenda = textBox5.Text;
            string estatus = textBox6.Text;
            consulta = "INSERT INTO Cita (fecha, asunto, nombre, edad, idAgenda, estatus) values('" + fecha + "', '" + asunto + "', '" + nombre + "', '" + edad + "', '"+ idAgenda +"', '" +estatus + "')";
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
            textBox6.Clear();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            //Modificar
            string fecha = textBox1.Text;
            string asunto = textBox2.Text;
            string nombre = textBox3.Text;
            string edad = textBox4.Text;
            string idAgenda = textBox5.Text;
            string estatus = textBox6.Text;
            int idCita = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            consulta = "UPDATE Cita SET fecha = '" + fecha + "',asunto = '" + asunto + "',nombre = '" + nombre + "',edad = '" + edad +"', idAgenda = '" + idAgenda + "', estatus = '" +estatus+ "' WHERE idCita = " + idCita.ToString();
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
            textBox6.Clear();
        }

        private void btnBorrar_Click(object sender, EventArgs e)
        {
            //Borrar
            int idCita = (int)dataGridView1.SelectedRows[0].Cells[0].Value;
            //consulta = "DELETE FROM HOTEL WHERE idHotel = " + idHotel.ToString();
            consulta = "UPDATE Cita SET Estatus = 0 WHERE idCita = " + idCita.ToString(); ;
            conexion.Open();
            comando = new SqlCommand(consulta, conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            MostrarDatos();

        }
    }
}
