<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DonateBook.aspx.cs" Inherits="Library_and_online_book_store.DonateBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">

        <div class="col-md-2">

        </div>

        <div class="col-md-4">
            <label><b><h4>Donate Book</h4></b></label>
          <!--<asp:Label ID="lbld_title" runat="server" Text="Donate Book" CssClass="auto-style2"></asp:Label>-->
            <br />
            <br />
            <br />
      
          <asp:FileUpload ID="Donatedbook" runat="server" Width="248px" />
            <br />
            <br />
            <br />
          <asp:Button ID="btnd_book" runat="server"  Text="Donate" class="btn btn-info col-md-4" OnClick="btnd_bookupload_Click"  />
        
            <br />
            <br />        
            <asp:Label ID="lbld_bookmsg" runat="server"></asp:Label>

        </div>

    </div>

</asp:Content>
