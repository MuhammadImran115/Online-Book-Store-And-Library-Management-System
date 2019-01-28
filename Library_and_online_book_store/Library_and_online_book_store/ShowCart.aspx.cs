using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
namespace Library_and_online_book_store
{
    public partial class ShowCart : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                showShoppingCart();       
            }
            
        }
        protected void btnshoppincard2_Click(object sender, EventArgs e)
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                
                sqlcon.Open();
                showShoppingCart();
                sqlcon.Close();
            }
        }
        void showShoppingCart()
        {
            //string Query = "Select * from shopping_card where Uemail= '"+Session["Email"].ToString()+"';";
            MySqlConnection con = new MySqlConnection(connectionstring);
            string Query;

            if (Session["Usertype"].ToString() == "Student")
            {
                Query = "Select u.Email,b.BookId,b.BookTitle,b.Author,s.Badddate,b.Price*0.90 as Price from user u,book b ,shopping_cart s where s.Uemail=u.Email and s.Bookid=b.BookId and s.Uemail='" + Session["Email"].ToString() + "'";

            }
            else
            {
                Query = "Select u.Email,b.BookId,b.BookTitle,b.Author,s.Badddate,b.Price from user u,book b ,shopping_cart s where s.Uemail=u.Email and s.Bookid=b.BookId and s.Uemail='" + Session["Email"].ToString() + "'";
               
            }
            MySqlDataAdapter adp = new MySqlDataAdapter(Query, con);
            //DataTable dt = new DataTable();
            DataSet ds = new DataSet();
     
            adp.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                lblCartRemoveMsg.Text = "Your Cart is empty";
            }
            gvshoppingcart.DataSource = ds;
            gvshoppingcart.DataBind();
        }

        protected void gvshoppingcart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                {
                    Label l1 = gvshoppingcart.Rows[e.RowIndex].FindControl("lblbookid") as Label;
                    sqlcon.Open();
                    string Query = "DELETE  FROM shopping_cart WHERE Bookid='" + l1.Text+"'and Uemail LIKE'%"+Session["Email"].ToString()+"%';";


                    MySqlDataAdapter adp = new MySqlDataAdapter(Query, sqlcon);

                    DataTable dt = new DataTable();

                    adp.Fill(dt);
                    gvshoppingcart.DataSource = dt.DefaultView;
                    gvshoppingcart.DataBind();
                    showShoppingCart();
                    lblCartRemoveMsg.Text = "Item Removed From Cart !";
                    sqlcon.Close();
                }
            }
            catch (Exception ex)
            {
                 lblCartRemoveMsg.Text = ex.Message;
            }
        }

        protected void gvshoppingcart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="CheckOut")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
              
                Session["bookid"] = (gvshoppingcart.Rows[rowIndex].FindControl("lblbookid") as Label).Text;
                Session["bookprice"]= (gvshoppingcart.Rows[rowIndex].FindControl("lblpirce") as Label).Text; ;
                Response.Redirect("~/BuyBook.aspx");
            }
            
             
            

        }
    }
}