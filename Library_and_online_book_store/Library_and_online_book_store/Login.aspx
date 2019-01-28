<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Library_and_online_book_store.Login" %>

<asp:Content ID="Logincontent" ContentPlaceHolderID="MainContent" runat="server">
    
    
        <div class="auto-style10">
        <div class="auto-style9">
            <br />
            <asp:Label ID="lbllogintitle" runat="server" CssClass="auto-style2" Text="Log In "></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblusername2" runat="server" Text="Username"> </asp:Label>

            <asp:TextBox ID="txtusername2" runat="server" CssClass="auto-style12" Width="165px"></asp:TextBox>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblpassword2" runat="server" Text="Password"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style11" Width="149px"></asp:TextBox>
&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="lblusertypelogin" runat="server" Text="User Type :"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="usertypelogin" runat="server" CssClass="auto-style8" Height="22px" Width="105px">
                <asp:ListItem>Student</asp:ListItem>
                <asp:ListItem>Teacher</asp:ListItem>
                <asp:ListItem>Administrator</asp:ListItem>
            </asp:DropDownList>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Button ID="btnlogin2" runat="server"  Text="Login" OnClick="btnlogin2_Click" Height="21px" Width="59px" CssClass="auto-style13" />
            <br />
            <br />
            <br />
        <p class="auto-style1">
            &nbsp;</p>
    

            <br />
            <br />
            <br />
        </div>
            &nbsp;<br />
            <br />
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    

    <style type="text/css">
        .auto-style8 {
            width: 174px;
            margin-left: 69px;
            margin-top: 0px;
        }
        .auto-style9 {
            width: 1092px;
            height: 253px;
            text-align: center;
        }
        .auto-style10 {
            width: 1092px;
            height: 332px;
        }
        .auto-style11 {
            margin-left: 28px;
        }
        .auto-style12 {
            margin-left: 33px;
        }
        .auto-style13 {
            margin-left: 117px;
        }
    </style>
</asp:Content>

