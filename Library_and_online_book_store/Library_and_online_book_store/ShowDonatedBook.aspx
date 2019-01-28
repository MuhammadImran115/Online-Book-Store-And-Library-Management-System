<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowDonatedBook.aspx.cs" Inherits="Library_and_online_book_store.ShowDonatedBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="jumbotron jumbotron">
 
        <asp:GridView ID="gvdonatebook" runat="server" BorderStyle="None" BorderWidth="1px" 
                CellPadding="6" AutoGenerateColumns="False" OnRowDeleting="gvdonatebook_RowDeleting" >
                      
                <HeaderStyle Width="10%" CssClass="bg-secondary text-center" />
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" /> 
                
                <Columns>
                    <asp:TemplateField HeaderText="Sno">
                            <ItemTemplate>
                                <asp:Label ID="lbld_bookid" runat="server" Text='<%# Eval("iddonatedbook") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="D_email" HeaderText="Doner Email"/>
                    <asp:BoundField DataField="D_bookpath" HeaderText="Donated Book"/>
                    <asp:BoundField DataField="D_date" HeaderText="Donated Date"/>
                    
                    <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:Button ID="btndonatedbookDelete"  Cssclass="btn" runat="server" CausesValidation="false" 
                                    CommandName="Delete" Text="Reject"> </asp:Button>

                            </ItemTemplate>

                        </asp:TemplateField>
                  
                </Columns>
                  <FooterStyle />
                 <RowStyle HorizontalAlign="Center" />
                <HeaderStyle  Font-Bold="True" />
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle/>
                <SelectedRowStyle Font-Bold="True"/>
                <SortedAscendingCellStyle/>
                <SortedAscendingHeaderStyle/>
                <SortedDescendingCellStyle />
                <SortedDescendingHeaderStyle/>
            </asp:GridView>
            <asp:Label ID="lbld_bookDeleteMsg" runat="server"></asp:Label>

        </div>
</asp:Content>

