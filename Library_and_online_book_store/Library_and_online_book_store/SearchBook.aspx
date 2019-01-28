<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchBook.aspx.cs" Inherits="Library_and_online_book_store.SearchBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="jumbotron jumbotron">

            <asp:GridView ID="gvsearchedbook" runat="server" BorderStyle="None" BorderWidth="1px"
                CellPadding="10" AutoGenerateColumns="false" >


                 <HeaderStyle Width="10%" CssClass="bg-secondary text-center" />
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" />

                <Columns>

                    <asp:TemplateField HeaderText="Bookid">
                        <ItemTemplate>
                            <asp:Label ID="lblbookid" runat="server" Text='<%# Eval("BookId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:BoundField DataField="BookTitle" HeaderText="Title" ItemStyle-HorizontalAlign="Center" />
                    
                    <asp:BoundField DataField="Author" HeaderText="Author" ItemStyle-HorizontalAlign="Center" />
                    
                    <asp:BoundField DataField="Category" HeaderText="Category" ItemStyle-HorizontalAlign="Center" />
                
                   
                    <asp:TemplateField HeaderText="Book Detail">
                        <ItemTemplate>
                         <asp:HyperLink ID="hlnkbookdetail" Text="Click here" NavigateUrl='<%# string.Format("BookDetail.aspx?BookImgPath={0}&BookId={1}&BookTitle={2}&Author={3}&Publisher={4}&Category={5}&BookEdition={6}&Price={7}&Page={8}&PublishDate={9}",Eval("BookImgPath"),Eval("BookId"),Eval("BookTitle"),Eval("Author"),Eval("Publisher"),Eval("Category"),Eval("BookEdition"),Eval("Price"),Eval("Page"),Eval("PublishDate")) %>' runat="server">
                            
                        </asp:HyperLink>
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
            <br />
            <br />
                     <asp:Label ID="lblBookSearchMsg"  runat="server" Font-Size="X-Large"></asp:Label>
        </div>

</asp:Content>
