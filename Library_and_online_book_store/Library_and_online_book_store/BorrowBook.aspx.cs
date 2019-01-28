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
    public partial class BorrowBook : System.Web.UI.Page
    {
        string connectionstring = @"Server=localhost;Database=library_and_book_store;Uid=root;pwd=database123;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbr_borrow_Click(object sender, EventArgs e)
        {
            if (Ismember())
            {
                if (IsClearFine())
                {
                    try
                    {
                        using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
                        {
                            sqlcon.Open();
                            DateTime date = DateTime.Now;
                            DateTime re_date = Convert.ToDateTime(txtbr_returndate.Text);
                            if (date < re_date)
                            {
                                if (Convert.ToInt32((re_date - date).TotalDays) < 16)
                                {
                                    string query = "insert into library_and_book_store.borrowbook values('" + Session["Userid"] + "','"
                                        + Session["bookid"] + "','" + txtbr_name.Text + "','" + txtbr_houseno.Text + "','" + txtbr_streetno.Text
                                        + "','" + txtbr_sectorno.Text + "','" + txtbr_postalcode.Text + "','" + date.ToString("yyyy-MM-dd") + "','"
                                        + txtbr_returndate.Text + "');";
                                    MySqlCommand sqlcmd = new MySqlCommand(query, sqlcon);
                                    sqlcmd.ExecuteNonQuery();
                                    lblbr_msg.Text = "Borrowed Successfull";
                                    Session["bookid"] = null;
                                }
                                else
                                {
                                    lblbr_msg.Text = "You can borrow for maximum 15 days !!";
                                }

                            }
                            else
                            {
                                lblbr_msg.Text = "Invalid Return date";
                            }

                            sqlcon.Close();
                        }

                    }
                    catch (Exception ex)
                    {

                        lblbr_msg.Text = ex.Message;
                        if (ex.Message == "String was not recognized as a valid DateTime.")
                        {
                            lblbr_msg.Text = "Invalid Return date";
                        }
                        else
                        {
                            lblbr_msg.Text = "Selected Book already borrowed !!!";
                        }

                    }
                }
                else
                {
                    lblbr_msg.Text = "Please Pay Your Fine First !!!";
                }
            }
            else
            {
                lblbr_msg.Text = "Only Library Member Can borrow Book";
            }
        }
        protected bool Ismember()
        {
            using (MySqlConnection sqlcon=new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string query= "select MemberId from member where MemberId='"+Session["Userid"]+"';";
                MySqlDataAdapter adp = new MySqlDataAdapter(query, sqlcon);
                DataSet ds = new DataSet();
                sqlcon.Close();
                adp.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    return false;  
                }
                else
                {
                    return true;
                }
                
            }
                
        }


        public bool IsClearFine()
        {
            using (MySqlConnection sqlcon = new MySqlConnection(connectionstring))
            {
                sqlcon.Open();
                string query = "select sum(Fine) from returned_book where Userid='" + Session["Userid"] + "';";
                MySqlDataAdapter adp = new MySqlDataAdapter(query, sqlcon);
                DataSet ds = new DataSet();
                sqlcon.Close();
                adp.Fill(ds);
                if (Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString()) > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }

            }
        }


    }
}