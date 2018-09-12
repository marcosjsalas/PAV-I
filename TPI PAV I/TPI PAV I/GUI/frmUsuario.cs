using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PAV_I_06_09_2018
{
    public partial class frmUsuario : Form
    {
        BDHelper oDatos = new BDHelper("Data Source=maquis;Initial Catalog=_marcos;User ID=avisuales1;Password=avisuales1");
        
        public frmUsuario()
        {
            InitializeComponent();
        }

        private void frmUsuario_Load(object sender, EventArgs e)
        {
            
        }



        
    }
}
