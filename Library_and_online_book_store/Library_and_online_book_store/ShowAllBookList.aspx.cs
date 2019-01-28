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
    public partial class ShowAllBookList : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showBookList();
            }
            
        }

        void showBookList()
        {

            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string Query = "Select * from book";

                MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                gvshowbooklist.DataSource = dt.DefaultView;
                gvshowbooklist.DataBind();

                sqlcon.Close();
            }

        }
        protected void gvshowbooklist_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    Label l1 = gvshowbooklist.Rows[e.RowIndex].FindControl("lblbookid") as Label;
                    sqlcon.Open();
                    if (DeleteBookFormFolder(l1.Text))
                    {                   
                        string Query = "DELETE FROM Book WHERE BookId='"+l1.Text+"';";
                        MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);

                        DataTable dt = new DataTable();

                        adp.Fill(dt);
                        gvshowbooklist.DataSource = dt.DefaultView;
                        gvshowbooklist.DataBind();
                        showBookList();
                        lblBookDeleteMsg.Text = "Book Deleted !!!";
                    }
                    sqlcon.Close();
                }
            }
            catch (Exception ex)
            {
                lblBookDeleteMsg.Text = ex.Message;
            }
        }
        protected bool DeleteBookFormFolder(string bookid)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string Query= "Select BookPath,BookImgPath from Book where BookId='"+bookid+"';";
                MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                sqlcon.Close();
                string bookpath=ds.Tables[0].Rows[0][0].ToString();
                bookpath = bookpath.Substring(8);
                lblBookDeleteMsg.Text = bookpath;
                string imgpath = ds.Tables[0].Rows[0][1].ToString();
                imgpath = imgpath.Substring(13);
               
                if (System.IO.File.Exists(Server.MapPath("~/Books/")+bookpath))
                {
                    System.IO.File.Delete(Server.MapPath("~/Books/")+bookpath);
                    System.IO.File.Delete(Server.MapPath("~/BookImages/")+imgpath);
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