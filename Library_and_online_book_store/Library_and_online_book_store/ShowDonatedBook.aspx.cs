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
    public partial class ShowDonatedBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDonatedlist();
                lbld_bookDeleteMsg.Text = "";
            }
            
        }
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        void ShowDonatedlist()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring)) {
                sqlcon.Open();
                string Query = "Select * from donatedbook";
                MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                gvdonatebook.DataSource = dt;
                gvdonatebook.DataBind();
                sqlcon.Close();
            }
        }
        

        protected void gvdonatebook_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    Label l1 = gvdonatebook.Rows[e.RowIndex].FindControl("lbld_bookid") as Label;
                    sqlcon.Open();
                    if (DeleteDonatedBookFormFolder(l1.Text))
                    {
                        string Query = "DELETE FROM donatedbook WHERE iddonatedbook='" + l1.Text + "';";


                        MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        gvdonatebook.DataSource = dt.DefaultView;
                        gvdonatebook.DataBind();
                        ShowDonatedlist();
                        lbld_bookDeleteMsg.Text = "Book deleted";
                    }
                       sqlcon.Close();
                }
            }
            catch (Exception ex)
            {
                lbld_bookDeleteMsg.Text = ex.Message;
            }
        }

        protected bool DeleteDonatedBookFormFolder(string bookid)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string Query = "Select D_bookpath from donatedbook where iddonatedbook='" + bookid + "';";
                MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                sqlcon.Close();
                string bookpath = ds.Tables[0].Rows[0][0].ToString();

                if (System.IO.File.Exists(Server.MapPath("~/DonatedBooks/") + bookpath))
                {
                    System.IO.File.Delete(Server.MapPath("~/DonatedBooks/") + bookpath);
                    
                    return true;
                }
                else
                {
                    return false;
                }

            }
        }
    }
}