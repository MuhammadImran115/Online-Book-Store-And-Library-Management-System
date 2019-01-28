using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
namespace Library_and_online_book_store
{
    public partial class HomePage : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowHomeBook();
            }

        }


        void ShowHomeBook()
        {
            MySqlConnection sqlcon = new MySqlConnection(connectionstring);

            sqlcon.Open();


            MySqlDataAdapter adp; 

            if (Session["Usertype"] == null)
            {
                adp = new MySqlDataAdapter("select * from book limit 5 ", sqlcon);
            }
            else
            {
                if (Session["Usertype"].ToString() == "Student")
                {
                    adp = new MySqlDataAdapter("select BookId,BookTitle,Author,Publisher,Category,BookEdition,Price*0.90 as Price," +
                        "Page,PublishDate,BookImgPath,BookPath from book limit 5", sqlcon);

                }
                else
                {
                    adp = new MySqlDataAdapter("select * from book limit 5", sqlcon);
                }

            }

            DataSet ds = new DataSet();
            adp.Fill(ds);
            DtlistShowallbook.DataSource = ds;
            DtlistShowallbook.DataBind();

            MySqlDataAdapter adpNewRels; 

            if (Session["Usertype"] == null)
            {
                adpNewRels = new MySqlDataAdapter("select * from book order by PublishDate desc limit 5", sqlcon);
            }
            else
            {
                if (Session["Usertype"].ToString() == "Student")
                {
                    adpNewRels = new MySqlDataAdapter("select BookId,BookTitle,Author,Publisher,Category,BookEdition,Price*0.90 " +
                        "as Price,Page,PublishDate,BookImgPath,BookPath from book order by PublishDate desc limit 5", sqlcon);

                }
                else
                {
                    adpNewRels = new MySqlDataAdapter("select * from book order by PublishDate desc limit 5", sqlcon);
                }

            }


            DataSet dsNewRels = new DataSet();
            adpNewRels.Fill(dsNewRels);
            DatalistNewRelease.DataSource = dsNewRels;
            DatalistNewRelease.DataBind();


            sqlcon.Close();
        }

        
    }
}