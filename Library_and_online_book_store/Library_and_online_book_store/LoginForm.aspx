<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="Library_and_online_book_store.LoginForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style15 {
        margin-left: 1px;
    }
</style>
</asp:Content>

 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="jumbotron jumbotron">

     <label><h1><b>Log In </b></h1></label>
    <!--<asp:Label ID="lbllogintitle" runat="server" CssClass="auto-style2" Text="Log In " Font-Size="XX-Large"></asp:Label>-->
      <br />
     
     <label><b>Username :</b></label>
     <!--<asp:Label ID="lblusername2" runat="server" Text="Username :"></asp:Label>-->
    
    <asp:TextBox ID="txtusername2" runat="server" CssClass="form-control col-md-4" ValidationGroup="a"></asp:TextBox>
        <br />
     <label><b>Password :</b></label>
   <!--<asp:Label ID="lblpassword2" runat="server" Text="Password :"></asp:Label>-->
    
    <asp:TextBox ID="txtpassword2" TextMode="Password" runat="server" CssClass="form-control col-md-4" ValidationGroup="a"></asp:TextBox>
        <br />
     <label><b>User Type :</b></label>
    <!--<asp:Label ID="lblusertypelogin" runat="server" Text="User Type :"></asp:Label>-->
        <br />
    <asp:DropDownList ID="usertypelogin" runat="server" class="btn btn-info dropdown" Width="289px" ValidationGroup="a">
                <asp:ListItem>Student</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
                <asp:ListItem>Librarian</asp:ListItem>
            </asp:DropDownList>
    <br />
<br />
    <asp:Button ID="btnlogin2" runat="server"  Text="Login"  CssClass="btn btn-info" OnClick="btnlogin2_Click" Width="289px" ValidationGroup="a" />
      <br />
<br />
                <asp:Label ID="lblvalidmsg" runat="server"></asp:Label>
        </div>
</asp:Content>

