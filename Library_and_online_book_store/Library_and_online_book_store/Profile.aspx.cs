
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
    public partial class Profile : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowRecord();
            }

        }

        void ShowRecord()
        {
            try
            {


                MySqlConnection sqlcon = new MySqlConnection(connectionstring);
                sqlcon.Open();

                string query = "select Userid,Fname,Lname,Email,Gender,Phoneno,Usertype from user where Userid='" + Session["Userid"] + "';";
                MySqlDataAdapter adp = new MySqlDataAdapter(query, sqlcon);
                DataSet ds = new DataSet();
                adp.Fill(ds);
                lblproedtuserid.Text = ds.Tables[0].Rows[0][0].ToString();
                txtprofname.Text = ds.Tables[0].Rows[0][1].ToString();
                txtprolname.Text = ds.Tables[0].Rows[0][2].ToString();
                lblproedtemail.Text = ds.Tables[0].Rows[0][3].ToString();
                lblproedtgender.Text = ds.Tables[0].Rows[0][4].ToString();
                txtprophone.Text = ds.Tables[0].Rows[0][5].ToString();
                lblproedtusertype.Text = ds.Tables[0].Rows[0][6].ToString();

                sqlcon.Close();
            }
            catch (Exception ex)
            {
                if (ex.Message.Equals("There is no row at position 0."))
                {
                    lblpromsg.Text = "You should login to update profile";
                }
                else
                {
                    lblpromsg.Text = ex.Message;
                }
            }
        }

        protected void btnproupdate_Click(object sender, EventArgs e)
        {
            try
            {
                MySqlConnection sqlcon = new MySqlConnection(connectionstring);
                sqlcon.Open();
                if (lblproedtuserid.Text != "")
                {

                    string query = "update user set Fname='" + this.txtprofname.Text + "',Lname='" + this.txtprolname.Text + "',Phoneno='" + this.txtprophone.Text + "' where Userid='" + Session["Userid"] + "';";
                    MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                    sqlcmd.ExecuteNonQuery();
                    lblpromsg.Text = "Profile Update Successfully !!!";
                }
                else
                {
                    lblpromsg.Text = "No Profile exist to update ";
                }
                sqlcon.Close();
            }
            catch (Exception ex)
            {

                lblpromsg.Text = ex.Message;


            }
        }

        protected void btnprochangepass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ChangePassword.aspx");
        }
    }

}