using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class TakeMembership : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lbl_agreemsg.Text = "";
            }
        }
        
        protected void btnagree_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    DateTime date = DateTime.Now;
                    sqlcon.Open();
                    string query = "insert into member values('"+Session["Userid"]+"','" + date.ToString("yyyy-MM-dd") + "');";
                    MySqlCommand sqlcmd = new MySqlCommand(query,sqlcon);
                    sqlcmd.ExecuteNonQuery();
                    lbl_agreemsg.Text = "Membership successfull";
                    sqlcon.Close();
                }


             }catch(Exception ex)
             {
                lbl_agreemsg.Text = ex.Message;
                if (ex.Message== "Duplicate entry '"+Session["Userid"]+"' for key 'PRIMARY'")
               lbl_agreemsg.Text="Member already exist !";
            }
        }
    }
}