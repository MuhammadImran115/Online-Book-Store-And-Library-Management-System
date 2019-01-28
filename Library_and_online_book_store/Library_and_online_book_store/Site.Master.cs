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
    public partial class Site : System.Web.UI.MasterPage
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["btnlogin"] == null)
            {
                btnregistration.Visible = true;
                btnlogin.Visible = true;
                btnlogout.Visible = false;
                btnprofile.Visible = false;
                btn_takemembership.Visible = false;
                btnlibpannel.Visible = false;
            }
            else
            {
                btnlogout.Visible = true;
                btnprofile.Visible = true;
                if (Session["Usertype"].Equals("Librarian"))
                {
                    btn_takemembership.Visible = false;
                    btnlibpannel.Visible = true;
                }
                else
                {
                    btn_takemembership.Visible = true;
                    btnlibpannel.Visible = false;
                }
                
                btnlogin.Visible = false;
                btnregistration.Visible = false;
                saveID();
            }
        }


        protected void saveID()
        {
            MySqlConnection sqlcon = new MySqlConnection(connectionstring);
            sqlcon.Open();
            DataSet ds = new DataSet();
            string query = "select Userid from user where Email='" + Session["Email"] + "';";
            MySqlDataAdapter adp = new MySqlDataAdapter(query, sqlcon);
            adp.Fill(ds);
            Session["Userid"] = ds.Tables[0].Rows[0][0];
            sqlcon.Close();
        }

        protected void btnregistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RegistrationForm.aspx");
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/LoginForm.aspx");
        }

        protected void btnshoppingcard_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/ShowCart.aspx");

        }

        protected void btndonatebook_Click(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                Response.Redirect("~/DonateBook.aspx");
            }
            else
            {
                Response.Redirect("~/LoginForm.aspx");
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["Email"] = null;
            Session["Usertype"] = null;
            Session["btnlogin"] = null;
            Session["Userid"] = null;
            Response.Redirect("~/HomePage.aspx");

        }


        protected void btnnewrelease_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowBook?category=New Releases");
        }

        protected void btnshowcart_Click(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {
                Response.Redirect("~/ShowCart.aspx");
            }
            else
            {
                Response.Redirect("~/LoginForm.aspx");
            }
        }


        protected void btn_takemembership_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/TakeMembership");
        }

        protected void btnlibpannel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Librarian.aspx");
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            Session["SearchedBook"] = txtsearch.Text;
            Response.Redirect("~/SearchBook.aspx");
        }

        protected void btnprofile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile.aspx");
        }
    }
}