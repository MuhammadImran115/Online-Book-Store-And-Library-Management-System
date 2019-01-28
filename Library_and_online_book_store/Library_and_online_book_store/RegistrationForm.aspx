<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Library_and_online_book_store.RegistrationForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

        
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="jumbotron jumbotron">

     <label><h1><b>Registration</b></h1></label>
     <!--<asp:Label ID="lblregtitle" runat="server"  Text="Registration"></asp:Label>-->
            <br />
        <label><b>Firstname :</b></label>
     <!--<asp:Label ID="lblufname" runat="server" Text="First Name :"></asp:Label>-->
     <br />
     <asp:TextBox ID="txtufname" runat="server" CssClass="form-control col-md-4" ValidationGroup="a"></asp:TextBox>
     
    <asp:RequiredFieldValidator ID="ufnamereq" runat="server" ControlToValidate="txtufname" ErrorMessage="RequiredFieldValidator" ValidationGroup="a"></asp:RequiredFieldValidator>
       <br />
     <label><b>Lastname :</b></label>
    <!--<asp:Label ID="lblulname" runat="server" Text="Last Name :"></asp:Label>-->
    
    <asp:TextBox ID="txtulname" runat="server" CssClass="form-control col-md-4" ValidationGroup="a"></asp:TextBox>    
            <br />
     <label><b>Email :</b></label>
        <br />
    <!--<asp:Label ID="lbluemail" runat="server" Text="Email :"></asp:Label>-->
    
            <asp:TextBox ID="txtuemail" runat="server" CssClass="form-control col-md-4" placeholder="you@example.com" ValidationGroup="a" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="uemailreq" runat="server" ControlToValidate="txtuemail" ErrorMessage="RequiredFieldValidator" ValidationGroup="a"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="reguemailvalid" ControlToValidate="txtuemail" runat="server"  ErrorMessage="Invalid email" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" ></asp:RegularExpressionValidator>
            <br />
            
             <label><b>UserId :</b></label>
            <!--<asp:Label ID="lbluserid" runat="server" Text="User ID :" ></asp:Label>-->
    <br />
            <asp:TextBox ID="txtuserId" runat="server" CssClass="form-control col-md-4" placeholder="Numeric character ex 12345" ValidationGroup="a" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="useridreq" runat="server" ControlToValidate="txtuserid" ErrorMessage="RequiredFieldValidator" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            
            <label><b>Gender :</b></label>
            <!--<asp:Label ID="lblugender" runat="server" Text="Gender :"></asp:Label>-->
            <br />
            <asp:RadioButton ID="Male" runat="server" CssClass="btn btn-secondary active" GroupName="gender" Checked="true" Text="Male" />

            <asp:RadioButton ID="Female" runat="server" CssClass="btn btn-secondary active" GroupName="gender" Text="Female" />
            <br />
            <br />       
            
            <!--<asp:Label ID="lbluphoneno" runat="server" Text="Phone no :"></asp:Label>-->
            <label><b>Phone no :</b></label>
            <br />
            <asp:TextBox ID="txtuphoneno" runat="server" CssClass="form-control col-md-4" ValidationGroup="a"></asp:TextBox>
            
            <asp:RequiredFieldValidator ID="uphonenoreq" runat="server" ControlToValidate="txtuphoneno" class="alert alert-success" role="alert" ErrorMessage="RequiredFieldValidator" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
            <label><b>Password :</b></label>
            <!--<asp:Label ID="lblupassword" runat="server" Text="Password :"></asp:Label>-->
            <br />
            <asp:TextBox ID="txtupassword"  runat="server" TextMode="Password" CssClass="form-control col-md-4" ValidationGroup="a"></asp:TextBox>
         
            <asp:RequiredFieldValidator ID="upasswordreq" runat="server" ControlToValidate="txtupassword" class="alert alert-success" role="alert" ErrorMessage="RequiredFieldValidator" ValidationGroup="a"></asp:RequiredFieldValidator>
            <br />
           <label><b>Confrim Password :</b></label>
            <!--<asp:Label ID="lblCupassword" runat="server"  Text="Confirm Password"></asp:Label>-->
            <br />
            <asp:TextBox ID="txtCupassword" runat="server" CssClass="form-control col-md-4" TextMode="Password" style="left: 0px; top: 0px" ValidationGroup="a">a</asp:TextBox>
         
            <asp:CompareValidator ID="passwordCompare" runat="server"  controltovalidate="txtupassword" class="alert alert-success " role="alert" controltocompare="txtCupassword" ErrorMessage="Password not matched" ForeColor="Red"></asp:CompareValidator>                    
            <br />
            <label><b>UserType :</b></label>
            <!--<asp:Label ID="lbluserType" runat="server" Text="User Type"></asp:Label>-->
            <br />
            <asp:DropDownList ID="userType" runat="server" class="btn btn-info dropdown col-md-4" ValidationGroup="a">
                <asp:ListItem>Student</asp:ListItem>
                <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnureg" runat="server" class="btn btn-info col-md-4" Text="Register" OnClick="btnureg_Click" ValidationGroup="a" />

         
            <asp:Label runat="server" ID="lbluregerrormsg"></asp:Label>
        </div>

</asp:Content>
      
                
