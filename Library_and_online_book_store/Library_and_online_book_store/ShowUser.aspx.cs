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
    public partial class ShowUser1 : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showUser();
                lblUserDeleteMsg.Text = "";
                
            }
        }

        
        void showUser()
        {

            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string Query = "Select * from user";
                
                MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
            
                DataTable dt = new DataTable();
                adp.Fill(dt);
                gvShowUser.DataSource = dt.DefaultView;
                gvShowUser.DataBind();
             
                sqlcon.Close();
            }
            
        }

        protected void gvShowUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    Label l1 = gvShowUser.Rows[e.RowIndex].FindControl("lbluserid") as Label;
                    sqlcon.Open();
                    string Query = "DELETE FROM user WHERE Userid="+l1.Text;

                    
                    MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                    
                    DataTable dt = new DataTable();
                    
                    adp.Fill(dt);

                    gvShowUser.DataSource = dt.DefaultView;
                    gvShowUser.DataBind();
                    showUser();
                    lblUserDeleteMsg.Text = "User deleted";
                    sqlcon.Close();
                }
            }catch(Exception ex)
            {
                lblUserDeleteMsg.Text = ex.Message;
            }
        }
    }
}