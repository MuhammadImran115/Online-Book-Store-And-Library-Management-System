using System;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;
using MySql.Data.MySqlClient;
using System.Data;

namespace Library_and_online_book_store
{

    public partial class BuyBook : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        bool ChargeCard(string fname, string lname, decimal price)
        {

            ChargeCreditCard chargeCreditCard = new ChargeCreditCard();
            string response = chargeCreditCard.Run("5u8Lf6E6", "4zDdK4Q8Ap9W64wJ", fname, lname, price, txtcreditcardno.Text); //First parameter is API LOGIN ID   and Second parameter is Transiction key

            
            lblbuymsg.Text = response.ToString();
            if (response=="Transaction Successfully")
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        protected void btnpaynow_Click(object sender, EventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    sqlcon.Open();
                    string query = "select Fname,Lname from library_and_book_store.user where Userid='" + Session["Userid"] + "';";
                    MySqlDataAdapter adp = new MySqlDataAdapter(query, sqlcon);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    string lname = ds.Tables[0].Rows[0][0].ToString();
                    string fname = ds.Tables[0].Rows[0][1].ToString();

                    if (ChargeCard(fname, lname, Convert.ToDecimal(Session["bookprice"])))
                   {
                        

                         query = "insert into library_and_book_store.buy_book values(default,'" + Session["Userid"] + "','" + Session["bookid"]
                        + "','" + this.txtcreditcardno.Text + "','" + Session["bookprice"] + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:MM:ss") + "');";
                        MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                        sqlcmd.ExecuteNonQuery();

                        
                        query = "select BookPath from library_and_book_store.book where BookId='" + Session["bookid"] + "';";
                        adp = new MySqlDataAdapter(query, sqlcon);
                        ds = new DataSet();
                        adp.Fill(ds);
                        string bookpath = ds.Tables[0].Rows[0][0].ToString();
                        bookpath = bookpath.Substring(8);
                        DownloadBook(bookpath);
                        Session["bookid"] = null;
                        Session["bookprice"] = null;  

                    }

                    sqlcon.Close();
                }
            }
            catch (Exception ex)
            {

                lblbuymsg.Text = ex.Message;

            }
        }
        void DownloadBook(string bookpath)
        {
            Response.Clear();
            Response.ContentType = "Application/octect-stream";
            Response.AppendHeader("Content-disposition", "attachment; filename=" + bookpath);
            Response.TransmitFile(Server.MapPath("~/Books/") + bookpath);
            Response.End();
        }
    }
}