using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TPI_PAV_I
{
    public partial class frmMenu : Form
    {
        public frmMenu()
        {
            InitializeComponent();
        }

        private void frmMenu_Load(object sender, EventArgs e)
        {
            frmLogin login = new frmLogin();
            login.ShowDialog();
        }

        private bool ValidarUsuario(string usuario, string password)
        {
            BDHelper helper = new BDHelper();
            DataTable tabla = helper.ConsultaSql("SELECT * FROM USUARIOS WHERE n_usuario = \'" + usuario 
                + "\' AND contraseña = \'" + password + "\'");
            if (tabla.Rows.Count > 0)
                return true;
            else
                return false;
        }
    }
}
