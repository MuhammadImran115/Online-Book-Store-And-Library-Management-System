using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class DonateBook : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void btnd_bookupload_Click(object sender, EventArgs e)
        {
           
                try
                {
                    if (Donatedbook.HasFile)
                    {
                        MySqlConnection sqlcon = new MySqlConnection(connectionstring);
                        Donatedbook.PostedFile.SaveAs(Server.MapPath("~/DonatedBooks/")+Donatedbook.FileName);

                        sqlcon.Open();
                    DateTime date = DateTime.Now;
                    string query = "insert into donatedbook values( default ,'" + Session["Email"] + "','" + Donatedbook.FileName 
                        + "','"+date.ToString("yyyy-MM-dd")+ "');";
                        MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                        sqlcmd.ExecuteNonQuery();
                    long iddonatedbok = sqlcmd.LastInsertedId;

                    sqlcon.Close();
                        lbld_bookmsg.Text = "Successfully Donated, Thanks !!!";
                    }
                }
                catch (Exception ex)
                {
                  //  if(ex.Message=="Duplicate entry '"+Donatedbook.FileName+"' for key 'D_bookpath_UNIQUE'")
                   // {
                            lbld_bookmsg.Text = "Book already exist !!";

                   // }
                    
                }
            }
           
        }
    }
