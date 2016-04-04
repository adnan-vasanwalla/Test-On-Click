using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using Devart.Data;
using System.Configuration;
using Devart.Data.MySql;

namespace ClassLibrary1
{
    public class Class1 : MarshalByRefObject
    {
        MySqlConnection con = new MySqlConnection("User Id=root;Host=localhost;Database=exam");
        int[] qs=new int[10];
        //int qs_no=1;
        public Class1()
        {
            
        }
        public string getIp(string host)
        {
            return "Hello";
            //return Dns.GetHostName();
            /*string domain = host;
            IPAddress[] ip_Addresses = Dns.GetHostAddresses(domain);
            string ips = string.Empty;
            foreach (IPAddress ipAddress in ip_Addresses)
            {
                ips += ipAddress.ToString();
                break;
            }
            return ips;*/

        }
        public string getHost(string ip)
        {
            IPHostEntry host = Dns.GetHostEntry(ip.Trim());
            return host.HostName;
        }
        public int[] createQs()
        {
            int i = 1;
            IEnumerable<int> questions = Enumerable.Range(1, 4).OrderBy(x => Guid.NewGuid()).Take(3);
            foreach (int num in questions)
            {
                qs[i] = num;
                i++;
            }
            //if (!(String.IsNullOrEmpty(qs)))
            //   qs=qs.Substring(0, qs.Length - 1);
            return qs;
        }
        public MySqlDataReader generateQsAns(int[] qs,int qs_no)
        {
            int question = qs[qs_no];
            con.Open();
            MySqlCommand cmd = new MySqlCommand("select question_name,answer from question q,answer a where q.question_id=a.question_id AND q.question_id= " + question + ";", con);
            MySqlDataReader dr = cmd.ExecuteReader();
            
            return dr;
        }
    }

}
