<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addtenderuser.aspx.cs" Inherits="baseinfo_addtenderuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="100%">
    <h4>项目报备人添加表</h4>
     <table style="width:50%;">
           <tr>
               <td align="right">
                  <asp:Label ID="Label1" runat="server" Text="登录名称"></asp:Label></td>
               <td>
                   <asp:TextBox ID="TtenderLoginName" Width="120px" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="TtenderLoginName" ErrorMessage="必须填写“用户登录名”。" ToolTip="必须填写“用户登录名”。" 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
           </td>
           </tr>
           <tr>
               <td align="right">
                   <asp:Label ID="Label2" runat="server" Text="登录密码"></asp:Label>
               </td>
               <td>
                   <asp:TextBox ID="newPassword" Width="120px" runat="server" TextMode="Password"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="newPassword" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                                    ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator></td>
           </tr>
           <tr>
               <td align="right">
                   <asp:Label ID="Label3" runat="server" Text="确认密码"></asp:Label>
                    </td>
               <td>
                   <asp:TextBox ID="confirmPassword" Width="120px" runat="server" 
                       TextMode="Password"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" ErrorMessage="必须填写“确认密码”。" 
                                    ToolTip="必须填写“确认密码”。" ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
              </td>
           </tr>
           <tr>
               <td align="center" colspan="2">
                   <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="newPassword" ControlToValidate="ConfirmPassword" 
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

