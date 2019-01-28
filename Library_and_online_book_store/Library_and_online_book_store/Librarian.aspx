<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Librarian.aspx.cs" Inherits="Library_and_online_book_store.Librarian1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style>
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">

        <div class="col-md-4 offset-md-2"><br /><br />
            <h1>Libaraian Panel</h1><br /><br />

            <asp:Button ID="btnaddbook" runat="server" OnClick="btnaddbook_Click" class="btn btn-info col-md-12" Text="Add Book"/>
            <br />
            <br />
            <asp:Button ID="btnShowUser" runat="server" Text="Show User" class="btn btn-info col-md-12" OnClick="btnShowUser_Click"/>
            <br />
            <br />
            <asp:Button ID="btnShowAllBook" runat="server" Text="Show All Books" class="btn btn-info col-md-12" OnClick="btnShowAllBook_Click"/>
            <br />
            <br />
            <asp:Button ID="btnshowb_book" runat="server" OnClick="btnshowb_book_Click" class="btn btn-info col-md-12" Text="Show Borrowed Books"/>
            <br />
            <br />
            <asp:Button ID="btndownloadD_book" runat="server" OnClick="btndownloadD_book_Click" class="btn btn-info col-md-12" Text="Download Donated Book"/>
            <br />
            <br />
            <asp:Button ID="btnshowdonatedbook" runat="server" Text="Approve/rejected Dontaed Book" class="btn btn-info col-md-12" OnClick="btnshowdonatedbook_Click"/>
            <br />
            <br />
        </div>
    </div>

</asp:Content>




