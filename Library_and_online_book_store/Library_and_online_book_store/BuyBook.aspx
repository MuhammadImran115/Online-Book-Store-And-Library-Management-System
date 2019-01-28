<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuyBook.aspx.cs" Inherits="Library_and_online_book_store.BuyBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    
   <div class="row">

       <div class="col-md-2">
           <label><b>Credit Card No :</b></label> 
       </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtcreditcardno" runat="server" CssClass="form-control col-md-8" ValidationGroup="a"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnpaynow" runat="server"  Text="Pay Now" class="btn btn-info col-md-4" OnClick="btnpaynow_Click"  />
        
            <br />
            <br />        
            <asp:Label  ID="lblbuymsg" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label>

            </div>
       </div>
</asp:Content>
