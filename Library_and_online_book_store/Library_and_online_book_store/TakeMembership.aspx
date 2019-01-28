<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TakeMembership.aspx.cs" Inherits="Library_and_online_book_store.TakeMembership" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron">
            <label><b>Terms and Condition:</b></label>
            <p>
                
                You are going to be a part our library managment system to avail the book borrow service.
                You are are supposed to return the borrowed book on due date.
                If you do not follow the pattern then you will be fined.
                You can borrow book maximum for 15 days .
            </p>

        </div>
    <div class="row">
        <div class="col-md-10">

        </div>
    
        <div class="col-md-2" >
            <asp:Button ID="btnagree" runat="server" Text="I Agree" CssClass="auto-style1" OnClick="btnagree_Click" />
        </div>
    </div>
    <div>
        <asp:Label ID="lbl_agreemsg" ForeColor="Red" runat="server"></asp:Label>
    </div>
        

</asp:Content>