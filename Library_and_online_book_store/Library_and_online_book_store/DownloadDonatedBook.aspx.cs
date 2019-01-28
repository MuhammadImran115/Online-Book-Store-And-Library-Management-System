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
    public partial class DownloadDonatedBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowDonatedlist();
            }


        }

        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        void ShowDonatedlist()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
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

        protected void gvdonatebook_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Response.Clear();
            Response.ContentType = "Application/octect-stream";
            Response.AppendHeader("Content-disposition", "attachment; filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/DonatedBooks/") + e.CommandArgument);

            Response.End();
        }

    }
}