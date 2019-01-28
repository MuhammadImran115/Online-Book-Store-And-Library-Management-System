<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Library_and_online_book_store.HomePage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:DataList ID="DtlistShowallbook" runat="server" BackColor="white" BorderColor="#E6E6FA"
                    BorderStyle="None" BorderWidth="10px" CellPadding="20" CellSpacing="15" Width="100%"
                    Font-Names="Verdana" Font-Size="Small" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal" CssClass="col-md-3">

                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

                    <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Large" ForeColor="White"
                        HorizontalAlign="Center" VerticalAlign="Middle" />

                    <HeaderTemplate>
                        All Book 
                            <asp:HyperLink ID="hlnkshowallbook" runat="server" NavigateUrl="ShowBook.aspx?category=All Books" ForeColor="Red" Text="View All"></asp:HyperLink>
                    </HeaderTemplate>


                    <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="2px" />

                    <ItemTemplate>
                        <asp:HyperLink ID="hlnkbookdetail" NavigateUrl='<%# string.Format("BookDetail.aspx?BookImgPath={0}&BookId={1}&BookTitle={2}&Author={3}&Publisher={4}&Category={5}&BookEdition={6}&Price={7}&Page={8}&PublishDate={9}",Eval("BookImgPath"),Eval("BookId"),Eval("BookTitle"),Eval("Author"),Eval("Publisher"),Eval("Category"),Eval("BookEdition"),Eval("Price"),Eval("Page"),Eval("PublishDate")) %>' runat="server">
                            <asp:Image ID="imgshbookpath" runat="server" Width="150px" Height="170px" ImageUrl='<%# Bind("BookImgPath") %>' Style="padding-left: 40px" /><br />
                        </asp:HyperLink>

                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblshbooktitle" runat="server" Text='<%# Bind("BookTitle") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblshbookauthor" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="lblshbookprice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>

            </>

        </tr>

        <tr>
            <td>
                <asp:DataList ID="DatalistNewRelease" runat="server" BackColor="white" BorderColor="#E6E6FA"
                    BorderStyle="None" BorderWidth="2px" CellPadding="20" CellSpacing="15" 
                    Font-Names="Verdana" Font-Size="Small" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal"
                    class="col-md-3">

                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

                    <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Large" ForeColor="White"
                        HorizontalAlign="Center" VerticalAlign="Middle" />

                    <HeaderTemplate>
                        New Releases
                            <asp:HyperLink ID="hlnknewrelsbook" runat="server" NavigateUrl="ShowBook.aspx?category=New Releases" ForeColor="Red" Text="View All"></asp:HyperLink>
                    </HeaderTemplate>

                    <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="2px" />

                    <ItemTemplate>
                        <asp:HyperLink ID="hlnkbookdetail" NavigateUrl='<%# string.Format("BookDetail.aspx?BookImgPath={0}&BookId={1}&BookTitle={2}&Author={3}&Publisher={4}&Category={5}&BookEdition={6}&Price={7}&Page={8}&PublishDate={9}",Eval("BookImgPath"),Eval("BookId"),Eval("BookTitle"),Eval("Author"),Eval("Publisher"),Eval("Category"),Eval("BookEdition"),Eval("Price"),Eval("Page"),Eval("PublishDate")) %>' runat="server">
                            <asp:Image ID="imgshbookpath" runat="server" Width="150px" Height="170px" ImageUrl='<%# Bind("BookImgPath") %>' Style="padding-left: 40px" /><br />
                        </asp:HyperLink>

                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblshbooktitle" runat="server" Text='<%# Bind("BookTitle") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblshbookauthor" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <asp:Label ID="lblshbookprice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>


            </td>

        </tr>



    </table>

</asp:Content>


