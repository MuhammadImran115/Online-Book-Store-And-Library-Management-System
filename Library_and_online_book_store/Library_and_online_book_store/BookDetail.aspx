<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="Library_and_online_book_store.BookDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
        .starRating{
            width:30px;
            height:30px;
            cursor:pointer;
            background-repeat:no-repeat;
            display:block;
            background-size: cover;
           
                
        }
        .FilledStars{
            background-image:url("Images/fullstar.png");
        }
        .WaitingStars{
            background-image:url("Images/fullstar.png");
        }
        .EmptyStars{
            background-image:url("Images/emptystar.png");
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-2">
            <asp:Image ID="imgbookdetail" runat="server" Width="147px" Height="197px" ImageUrl="" />
        </div>


        <div class="col-md-6">
           

            <b>Title :</b>

            <asp:Label ID="lbldebooktitle"  Font-Bold="true" runat="server" Text=""></asp:Label><br />

            <b>Author :</b>

            <asp:Label ID="lbldebookauthor"  Font-Bold="true" runat="server" Text=""></asp:Label><br />

            <b>Book ID :</b>

            <asp:Label ID="lbldebookid" runat="server" Text=""></asp:Label><br />

            <b>Publisher :</b>

            <asp:Label ID="lbldepub" runat="server" Text=""></asp:Label><br />

            <b>Category :</b>

            <asp:Label ID="lbldecat" runat="server" Text=""></asp:Label><br />

            <b>Edition :</b>

            <asp:Label ID="lbldeedition" runat="server" Text=""></asp:Label><br />

            <b>Price :</b>

            <asp:Label ID="lbldebookprice" runat="server" Text=""></asp:Label><br />

            <b>Page :</b>

            <asp:Label ID="lbldepage" runat="server" Text=""></asp:Label><br />



            <b>Publish Date :</b>

            <asp:Label ID="lbldepubdate" runat="server" Text=""></asp:Label> 
            <br />
            <br />
            <br />
            <asp:Label ID="lbladdcartmsg" runat="server"  ForeColor="White"></asp:Label>
            <br />
            <br />
            
            <div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <ajaxToolkit:Rating ID="Rating2" runat="server"
                            StarCssClass="starRating"
                            FilledStarCssClass="FilledStars"
                            EmptyStarCssClass="EmptyStars"
                            WaitingStarCssClass="WatingStars">
                        </ajaxToolkit:Rating>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <br />
                <asp:Button ID="btnsubmitrating" runat="server" Text="Submit" class="btn btn-info col-md-5" OnClick="btnsubmitrating_Click"/>
                <br />
                <br />
                <asp:Label ID="lblratingmsg" runat="server" ForeColor="White" Text=""></asp:Label>
                <br />
                <br />
                <br />
            </div>

        </div>

        <div class="col-md-3">

                <asp:Button ID="btnaddtocart" runat="server" Text="ADD TO CART" class="btn btn-info col-md-12" OnClick="btnaddtocart_Click" /><br/><br />


                <asp:Button ID="btnbuybook" runat="server" Text="Buy Book"  class="btn btn-info col-md-12" OnClick="btnbuybook_Click"/><br /><br />


                <asp:Button ID="btnborrow" runat="server" Text="Borrow Book" OnClick="btnborrow_Click" class="btn btn-info col-md-12"/><br /><br />
        </div>

        <asp:DataList ID="DtlistShowRelatedbook" runat="server" BackColor="white" BorderColor="#E6E6FA"
                    BorderStyle="None" BorderWidth="10px" CellPadding="20" CellSpacing="15" Width="100%"
                    Font-Names="Verdana" Font-Size="Small" GridLines="Both" RepeatColumns="4" RepeatDirection="Horizontal" CssClass="col-md-3">

                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />

                    <HeaderStyle BackColor="#333333" Font-Bold="True" Font-Size="Large" ForeColor="White"
                        HorizontalAlign="Center" VerticalAlign="Middle" />

                    <HeaderTemplate>
                        Related Books 
                            
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
    </div>

</asp:Content>


