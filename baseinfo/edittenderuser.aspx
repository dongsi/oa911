<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="edittenderuser.aspx.cs" Inherits="baseinfo_edittenderuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel2" runat="server" Visible="False" HorizontalAlign="Center" 
        Width="100%">
    
                <table cellpadding="1" cellspacing="1" style="border-collapse:collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2">
                                        更改<asp:Label ID="LabelUserName" 
                                            runat="server" Text="用户"></asp:Label>
                                        密码</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="NewPasswordLabel" runat="server" 
                                            AssociatedControlID="NewPassword">新密码:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                            ControlToValidate="NewPassword" ErrorMessage="必须填写“新密码”。" ToolTip="必须填写“新密码”。" 
                                            ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                            AssociatedControlID="ConfirmNewPassword">确认新密码:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConfirmNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                            ControlToValidate="ConfirmNewPassword" ErrorMessage="必须填写“确认新密码”。" 
                                            ToolTip="必须填写“确认新密码”。" ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                            ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                            Display="Dynamic" ErrorMessage="“确认新密码”与“新密码”项必须匹配。" 
                                            ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                            CommandName="ChangePassword" Text="更改密码" ValidationGroup="ChangePassword1" 
                                            onclick="ChangePasswordPushButton_Click" />
                                    </td>
                                    <td>
                                        <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="取消" onclick="CancelPushButton_Click"  />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
    </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="100%">
       
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司管理报备人信息</center>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="TenderUserId"
       Width="100%" PageSize="20" onrowdeleting="GridView1_RowDeleting" 
        onrowupdating="GridView1_RowUpdating" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="TenderUserId" HeaderText="序号" 
            SortExpression="TenderUserId" InsertVisible="False" ReadOnly="True" 
             />
        <asp:BoundField DataField="UserLoginName" HeaderText="登录名称" 
            SortExpression="UserLoginName" >
        <HeaderStyle Width="200px" />
        </asp:BoundField>
        <asp:BoundField DataField="UserLoginPassword" HeaderText="UserLoginPassword" 
            SortExpression="UserLoginPassword" Visible="False" />
        
        <asp:CommandField  
            ShowEditButton="True"  UpdateText="确定" 
            HeaderText="编辑用户" />
	<asp:CommandField  ShowDeleteButton="True"
            DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
            HeaderText="删除用户" />
	<asp:CommandField SelectText="修改密码" 
           ShowSelectButton="True" HeaderText="修改密码" />
	<asp:BoundField DataField="AddDate" HeaderText="建立时间" ReadOnly="True" 
            SortExpression="AddDate" />
    </Columns>
</asp:GridView>
    </asp:Panel>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
    SelectCommand="SELECT * FROM [ob_Tenderinfo]" 
        DeleteCommand="DELETE FROM [ob_Tenderinfo] WHERE [TenderUserId] = ?" 
        
        UpdateCommand="UPDATE [ob_Tenderinfo] SET [UserLoginName] = ?, [UserLoginPassword] = ?, [AddDate] = ? WHERE [TenderUserId] = ?" 
        InsertCommand="INSERT INTO [ob_Tenderinfo] ([TenderUserId], [UserLoginName], [UserLoginPassword], [AddDate]) VALUES (?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
        <asp:Parameter Name="original_TenderUserId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="TenderUserId" Type="Int32" />
        <asp:Parameter Name="UserLoginName" Type="String" />
        <asp:Parameter Name="UserLoginPassword" Type="String" />
        <asp:Parameter Name="AddDate" Type="DateTime" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserLoginName" Type="String" />
        <asp:Parameter Name="UserLoginPassword" Type="String" />
        <asp:Parameter Name="AddDate" Type="DateTime" />
        <asp:Parameter Name="original_TenderUserId" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

