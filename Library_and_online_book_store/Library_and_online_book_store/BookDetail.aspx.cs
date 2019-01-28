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
    public partial class BookDetail : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showDetail();
                RelatedBooks();
            }
        }
       
        void showDetail()
        {
            imgbookdetail.ImageUrl = Request.QueryString["BookImgPath"];
            lbldebookid.Text = Request.QueryString["BookId"];
            lbldebooktitle.Text= Request.QueryString["BookTitle"];
            lbldebookauthor.Text = Request.QueryString["Author"];
            lbldepub.Text = Request.QueryString["Publisher"];
            lbldecat.Text = Request.QueryString["Category"];
            lbldeedition.Text = Request.QueryString["BookEdition"];
            lbldebookprice.Text = Request.QueryString["Price"];
            lbldepage.Text = Request.QueryString["Page"];
            lbldepubdate.Text = Request.QueryString["PublishDate"];
             
           
        }
        
        protected void btnaddtocart_Click(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
           {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    try
                    {
                        sqlcon.Open();
                        
                        string query= "insert into library_and_book_store.shopping_cart values('" + Session["Email"]
                            + "','" + lbldebookid.Text + "','"+ DateTime.Now.ToString("yyyy-MM-dd HH:MM:ss")  + "');";
                        MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                        sqlcmd.ExecuteNonQuery();
                        lbladdcartmsg.Text = "Book Successfull Added into Cart";
                        sqlcon.Close();
                    }catch(Exception ex)
                    {
                        
                        lbladdcartmsg.Text = "Book already added in cart";
                    }
                }
            }
            else
            {
                Response.Redirect("~/LoginForm.aspx");
            }
        }

        protected void btnborrow_Click(object sender, EventArgs e)
        {
            if(Session["Email"] != null)
            {

                Session["bookid"] = null;
                Session["bookid"]=Request.QueryString["BookId"].ToString();
                Response.Redirect("~/BorrowBook.aspx");
            }
            else
            {
                Response.Redirect("~/LoginForm.aspx");
            }
            
        }

        protected void btnsubmitrating_Click(object sender, EventArgs e)
        {
           // lblratingmsg.Text = Rating2.CurrentRating.ToString();

            if (Session["Email"] != null)
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    try
                    {
                        sqlcon.Open();

                        string query = "insert into library_and_book_store.rating values('" + Convert.ToInt32(Request.QueryString["BookId"]) + "','" 
                            + Session["Userid"] + "','" + Rating2.CurrentRating + "');";
                        MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                        sqlcmd.ExecuteNonQuery();
                        lblratingmsg.Text = "Thanks For Rating  !!!";
                        sqlcon.Close();
                    }
                    catch (Exception ex)
                    {
                       // lblratingmsg.Text = ex.Message;
                        lblratingmsg.Text = "You already rated this book !!!";
                    }
                }
            }
            else
            {
                Response.Redirect("~/LoginForm.aspx");
            }


        }
        protected void RelatedBooks()
        {
            MySqlConnection sqlcon = new MySqlConnection(connectionstring);

            sqlcon.Open();

            //string bookcat = "Mathematics";
            MySqlDataAdapter adp;
            string query;

            if (Session["Usertype"] == null)
            {
                   query = "select * from book where Category='"+ lbldecat.Text +"';";
                adp = new MySqlDataAdapter(query, sqlcon);
            }
            else
            {
                if (Session["Usertype"].ToString() == "Student")
                {
                    query = "select BookId,BookTitle,Author,Publisher,Category,BookEdition,Price*0.90 as Price," +
                        "Page,PublishDate,BookImgPath,BookPath from book where Category='" + lbldecat.Text + "';";
                    adp = new MySqlDataAdapter(query, sqlcon);

                }
                else
                {
                    query = "select * from book where Category='" + lbldecat.Text + "';";
                    adp = new MySqlDataAdapter(query, sqlcon);
                }
            }

            DataSet ds = new DataSet();
            adp.Fill(ds);
            DtlistShowRelatedbook.DataSource = ds;
            DtlistShowRelatedbook.DataBind();
            sqlcon.Close();
        }
        
        protected void btnbuybook_Click(object sender, EventArgs e)
        {
            if (Session["Email"] != null)
            {

                Session["bookid"] = null;
                Session["bookprice"] = null;
                Session["bookid"] = lbldebookid.Text;
                Session["bookprice"] = lbldebookprice.Text;
                Response.Redirect("~/BuyBook.aspx");
            }
            else
            {
                Response.Redirect("~/LoginForm.aspx");
            }


            
        }
    }
}