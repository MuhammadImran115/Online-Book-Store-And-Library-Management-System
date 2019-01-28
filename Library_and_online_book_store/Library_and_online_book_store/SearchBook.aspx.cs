
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
    public partial class SearchBook : System.Web.UI.Page
    {

        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Searching();
            }

        }
        void Searching()
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    sqlcon.Open();
                    string Query = "Select * from Book where BookTitle='" + Session["SearchedBook"].ToString() + "'or Author='" + Session["SearchedBook"].ToString()
                        + "'or BookId='" + Session["SearchedBook"].ToString() + "'or Publisher='" + Session["SearchedBook"].ToString() + "' ;";
                    MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);
                    DataSet ds = new DataSet();

                    adp.Fill(ds);
                    gvsearchedbook.DataSource = ds;
                    gvsearchedbook.DataBind();

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        lblBookSearchMsg.Text = "Book Not Found !!!";
                    }
                    Session["SearchedBook"] = null;
                    sqlcon.Close();
                }
            }
            catch (Exception ex)
            {
                lblBookSearchMsg.Text = ex.Message;
            }
        }

    }
}