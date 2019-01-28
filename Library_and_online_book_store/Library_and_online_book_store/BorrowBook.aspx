<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BorrowBook.aspx.cs" Inherits="Library_and_online_book_store.BorrowBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


          
         
        <br />
    <div class="jumbotron jumbotron">

         <label><h1><b>Borrow Form</b></h1></label>
          <br />
           <br />
        
        <asp:Label ID="lblbr_name" runat="server" Text="Name :"></asp:Label>
            
            <asp:TextBox ID="txtbr_name" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
            <br />
            <br />
         
        
        <asp:Label ID="lblbr_houseno" runat="server" Text="House No :"></asp:Label>
            
            <asp:TextBox ID="txtbr_houseno" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
            <br />
            <br />
               <asp:Label ID="lblbr_streetno" runat="server" Text="Street No :"></asp:Label>
            
            <asp:TextBox ID="txtbr_streetno" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
            <br />
        <br />
        
        <asp:Label ID="lblbr_sectorno" runat="server" Text="Sector No :"></asp:Label>
            
            <asp:TextBox ID="txtbr_sectorno" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
            <br />
            <br />
        
        <asp:Label ID="lblbr_postalcode" runat="server" Text="Postal Code :"></asp:Label>
           
            <asp:TextBox ID="txtbr_postalcode" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
            <br />
        <br />
        
        <asp:Label ID="lblbr_returndate" runat="server" Text="Return Date:"></asp:Label>
        
            <asp:TextBox ID="txtbr_returndate" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
        <br />
        
        <br />
        
        
            
            <asp:Button ID="btnbr_borrow" runat="server" Text="Borrow" class="btn btn-info col-md-4" ValidationGroup="a" OnClick="btnbr_borrow_Click" />
            <br />
            <asp:Label ID="lblbr_msg" ForeColor="Red" runat="server"></asp:Label>
        <br />
       </div>
</asp:Content>









