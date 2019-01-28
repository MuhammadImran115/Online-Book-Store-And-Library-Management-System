<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Library_and_online_book_store.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="jumbotron jumbotron">
                         <label><b>First Name :</b></label><br />
                        <!--<asp:Label ID="lblprofname" runat="server" Text="First Name :"></asp:Label>-->
                    
                        <asp:TextBox ID="txtprofname" runat="server" Text="" CssClass="form-control col-md-4"></asp:TextBox><br />
                    
                
                         <label><b>Last Name :</b></label><br />                
                        <!--<asp:Label ID="lblprolname" runat="server" Text="Last Name :"></asp:Label>-->
                
                        <asp:TextBox ID="txtprolname" runat="server" Text="" CssClass="form-control col-md-4"></asp:TextBox><br />
                


                         <label><b>Email :</b></label><br />                
                        <!--<asp:Label ID="lblproemail" runat="server" Text="Email :"></asp:Label>-->
                 
                        <asp:Label ID="lblproedtemail" runat="server" Text="" CssClass="form-control col-md-4"></asp:Label><br />
                      


                         <label><b>User Id :</b></label><br />
                        <!--<asp:Label ID="lblprouserid" runat="server" Text="User ID :"></asp:Label>-->

                        <asp:Label ID="lblproedtuserid" runat="server" Text="" CssClass="form-control col-md-4"></asp:Label><br />




                         <label><b>Gender :</b></label><br />
                        <!--<asp:Label ID="lblprogerder" runat="server" Text="Gender :"></asp:Label>-->

                        <asp:Label ID="lblproedtgender" runat="server" Text="" CssClass="form-control col-md-4"></asp:Label><br />

                

                         <label><b>User Type :</b></label><br />
                        <!--<asp:Label ID="lblprousertype" runat="server" Text="User Type :"></asp:Label>-->

                        <asp:Label ID="lblproedtusertype" runat="server" Text="" CssClass="form-control col-md-4"></asp:Label><br />


                         <label><b>Phone no :</b></label><br />
                        <!--<asp:Label ID="lblprophone" runat="server" Text="Phone No :"></asp:Label>-->

                        <asp:TextBox ID="txtprophone" runat="server" Text="" CssClass="form-control col-md-4"></asp:TextBox><br />



                        <asp:Button ID="btnprochangepass" runat="server" OnClick="btnprochangepass_Click" Text="Change Password" CssClass="btn btn-info col-md-4" />
            <br />
            <br />


                        <asp:Button ID="btnproupdate" runat="server" Text="Update" OnClick="btnproupdate_Click" CssClass="btn btn-info col-md-4" />

                         <asp:Label ID="lblpromsg" runat="server" Text=""></asp:Label>

        </div>




</asp:Content>
