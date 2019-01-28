using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class AddBook : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbook_save_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    sqlcon.Open();
                    saveBookimg.PostedFile.SaveAs(Server.MapPath("~/BookImages/") + saveBookimg.FileName);
                    saveBookpdf.PostedFile.SaveAs(Server.MapPath("~/Books/") + saveBookpdf.FileName);
                     
                    string query = "insert into library_and_book_store.Book values('" + this.txtb_id.Text + "','" 
                        + this.txtb_title.Text + "','" + this.txtb_author.Text + "','" + this.txtb_publisher.Text + "','" 
                        + this.txtb_cat.Text + "','" + this.txtb_edtion.Text + "','" + this.txtb_price.Text + "','" 
                        + this.txtb_page.Text + "','" + this.txtb_publishdate.Text + "','" 
                        + "~/BookImages/" + saveBookimg.FileName+"','"+ "~/Books/" + saveBookpdf.FileName+"');";
                    MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                    sqlcmd.ExecuteNonQuery();

                    this.lblSaveMsg.Text = "Successfully Book Added";
                    clear();
                    sqlcon.Close();
                }
            }catch(Exception  ex)
            {
                this.lblSaveMsg.Text = ex.Message;
            }
        }
        void clear()
        {
            this.txtb_id.Text = this.txtb_title.Text= this.txtb_author.Text =this.txtb_publisher.Text =this.txtb_cat.Text = this.txtb_edtion.Text = this.txtb_price.Text =this.txtb_page.Text=this.txtb_publishdate.Text = "";
        }
    }
}