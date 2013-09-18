<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ipaddtoname.aspx.cs" Inherits="baseinfo_ipaddtoname" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
    <br>
    <h4>编辑已知IP地址</h4>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="IpId" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            InsertItemPosition="LastItem" >
            <AlternatingItemTemplate>
                <tr style="background-color: #FAFAD2; color: #284775;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="IpIdLabel" runat="server" Text='<%# Eval("IpId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IpAddressLabel" runat="server" Text='<%# Eval("IpAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IpNameLabel" runat="server" Text='<%# Eval("IpName") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #FFCC66; color: #000080;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    </td>
                    <td>
                        <asp:Label ID="IpIdLabel1" runat="server" Text='<%# Eval("IpId") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IpAddressTextBox" runat="server" 
                            Text='<%# Bind("IpAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IpNameTextBox" runat="server" Text='<%# Bind("IpName") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table id="Table1" runat="server" 
                    style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                    <tr>
                        <td>
                            未返回数据。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:TextBox ID="IpAddressTextBox" runat="server" 
                            Text='<%# Bind("IpAddress") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="IpNameTextBox" runat="server" Text='<%# Bind("IpName") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #FFFBD6; color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="IpIdLabel" runat="server" Text='<%# Eval("IpId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IpAddressLabel" runat="server" Text='<%# Eval("IpAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IpNameLabel" runat="server" Text='<%# Eval("IpName") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="Tr2" runat="server" style="background-color: #FFFBD6; color: #333333;">
                                    <th id="Th1" runat="server">
                                    编辑</th>
                                    <th id="Th2" runat="server">
                                        序号</th>
                                    <th id="Th3" runat="server">
                                        IP地址</th>
                                    <th id="Th4" runat="server">
                                        已知地点</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" 
                            style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #FFCC66; font-weight: bold; color: #000080;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="删除" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="编辑" />
                    </td>
                    <td>
                        <asp:Label ID="IpIdLabel" runat="server" Text='<%# Eval("IpId") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IpAddressLabel" runat="server" Text='<%# Eval("IpAddress") %>' />
                    </td>
                    <td>
                        <asp:Label ID="IpNameLabel" runat="server" Text='<%# Eval("IpName") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_Ip] WHERE [IpId] = ?" 
            InsertCommand="INSERT INTO [ob_Ip] ([IpAddress], [IpName]) VALUES ( ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_Ip]" 
            UpdateCommand="UPDATE [ob_Ip] SET [IpAddress] = ?, [IpName] = ? WHERE [IpId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="IpId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IpAddress" Type="String" />
                <asp:Parameter Name="IpName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="IpAddress" Type="String" />
                <asp:Parameter Name="IpName" Type="String" />
                <asp:Parameter Name="IpId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

