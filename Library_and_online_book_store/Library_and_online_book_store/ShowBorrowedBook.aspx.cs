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
    public partial class ShowBorrowedBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ShowBorrowedBookList();
            }
        }
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void ShowBorrowedBookList()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string Query = "Select * from borrowbook";
                MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                gvborrowedbook.DataSource = dt;
                gvborrowedbook.DataBind();
                sqlcon.Close();
            }
        }

        protected void gvborrowedbook_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    Label l1 = gvborrowedbook.Rows[e.RowIndex].FindControl("lblb_userid") as Label;
                    Label l2 = gvborrowedbook.Rows[e.RowIndex].FindControl("lblb_bookid") as Label;
                    sqlcon.Open();
                    
                    
                        string Query = "DELETE FROM borrowbook WHERE Userid='" + l1.Text + "'and Bookid='"+l2.Text +"';";

                        MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                        DataTable dt = new DataTable();
                        adp.Fill(dt);
                        gvborrowedbook.DataSource = dt.DefaultView;
                        gvborrowedbook.DataBind();
                        ShowBorrowedBookList();
                        lblb_bookDeleteMsg.Text = "Borrow info deleted !!!";
                    
                    sqlcon.Close();
                }
            }
            catch (Exception ex)
            {
                lblb_bookDeleteMsg.Text = ex.Message;
            }
        }
    }
}