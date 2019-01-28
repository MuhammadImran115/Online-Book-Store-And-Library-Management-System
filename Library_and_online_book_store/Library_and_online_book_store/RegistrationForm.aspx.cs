using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();*/
            if (!IsPostBack)
            {
                clear();
            }
        }

        protected void btnureg_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    sqlcon.Open();
                    string gender;
                    if (Male.Checked)
                    {
                        gender = Male.Text;
                    }
                    else
                    {
                        gender = Female.Text;
                    }
                    string query = "insert into library_and_book_store.user values('" + this.txtuserId.Text + "','" + this.txtufname.Text 
                        + "','" + this.txtulname.Text + "','" + this.txtuemail.Text + "','" + gender + "','" 
                        + this.txtuphoneno.Text + "','" + this.userType.SelectedItem.Value + "','" + this.txtupassword.Text + "');";
                    MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                    sqlcmd.ExecuteNonQuery();
                    clear();
                    lbluregerrormsg.Text = "Registration complete successfully";
                    
                    Response.Redirect("~/HomePage.aspx");
                    sqlcon.Close();
                }
            }
            catch (Exception ex)
            {
                
                this.lbluregerrormsg.Text =ex.Message ;
                if(ex.Message== "Data truncated for column 'Userid' at row 1")
                {
                    this.lbluregerrormsg.Text = "Userid should be numric character";

                }else if(ex.Message== "Duplicate entry '"+ this.txtuserId.Text+ "' for key 'PRIMARY'")
                {
                    this.lbluregerrormsg.Text = "User Id  already exist !";
                }else if(ex.Message== "Duplicate entry '"+this.txtuemail.Text+"' for key 'Email_UNIQUE'")
                {
                    this.lbluregerrormsg.Text = "Emial already exist !";
                }

            }
        }
        public void clear()
        {
            txtufname.Text = txtulname.Text = txtuemail.Text = txtuphoneno.Text = txtupassword.Text = txtCupassword.Text = "";
        }
    }
}