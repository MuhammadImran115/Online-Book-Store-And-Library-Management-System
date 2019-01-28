<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowUser.aspx.cs" Inherits="Library_and_online_book_store.ShowUser1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="jumbotron jumbotron">

    <asp:Label ID="lblShowUsertitle" runat="server" Text="Registered User" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
    
                <asp:GridView ID="gvShowUser" runat="server" BorderStyle="None" BorderWidth="1px" 
                CellPadding="6" AutoGenerateColumns="False" OnRowDeleting="gvShowUser_RowDeleting">

                 <HeaderStyle Width="10%" CssClass="bg-secondary text-center" />
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" />

                    <Columns>
                        <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate>
                                <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("Userid") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Fname" HeaderText="F_name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Lname" HeaderText="L_name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Usertype" HeaderText="User Type" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Phoneno" HeaderText="Phone no" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">
                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="10%">


                            <ItemStyle HorizontalAlign="Center" Width="10%"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:Button ID="btnUserDelete" CssClass="btn" runat="server" CausesValidation="false" 
                                    CommandName="Delete" Text="Delete"> </asp:Button>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>
                <FooterStyle/>
                <RowStyle HorizontalAlign="Center" />
                <HeaderStyle Font-Bold="True"/>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle/>
                <SelectedRowStyle Font-Bold="True"/>
                <SortedAscendingCellStyle/>
                <SortedAscendingHeaderStyle/>
                <SortedDescendingCellStyle/>
                <SortedDescendingHeaderStyle/>

                </asp:GridView>
            
        <br />
                <asp:Label ID="lblUserDeleteMsg" runat="server"></asp:Label>
        </div>

</asp:Content>
