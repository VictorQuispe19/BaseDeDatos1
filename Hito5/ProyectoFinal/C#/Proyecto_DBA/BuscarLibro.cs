using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto_DBA
{
    public partial class BuscarLibro : Form
    {
        public BuscarLibro()
        {
            InitializeComponent();
        }

        public void Inicio()
        {
            InitializeComponent();
        }

        private void BuscarLibro_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataTable dt; 
            Libros lib = new Libros();            
            lib.mostrar(out dt);
            dgvLibros.DataSource = dt;            
        }
        class Libros
        {
            public SqlConnection conexion;
            public SqlDataAdapter adaptador;
            public DataTable dt;

            public Libros()
            {
                try
                {
                    conexion = new
                        SqlConnection("server=MSI;Database=proyectoHito5;integrated security=true");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
            public void mostrar(out DataTable dataTable)
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("PA_mostrarLibro", conexion);
                    adaptador = new SqlDataAdapter(cmd);
                    dt = new DataTable();

                    adaptador.Fill(dt);
                    dataTable = dt;
                   
                }
                catch (Exception ex)
                {
                    dataTable = dt;
             
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}
