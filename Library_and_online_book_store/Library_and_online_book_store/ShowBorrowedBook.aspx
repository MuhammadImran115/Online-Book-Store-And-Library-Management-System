<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowBorrowedBook.aspx.cs" Inherits="Library_and_online_book_store.ShowBorrowedBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="jumbotron jumbotron">
    
        <asp:GridView ID="gvborrowedbook" runat="server"  BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" AutoGenerateColumns="False" OnRowDeleting="gvborrowedbook_RowDeleting" >
                 
                 <HeaderStyle Width="10%" CssClass="bg-secondary text-center" />
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" />

                <Columns>
                    <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate>
                                <asp:Label ID="lblb_userid" runat="server" Text='<%# Eval("Userid") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Book ID">
                            <ItemTemplate>
                                <asp:Label ID="lblb_bookid" runat="server" Text='<%# Eval("Bookid") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>

                    <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="HouseNo" HeaderText="House No" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="StreetNo" HeaderText="Street No" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="SectorNo" HeaderText="Sector No" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="IssuDate" HeaderText="Issue Date" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" ItemStyle-HorizontalAlign="Center"/>

                    
                    <asp:TemplateField ShowHeader="false">
                            <ItemTemplate>
                                <asp:Button ID="btnborrowedbookDelete" CssClass="btn" runat="server" CausesValidation="false" 
                                    CommandName="Delete" Text="Delete"> </asp:Button>

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


            <asp:Label ID="lblb_bookDeleteMsg" runat="server"></asp:Label>
            </div>

</asp:Content>


