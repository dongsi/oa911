<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="edituser.aspx.cs" Inherits="baseinfo_edituser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center style="font-size:1.0em;font-weight:bold;">公司现有用户信息表</center>
<asp:Panel ID="Panel2" runat="server" Visible="False" HorizontalAlign="Center" 
        Width="100%">
    
                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
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
     <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
  
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="UserId"
       Width="900px" onrowdeleting="GridView1_RowDeleting" 
        onrowupdating="GridView1_RowUpdating" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="UserId" HeaderText="UserId" 
            SortExpression="UserId" InsertVisible="False" ReadOnly="True" 
            Visible="False" />
        <asp:BoundField DataField="UserSimpName" HeaderText="用户登录名" 
            SortExpression="UserSimpName" />
        <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" 
            SortExpression="UserPassword" Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="用户姓名" 
            SortExpression="UserFullName" />
        <asp:TemplateField HeaderText="所属部门" SortExpression="DepartmentId">
            <EditItemTemplate>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="DepartmentName" 
                    DataValueField="DepartmentId"  Height="33px" Width="100px" 
                    SelectedValue='<%# Eval("DepartmentId") %>'>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="DepartmentName" 
                    Font-Size="14px" Height="33px" Width="100px"
                    DataValueField="DepartmentId" Enabled="False" 
                    SelectedValue='<%# Eval("DepartmentId") %>'>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="职务" SortExpression="UserRole">
            <EditItemTemplate>
                <asp:DropDownList ID="DDuserrole" runat="server" 
                    SelectedValue='<%# Eval("UserRole") %>'>
                    <asp:ListItem>经理</asp:ListItem>
                    <asp:ListItem>员工</asp:ListItem>
                </asp:DropDownList>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserRole") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="JoinDate" HeaderText="创建时间" 
            SortExpression="JoinDate" ReadOnly="True" />
        <asp:BoundField DataField="LastLoginTime" HeaderText="LastLoginTime" 
            SortExpression="LastLoginTime" Visible="False" />
        <asp:CheckBoxField DataField="Admin" HeaderText="是否管理员" 
            SortExpression="Admin" />
             <asp:CheckBoxField DataField="Resignation" HeaderText="是否离职" 
            SortExpression="Resignation" />
         <asp:CommandField  ShowSelectButton="True" SelectText="修改密码"  HeaderText="密码修改" />
 <asp:CommandField ShowEditButton="True"  SelectText="修改密码" UpdateText="确定"    HeaderText="编辑" />
 <asp:CommandField ShowDeleteButton="True" 
             DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" HeaderText="删除" />
    </Columns>
</asp:GridView>
  </asp:Panel>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
    SelectCommand="SELECT * FROM [ob_userinfo] where isDelete='0'" 
        DeleteCommand="DELETE FROM [ob_userinfo] WHERE [UserId] = ?" 
        
        UpdateCommand="UPDATE [ob_userinfo] SET [UserSimpName] = ?, [UserPassword] = ?, [UserFullName] = ?, [DepartmentId] = ?, [UserRole] = ?, [JoinDate] = ?, [LastLoginTime] = ?, [Admin] = ?, Resignation=? WHERE [UserId] = ?" 
        InsertCommand="INSERT INTO [ob_userinfo] ([UserId], [UserSimpName], [UserPassword], [UserFullName], [DepartmentId], [UserRole], [JoinDate], [LastLoginTime], [Admin],Resignation=? ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
        <asp:Parameter Name="original_UserId" Type="Int32" />
      </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="UserId" Type="Int32" />
        <asp:Parameter Name="UserSimpName" Type="String" />
        <asp:Parameter Name="UserPassword" Type="String" />
        <asp:Parameter Name="UserFullName" Type="String" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
        <asp:Parameter Name="UserRole" Type="String" />
        <asp:Parameter Name="JoinDate" Type="DateTime" />
        <asp:Parameter Name="LastLoginTime" Type="DateTime" />
        <asp:Parameter Name="Admin" Type="Boolean" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="UserSimpName" Type="String" />
        <asp:Parameter Name="UserPassword" Type="String" />
        <asp:Parameter Name="UserFullName" Type="String" />
        <asp:Parameter Name="DepartmentId" Type="Int32" />
        <asp:Parameter Name="UserRole" Type="String" />
        <asp:Parameter Name="JoinDate" Type="DateTime" />
        <asp:Parameter Name="LastLoginTime" Type="DateTime" />
        <asp:Parameter Name="Admin" Type="Boolean" />    
        <asp:Parameter Name="original_UserId" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
    SelectCommand="SELECT [DepartmentId], [DepartmentName] FROM [ob_Department]">
</asp:SqlDataSource>
</asp:Content>

