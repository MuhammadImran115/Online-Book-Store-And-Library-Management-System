<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="Library_and_online_book_store.AddBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
        
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="row jumbotron">
        <div class="col-md-2">

        </div>

        <div class="col-md-4">
 <!--<asp:Label ID="lbllibtitle" runat="server" CssClass="auto-style10" Text="LIBRARIAN"></asp:Label>-->
 
<!--    <asp:Label ID="lblbookid" runat="server" Text="Bookid :"></asp:Label><br />-->
            <label><b>BookId :</b></label><br />
            <asp:TextBox ID="txtb_id" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_id" runat="server" ControlToValidate="txtb_id" ErrorMessage="*BookId Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
           <label><b>Book Title :</b></label><br />      
            <!--<asp:Label ID="lblb_title" runat="server" Text="Book Title :"></asp:Label>-->

            <asp:TextBox ID="txtb_title" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_title" runat="server" ControlToValidate="txtb_title" ErrorMessage="*Book Title Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
             <label><b>Author :</b></label><br />     
            <!--<asp:Label ID="lblb_author" runat="server" Text="Author :"></asp:Label>-->

           <asp:TextBox ID="txtb_author" runat="server" CssClass="form-control col-md-12"></asp:TextBox>

            <asp:RequiredFieldValidator ID="reqtxtb_author" runat="server" ControlToValidate="txtb_author" ErrorMessage="*Author Name Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />

             <label><b>Publisher :</b></label><br />     
            <!--<asp:Label ID="lblb_publisher" runat="server" Text="Publisher :"></asp:Label>-->

            <asp:TextBox ID="txtb_publisher" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_publisher" runat="server" ControlToValidate="txtb_publisher" ErrorMessage="*Publisher Name Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
           
            <label><b>Category :</b></label><br />  
            
            <!--<asp:Label ID="lblb_cat" runat="server" Text="Category :"></asp:Label>-->
  
            <asp:TextBox ID="txtb_cat" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_cat" runat="server" ControlToValidate="txtb_cat" ErrorMessage="*Book Category Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            
            <label><b>Edition :</b></label><br />     
            
            <!--<asp:Label ID="lblb_edtion" runat="server" Text="Edition :"></asp:Label>-->
  
            <asp:TextBox ID="txtb_edtion" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_edtion" runat="server" ControlToValidate="txtb_edtion" ErrorMessage="*Book Edition Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />

        </div>

        <div class="col-md-4">
            <label><b>Price :</b></label><br />

            <!--<asp:Label ID="lblb_price" runat="server" Text="Price"></asp:Label>-->
  
             <asp:TextBox ID="txtb_price" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_price" runat="server" ControlToValidate="txtb_price" ErrorMessage="*Book Price Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            
            <label><b>Page :</b></label><br />

            <!--<asp:Label ID="lblb_page" runat="server" Text="Page :"></asp:Label>-->

            <asp:TextBox ID="txtb_page" runat="server" CssClass="form-control col-md-12"></asp:TextBox>

            <asp:RequiredFieldValidator ID="reqtxtb_page" runat="server" ControlToValidate="txtb_page" ErrorMessage="*No of Book Pages Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            
            <label><b>Publish Date :</b></label><br />

            <!--<asp:Label ID="lblPubdate" runat="server" Text="Published Date :"></asp:Label>-->
            
            <asp:TextBox ID="txtb_publishdate" runat="server" CssClass="form-control col-md-12"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="reqtxtb_publishdate" runat="server" ControlToValidate="txtb_publishdate" ErrorMessage="*Book Published date Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            <label><b>Book Image :</b></label><br />

            <!--<asp:Label ID="lblbookimg" runat="server" Text="Book Image"></asp:Label>-->

            <asp:FileUpload ID="saveBookimg" runat="server"  class="form-control-file"/>

            <asp:RequiredFieldValidator ID="reqb_image" runat="server" ControlToValidate="saveBookimg" ErrorMessage="*Book image Required" ValidationGroup="a"></asp:RequiredFieldValidator>
           <br /><br />
            
            <label><b>Book :</b></label><br />

           <!-- <asp:Label ID="lbl_b_pdf" runat="server" Text="Book :"></asp:Label>-->

           <asp:FileUpload ID="saveBookpdf" runat="server"/>
           
            <asp:RequiredFieldValidator ID="req_bpdf" runat="server" ControlToValidate="saveBookpdf" ErrorMessage="*Book pdf Required" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnbook_save" runat="server" Text="Save" OnClick="btnbook_save_Click" class="btn btn-info col-md-12" ValidationGroup="a" />
            <br />
            <br />
            <asp:Label ID="lblSaveMsg" runat="server"></asp:Label>
            
       </div>
    </div>
</asp:Content>

