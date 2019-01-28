<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowBook.aspx.cs" Inherits="Library_and_online_book_store.ShowBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div>
            <asp:Label ID="lbltitlecat" runat="server" Font-Size="X-Large" label="All Book"/>
                <br />
           </div>
           
           <asp:DataList ID="DataList1" runat="server" BackColor="white" BorderColor="#E6E6FA"

            BorderStyle="None" BorderWidth="2px" CellPadding="20" CellSpacing="15"

            Font-Names="Verdana" Font-Size="Small" GridLines="Both" RepeatColumns="5" RepeatDirection="Horizontal"

            class="col-md-3" >

            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

            <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Large" ForeColor="White"

                HorizontalAlign="Center" VerticalAlign="Middle" />
                
            <HeaderTemplate > <asp:Label ID="lblheadertemp" runat="server" Text="All Book"></asp:Label>  </HeaderTemplate>

            <ItemStyle BackColor="White" ForeColor="Black" BorderWidth="2px" />

            <ItemTemplate>
                <asp:HyperLink ID="hlnk" NavigateUrl='<%# string.Format("BookDetail.aspx?BookImgPath={0}&BookId={1}&BookTitle={2}&Author={3}&Publisher={4}&Category={5}&BookEdition={6}&Price={7}&Page={8}&PublishDate={9}",Eval("BookImgPath"),Eval("BookId"),Eval("BookTitle"),Eval("Author"),Eval("Publisher"),Eval("Category"),Eval("BookEdition"),Eval("Price"),Eval("Page"),Eval("PublishDate")) %>' runat="server">
                     <asp:Image ID="imgshbookpath" runat="server" Width="150px" Height="170px" ImageUrl='<%# Bind("BookImgPath") %>' style="padding-left:40px"/><br />
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
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lblshbookprice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        </td>
                    </tr>
                
                </table>
                    
            </ItemTemplate>

        </asp:DataList>

</asp:Content>
