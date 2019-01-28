<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowAllBookList.aspx.cs" Inherits="Library_and_online_book_store.ShowAllBookList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="jumbotron jumbotron">

    <asp:GridView ID="gvshowbooklist" runat="server" BorderStyle="None" BorderWidth="1px"
                CellPadding="10" AutoGenerateColumns="false" OnRowDeleting="gvshowbooklist_RowDeleting">


                 <HeaderStyle Width="10%" CssClass="bg-secondary text-center" />
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" />

                <Columns>

                    <asp:TemplateField HeaderText="Bookid">
                        <ItemTemplate>
                            <asp:Label ID="lblbookid" runat="server" Text='<%# Eval("BookId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BookTitle" HeaderText="Title" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Publisher" HeaderText="Publisher" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="BookEdition" HeaderText="Book Edition" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="Page" HeaderText="Pages" ItemStyle-HorizontalAlign="Center" />

                    <asp:TemplateField ShowHeader="false">
                        <ItemTemplate>
                            <asp:Button ID="btnCartRemove" runat="server" CssClass="btn" CausesValidation="false"
                                CommandName="Delete" Text="Delete"></asp:Button>
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
                <FooterStyle />
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
                     <asp:Label ID="lblBookDeleteMsg" runat="server"></asp:Label>

       </div>
</asp:Content>







