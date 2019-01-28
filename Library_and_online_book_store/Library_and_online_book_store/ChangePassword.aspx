<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Library_and_online_book_store.ChangePassword1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="jumbotron jumbotron">

                        <label><b>Old Password :</b></label>
                         <!--<asp:Label ID="lbloldpass" runat="server" Text="Old Password"></asp:Label>-->
                    
                    
                        <asp:TextBox ID="txtoldpass" runat="server" TextMode="Password" CssClass="form-control col-md-4"></asp:TextBox><br />

                        <label><b>New Password :</b></label>
                        <!--<asp:Label ID="lblnewpass" runat="server" Text="New Password"></asp:Label>-->
                   
                   
                        <asp:TextBox ID="txtnewpass" runat="server" TextMode="Password" CssClass="form-control col-md-4"></asp:TextBox><br />
                   
                
                
                
                        <label><b>Confirm Password :</b></label>
                        <!--<asp:Label ID="lblconfpass" runat="server"  Text="Confirm Password"></asp:Label>-->
                
                        <asp:TextBox ID="txtconfpass" runat="server" TextMode="Password" CssClass="form-control col-md-4"></asp:TextBox><br />
                 
                        <asp:CompareValidator ID="passwordCompare" runat="server" controltovalidate="txtnewpass" controltocompare="txtconfpass" ErrorMessage="Password not matched" ForeColor="Red"></asp:CompareValidator>
                            <br />                   
                        <asp:Button ID="btnchangepass" runat="server" Text="Change password" OnClick="btnchangepass_Click" CssClass="btn btn-info col-md-4" />
                
                         <asp:Label ID="lblchpassmsg" runat="server"></asp:Label>
                                
        </div>
</asp:Content>



