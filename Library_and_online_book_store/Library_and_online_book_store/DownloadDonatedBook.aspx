

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DownloadDonatedBook.aspx.cs" Inherits="Library_and_online_book_store.DownloadDonatedBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="jumbotron jumbotron">
        <asp:GridView ID="gvdonatebook" runat="server" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" AutoGenerateColumns="False" OnRowCommand="gvdonatebook_RowCommand">

                 <HeaderStyle Width="10%" CssClass="bg-secondary text-center"/>
                 <RowStyle Width="10%" CssClass="bg-white" />
                 <FooterStyle Width="10%" />                
            
            
           <Columns>
                    <asp:TemplateField HeaderText="User ID">
                            <ItemTemplate>
                                <asp:Label ID="lbld_bookid" runat="server" Text='<%# Eval("iddonatedbook") %>' />    
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="D_email" HeaderText="Doner Email" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="D_bookpath" HeaderText="Donated Book" ItemStyle-HorizontalAlign="Center"/>
                    <asp:BoundField DataField="D_date" HeaderText="Donated Date" ItemStyle-HorizontalAlign="Center"/>
                    <asp:TemplateField HeaderText="Download" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server"   CommandArgument='<%# Eval("D_bookpath") %>' CommandName="Download" Text="Click here" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                  
                </Columns>
                <FooterStyle/>
                <HeaderStyle/>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle/>
                <SelectedRowStyle Font-Bold="True"/>
                <SortedAscendingCellStyle />
                <SortedAscendingHeaderStyle/>
                <SortedDescendingCellStyle />
                <SortedDescendingHeaderStyle/>
            </asp:GridView>
    </div>

</asp:Content>
