using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using ClassLibrary1;
using Devart.Data.MySql;

namespace TestForm
{
    public partial class QuizForm : Form
    {
        Class1 c;
        int[] qs = new int[10];
        int qs_no = 1;
        public QuizForm()
        {
            InitializeComponent();
        }

        private void QuizForm_Load(object sender, EventArgs e)
        {
            c = new Class1();
            qs=c.createQs();
            MySqlDataReader dr=c.generateQsAns(qs,qs_no);
            qs_no++;
            try
            {
                dr.Read();
                label1.Text = dr.GetString(0);
                label5.Text = dr.GetString(1);
                dr.Read();
                label6.Text = dr.GetString(1);
                dr.Read();
                label7.Text = dr.GetString(1);
                dr.Read();
                label8.Text = dr.GetString(1);
            }
            catch (Exception)
            {
                ;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            MySqlDataReader dr = c.generateQsAns(qs, qs_no);
            qs_no++;
            try
            {
                dr.Read();
                label1.Text = dr.GetString(0);
                label5.Text = dr.GetString(1);
                dr.Read();
                label6.Text = dr.GetString(1);
                dr.Read();
                label7.Text = dr.GetString(1);
                dr.Read();
                label8.Text = dr.GetString(1);
            }
            catch (Exception)
            {
                ;
            }
        }

    }
}
