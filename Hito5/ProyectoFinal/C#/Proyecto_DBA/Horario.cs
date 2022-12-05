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
    public partial class Horario : Form
    {
        
        public Horario()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt;         
            Biblioteca bib = new Biblioteca();         
            bib.mostrar(out dt);
            dataGridView1.DataSource = dt;

        }
        class Biblioteca
        {
            public SqlConnection conexion;
            public SqlDataAdapter adaptador;
            public DataTable dt;
            public Biblioteca()
            {
                try
                {
                    conexion = new SqlConnection("Server=MSI;Database=proyectoHito5;integrated security=true");

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
                    SqlCommand cmd = new SqlCommand("PA_mostrarHorarios", conexion);
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
