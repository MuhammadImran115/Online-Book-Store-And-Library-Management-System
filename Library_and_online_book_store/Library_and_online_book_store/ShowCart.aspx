<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowCart.aspx.cs" Inherits="Library_and_online_book_store.ShowCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="jumbotron jumbotron">

    <asp:GridView ID="gvshoppingcart" runat="server" BorderStyle="None" 
                CellPadding="15" AutoGenerateColumns="false" OnRowDeleting="gvshoppingcart_RowDeleting"  OnRowCommand="gvshoppingcart_RowCommand" >
                 
                 
                  <HeaderStyle Width="10%" CssClass="bg-secondary text-center" />
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" /> 
            <Columns>

                <asp:TemplateField HeaderText="Bookid">
                            <ItemTemplate>
                                <asp:Label ID="lblbookid" runat="server" Text='<%# Eval("Bookid") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>
                <asp:BoundField DataField="BookTitle" HeaderText="Title" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Badddate" HeaderText="Added Date" ItemStyle-HorizontalAlign="Center" />
                
                <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblpirce" runat="server" Text='<%# Eval("Price") %>' />    
                            </ItemTemplate>
                </asp:TemplateField>
                
                
                <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:Button ID="btnCartRemove" runat="server" CssClass="btn" CausesValidation="false" 
                                    CommandName="Delete" Text="Remove"> </asp:Button>

                            </ItemTemplate>

                        </asp:TemplateField>
            <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:Button ID="btnBuyBook" runat="server" CssClass="btn" CausesValidation="false" 
                                    CommandName="CheckOut" Text="Check Out" CommandArgument="<%# Container.DataItemIndex %>" > </asp:Button>

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
       <asp:Label ID="lblCartRemoveMsg" runat="server"></asp:Label>

        </div>
</asp:Content>










