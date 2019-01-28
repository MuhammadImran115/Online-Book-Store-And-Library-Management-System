using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label2.Visible = true;
            string filePath = FileUpload1.PostedFile.FileName; // getting the file path of uploaded file  
            string filename1 = Path.GetFileName(filePath); // getting the file name of uploaded file  
            string ext = Path.GetExtension(filename1); // getting the file extension of uploaded file  
            string Type = String.Empty;
            if (!FileUpload1.HasFile)
            {
                Label2.Text = "Please Select File"; //if file uploader has no file selected  
            }
            else
            if (FileUpload1.HasFile)
            {
                try
                {
                    switch (ext) // this switch code validate the files which allow to upload only PDF file   
                    {
                        case ".pdf":
                            Type = "application/pdf";
                            break;
                    }
                    string connectionstring = @"Server=localhost;Database=tab;Uid=root;pwd=database123;";
                    if (Type != String.Empty)
                    {
                        using (MySqlConnection con = new MySqlConnection(connectionstring))
                        {
                            con.Open();
                            Stream fs = FileUpload1.PostedFile.InputStream;
                            BinaryReader br = new BinaryReader(fs); //reads the binary files  
                            Byte[] bytes = br.ReadBytes((Int32)fs.Length); //counting the file length into bytes  
                       //     Byte[] bytee = FileUpload1.FileBytes;
                            String query = "insert into tab.pdffiles (Name,Type,data)" + " values (@Name, @Type, @Data)"; //insert query  
                            MySqlCommand com = new MySqlCommand(query, con);
                            com.Parameters.Add("@Name", MySqlDbType.VarChar).Value = filename1;
                            com.Parameters.Add("@Type", MySqlDbType.VarChar).Value = Type;
                            com.Parameters.Add("@Data", MySqlDbType.Binary).Value = bytes;
                            com.ExecuteNonQuery();
                            Label2.ForeColor = System.Drawing.Color.Green;
                            Label2.Text = "File Uploaded Successfully";
                        }
                    }
                    else
                    {
                        Label2.ForeColor = System.Drawing.Color.Red;
                        Label2.Text = "Select Only PDF Files "; // if file is other than speified extension   
                    }
                }

                catch (Exception ex)
                {
                    Label2.Text = "Error: " + ex.Message.ToString();
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string connectionstring = @"Server=localhost;Database=tab;Uid=root;pwd=database123;";

            using (MySqlConnection con = new MySqlConnection(connectionstring))
            {
                con.Open();
                String query = "Select *from tab.pdffiles";
                MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                con.Close();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        { string connectionstring = @"Server=localhost;Database=tab;Uid=root;pwd=database123;";

            using (MySqlConnection con = new MySqlConnection(connectionstring))
            {
                con.Open();
                MySqlCommand com = new MySqlCommand("select Name,Type,data from tab.pdffiles where id=@id", con);
                com.Parameters.AddWithValue("id", GridView1.SelectedRow.Cells[1].Text);
                MySqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = dr["Type"].ToString();
                    Response.AddHeader("content-disposition", "attachment;filename=" + dr["Name"].ToString()); // to open file prompt Box open or Save file  
                    Response.Charset = "";
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.BinaryWrite((byte[])dr["data"]);
                    Response.End();
                }
            }
        }
    }
}