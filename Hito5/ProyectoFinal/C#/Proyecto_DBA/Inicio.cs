using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Proyecto_DBA
{
    public partial class Inicio : Form
    {
        public Inicio()
        {
            InitializeComponent();
        }

       

        private void Form1_Load(object sender, EventArgs e)
        {
            //label1.Parent = pictureBox1;
            //label1.BackColor = Color.Transparent;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (BuscarLibro abrir = new BuscarLibro())
                abrir.ShowDialog();
           
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (Solicitar abrir = new Solicitar())
                abrir.ShowDialog();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            using (Horario abrir = new Horario())
                abrir.ShowDialog();
        }
    }
}
