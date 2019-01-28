using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class LoginForm : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if(Session["Email"]!=null)
                {
                    if(Session["Usertype"].ToString()=="Librarian")
                    {
                        Response.Redirect("~/Librarian.aspx");
                        
                    }
                    else
                    {
                        Response.Redirect("~/HomePage.aspx");
                    }
                }
                clear();
            }
        }

        protected void btnlogin2_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string query = "select * from user where Email='"+txtusername2.Text+"' and Password='"
                    +txtpassword2.Text+"'and Usertype='"+usertypelogin.SelectedItem.Value+"'";

                MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);

                MySqlDataReader readdata = sqlcmd.ExecuteReader();
                
               // lblvalidmsg.Text = readdata.Read().ToString();
                if (readdata.Read())
                {
                    Session["Email"] = txtusername2.Text;
                    Session["Usertype"] = usertypelogin.SelectedItem.Value;
                    Session["btnlogin"] = false;
                    

                    if (usertypelogin.SelectedItem.Value== "Librarian")
                    {
                        Response.Redirect("~/Librarian.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/HomePage.aspx");
                    }
                    
                    
                }
                else
                {

                    lblvalidmsg.Text = "Invalid Email id and Password ";
                }


                sqlcon.Close();
            }
          

        }
        protected void clear()
        {
            txtusername2.Text = txtpassword2.Text = "";
        }

    }
}