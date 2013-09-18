<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adduser.aspx.cs" Inherits="baseinfo_adduser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
   
                    <table border=1 width=512px height=384px>
                        <tr>
                            <td align="center" colspan="2"style="color:White;background-color:#5D7B9D;font-size:1.8em;font-weight:bold;">

                                注册新帐户</td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户登录名:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" Width=148px runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="必须填写“用户登录名”。" ToolTip="必须填写“用户登录名”。" 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" Width=148px runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">确认密码:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" Width=148px runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" ErrorMessage="必须填写“确认密码”。" 
                                    ToolTip="必须填写“确认密码”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="FullName">真实姓名:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="FullName" Width=148px runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="FullNameRequired" runat="server" 
                                    ControlToValidate="FullName" ErrorMessage="必须填写真实姓名。" ToolTip="必须填写真实姓名。" 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                        <td class="style1">
                        <asp:Label ID="DepartmentLabel" runat="Server" >所属部门:</asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" Width="148px" 
                                DataSourceID="SqlDataSource1" DataTextField="DepartmentName" 
                                DataValueField="DepartmentId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                                ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                                SelectCommand="SELECT [DepartmentId], [DepartmentName] FROM [ob_Department]">
                            </asp:SqlDataSource>
                        </td>
                        </tr>
                        <tr>
                            <td class="style1">
                               职务:</td>
                                <td >
                                    <asp:DropDownList ID="DDUserRole" runat="server" Width="148px">
                                        <asp:ListItem>经理</asp:ListItem>
                                        <asp:ListItem Selected="True">员工</asp:ListItem>
                                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" ErrorMessage="“密码”和“确认密码”必须匹配。" 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                
                                <asp:Button ID="AddUserButton" runat="server" 
                                    ValidationGroup="CreateUserWizard1" Text="创建新用户" 
                                    onclick="AddUserButton_Click" />
                                
                            </td>
                        </tr>
                       
                    </table>
 </asp:Panel>
</asp:Content>

