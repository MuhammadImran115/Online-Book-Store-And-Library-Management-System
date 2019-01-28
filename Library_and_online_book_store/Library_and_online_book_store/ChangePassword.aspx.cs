using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class ChangePassword1 : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnchangepass_Click(object sender, EventArgs e)
        {
            try
            {


                MySqlConnection sqlcon = new MySqlConnection(connectionstring);
                sqlcon.Open();
                string query = "select Password from user where Userid='" + Session["Userid"] + "';";
                MySqlDataAdapter adp = new MySqlDataAdapter(query, sqlcon);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                if (txtoldpass.Text == ds.Tables[0].Rows[0][0].ToString())
                {

                    query = "update user set Password='" + this.txtnewpass.Text + "' where Userid='" + Session["Userid"] + "';";
                    MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                    sqlcmd.ExecuteNonQuery();
                    lblchpassmsg.Text = "Password Changed Successfully !!!";
                }
                else
                {
                    lblchpassmsg.Text = "Invalid Old Password";
                }
                sqlcon.Close();
            }
            catch (Exception ex)
            {
                lblchpassmsg.Text = ex.Message;
            }
        }
    }
}