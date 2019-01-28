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
    public partial class ShowBook : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowallBook();
            }

        }
        Label lblDataListTitle;
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            
                lblDataListTitle = (Label)e.Item.FindControl("lblheadertemp");
        }
         
        void ShowallBook()
        {
            MySqlConnection sqlcon = new MySqlConnection(connectionstring);
            MySqlDataAdapter adp;
            sqlcon.Open();
            if(Request.QueryString["category"]=="All Books")
            {
                lbltitlecat.Text = "All Books";
                if (Session["Usertype"]==null)
                {
                    adp = new MySqlDataAdapter("select * from book ", sqlcon);
                }
                else
                {
                    if (Session["Usertype"].ToString() == "Student")
                    {
                        adp = new MySqlDataAdapter("select BookId,BookTitle,Author,Publisher,Category,BookEdition,Price*0.90 as Price,Page,PublishDate,BookImgPath,BookPath from book ", sqlcon);
                        
                    }
                    else
                    {
                        adp = new MySqlDataAdapter("select * from book ", sqlcon);
                    }
                        
                }
                
            }
            else if(Request.QueryString["category"] == "New Releases")
            {
                lbltitlecat.Text = "New Releases";

                if (Session["Usertype"] == null)
                {
                    adp = new MySqlDataAdapter("select * from book order by PublishDate desc", sqlcon);
                }
                else
                {
                    if (Session["Usertype"].ToString() == "Student")
                    {
                        adp = new MySqlDataAdapter("select BookId,BookTitle,Author,Publisher,Category,BookEdition,Price*0.90 as Price,Page,PublishDate,BookImgPath,BookPath from book order by PublishDate desc ", sqlcon);

                    }
                    else
                    {
                        adp = new MySqlDataAdapter("select * from book order by PublishDate desc", sqlcon);
                    }

                }
            }
            else
            {
                
                lbltitlecat.Text = Request.QueryString["category"].ToString();
                string query= "select * from book where Category='"+Request.QueryString["category"].ToString()+"'";
                adp = new MySqlDataAdapter(query, sqlcon);
            }
            DataSet ds = new DataSet();
            adp.Fill(ds);
            DataList1.DataSource = ds;
            DataList1.DataBind();
            sqlcon.Close();
        }
    }
}