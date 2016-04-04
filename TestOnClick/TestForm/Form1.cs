using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using ClassLibrary1;

namespace TestForm
{
    public partial class Form1 : Form
    {
        Class1 c;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'examDataSet1.test' table. You can move, or remove it, as needed.
            this.testTableAdapter.Fill(this.examDataSet1.test);
            TcpClientChannel channel = new TcpClientChannel();
            ChannelServices.RegisterChannel(channel, false);
            RemotingConfiguration.RegisterWellKnownClientType(typeof(Class1), "tcp://localhost:1234/hello");
            c = new Class1();

        }
        
        private void button1_Click_1(object sender, EventArgs e)
        {
            string url = textBox1.Text;
            textBox2.Text = c.getIp(url);
        }

        private void login_Click(object sender, EventArgs e)
        {
            Form2 Difficult = new Form2();
            QuizForm Quiz = new QuizForm();
            Difficult.Show();
            Quiz.Show();
            Hide();
        }
        /*private void button2_Click(object sender, EventArgs e)
        {
            string host = txtIP.Text;
            txtHost.Text = c.getHost(host);
        }*/

    }
}
