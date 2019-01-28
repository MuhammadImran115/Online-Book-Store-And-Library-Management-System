using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Library_and_online_book_store
{
    public partial class Librarian1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnaddbook_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddBook.aspx");
        }
      

        protected void btndownloadD_book_Click(object sender,EventArgs e)
        {
            Response.Redirect("~/DownloadDonatedBook");
        }

        protected void btnShowUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowUser");
        }

        protected void btnShowAllBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowAllBookList.aspx");
        }

      

        protected void btnshowdonatedbook_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowDonatedBook.aspx");
        }

        
        protected void btnshowb_book_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ShowBorrowedBook.aspx");
        }
    }
}