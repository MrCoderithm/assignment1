<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookstoreForm.aspx.cs" Inherits="User_Registration.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 60%;
        }
        .auto-style2 {
            width: 438px;
        }
        .auto-style3 {
            width: 438px;
            height: 31px;
        }
        .auto-style4 {
            height: 31px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:HiddenField ID="hfUserID" runat="server" />
    <table>
        <tr>
             <td>
                <asp:Label Text="Book Title" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtbookTitle" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Author List" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtAuthorList" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="ISBN Number" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtISBNNumber" runat="server" />
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label Text="Publishing Date" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtPublishingDate" runat="server" />
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>


        <tr>
            <td>
                <asp:Label Text="Publisher" runat="server" />
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlPublisher" runat="server" Width="188px">
                    <asp:ListItem>Canadian</asp:ListItem>
                    <asp:ListItem>International</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>


         <tr>
            <td>
                <asp:Label Text="Category" runat="server" />
            </td>
            <td colspan="2">
                <asp:DropDownList ID="ddlCategory" runat="server" Width="190px">
                    <asp:ListItem>Childrens</asp:ListItem>
                    <asp:ListItem>Comics</asp:ListItem>
                    <asp:ListItem>Drama</asp:ListItem>
                    <asp:ListItem>Games</asp:ListItem>
                    <asp:ListItem>Health</asp:ListItem>
                    <asp:ListItem>Journals</asp:ListItem>
                    <asp:ListItem>Poetry</asp:ListItem>
                    <asp:ListItem>Sci-Fi</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Page Count" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtPageCount" runat="server" />
            </td>
        </tr>

           <tr>
            <td>
                <asp:Label Text="Price" runat="server" />
            </td>
            <td colspan="2">
                <asp:TextBox ID="txtPrice" runat="server" />
            </td>
        </tr>

        <tr>
            <td></td>
            <td colspan="2">
                <asp:Button Text="Submit" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Label Text="" ID="lblSuccessMessage" runat="server" ForeColor="Green" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Label Text="" ID="lblErrorMessage" runat="server" ForeColor="Red" />
            </td>
        </tr>

    </table>
    </div>

  
    
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                    <asp:BoundField DataField="book_title" HeaderText="book_title" SortExpression="book_title" />
                    <asp:BoundField DataField="author_list" HeaderText="author_list" SortExpression="author_list" />
                    <asp:BoundField DataField="isbn_number" HeaderText="isbn_number" SortExpression="isbn_number" />
                    <asp:BoundField DataField="publishing_date" HeaderText="publishing_date" SortExpression="publishing_date" />
                    <asp:BoundField DataField="publisher" HeaderText="publisher" SortExpression="publisher" />
                    <asp:BoundField DataField="page_count" HeaderText="page_count" SortExpression="page_count" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
    
        
    
        <p>&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Bookstore] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Bookstore] ([book_title], [author_list], [isbn_number], [publishing_date], [publisher], [page_count], [price], [category]) VALUES (@book_title, @author_list, @isbn_number, @publishing_date, @publisher, @page_count, @price, @category)" SelectCommand="SELECT * FROM [Bookstore]" UpdateCommand="UPDATE [Bookstore] SET [book_title] = @book_title, [author_list] = @author_list, [isbn_number] = @isbn_number, [publishing_date] = @publishing_date, [publisher] = @publisher, [page_count] = @page_count, [price] = @price, [category] = @category WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="book_title" Type="String" />
                    <asp:Parameter Name="author_list" Type="String" />
                    <asp:Parameter Name="isbn_number" Type="String" />
                    <asp:Parameter Name="publishing_date" Type="String" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="page_count" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="book_title" Type="String" />
                    <asp:Parameter Name="author_list" Type="String" />
                    <asp:Parameter Name="isbn_number" Type="String" />
                    <asp:Parameter Name="publishing_date" Type="String" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="page_count" Type="String" />
                    <asp:Parameter Name="price" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </p>
    
        
    
        <asp:Label ID="Label2" runat="server" Text="Enter Book Title: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
  

        <asp:Label ID="Label1" runat="server"></asp:Label>

    
         <br />
    
        
    
        <asp:Label ID="Label3" runat="server" Text="Enter Category Name: "></asp:Label>
       <asp:DropDownList ID="DropDownList3" runat="server" Width="190px">
                    <asp:ListItem>Childrens</asp:ListItem>
                    <asp:ListItem>Comics</asp:ListItem>
                    <asp:ListItem>Drama</asp:ListItem>
                    <asp:ListItem>Games</asp:ListItem>
                    <asp:ListItem>Health</asp:ListItem>
                    <asp:ListItem>Journals</asp:ListItem>
                    <asp:ListItem>Poetry</asp:ListItem>
                    <asp:ListItem>Sci-Fi</asp:ListItem>
                </asp:DropDownList>
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Search" />
  

        <asp:Label ID="Label4" runat="server"></asp:Label>

    
        <br />
    
        
    
        <asp:Label ID="Label5" runat="server" Text="Enter Book Price: "></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Search" />
  

        <asp:Label ID="Label6" runat="server"></asp:Label>

    
        <asp:RangeValidator ID="RangeValidatorPrice" runat="server" ControlToValidate="TextBox3" ErrorMessage="Out of range" MaximumValue="9999" MinimumValue="0"></asp:RangeValidator>

    
        <br />

      <asp:GridView ID="GridView3" runat="server">
        </asp:GridView>

    
        <br />
        <br />
        <br />
        <table align="center" class="auto-style1" id="result" runat="server">
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Book Title</td>
                <td>
                    <asp:Label ID="lblBookTitle" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Author List</td>
                <td>
                    <asp:Label ID="lblAuthorList" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ISBN Number</td>
                <td>
                    <asp:Label ID="lblISBNNumber" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Publishing Date</td>
                <td>
                    <asp:Label ID="lblPublishingDate" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Publisher</td>
                <td>
                    <asp:Label ID="lblPublisher" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category</td>
                <td class="auto-style4">
                    <asp:Label ID="lblCategory" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page Count</td>
                <td>
                    <asp:Label ID="lblPageCount" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price</td>
                <td>
                    <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
  

    </form>

            
        </body>
</html>
