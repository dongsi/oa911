<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<style type="text/css">
body
{
    margin:200px;
    background-color:#0056ba;
    font-size:16px;
    }
table
{
    background-color:#0056ba;
    }
.logindiv
{
    padding:10px 10px 10px 10px;
    width:260px;
    margin-left:auto;
    margin-right:auto;
    border:1px solid black;
    background-image: url('image/v4_dlbg.gif');
    }

</style>
    <title>山东风范电子科技有限公司</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="logindiv" >
    
        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3"  
            BorderPadding="4"  Font-Names="Verdana" 
            Font-Size="1em"  onauthenticate="Login1_Authenticate" 
             Width="253px" onloggedin="Login1_LoggedIn" >
            <InstructionTextStyle Font-Italic="True"  />
            <LayoutTemplate>
                <table cellpadding="4" cellspacing="0" 
                    style="border-collapse:collapse; ">
                    <tr>
                        <td>
                            <table cellpadding="0" style="width:253px;">
                                <tr>
                                    <td align="center" class="login_title" colspan="2" 
                                        style="color:White;font-size:0.9em;font-weight:bold; height:30px;">
                                        山东风范电子科技有限公司OA系统</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                            ForeColor="White">用户名:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" Font-Size="1em" Width="160px" EnableTheming="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                            ForeColor="White">密码:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" Font-Size="1em" TextMode="Password" 
                                            Width="160px" EnableTheming="false"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                                            ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text="下次记住我。" ForeColor="White" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" 
                                             CommandName="Login" 
                                            CssClass="login_button" Font-Names="Verdana"  
                                             Text="登录" ValidationGroup="Login1" />
                                        <asp:Button ID="Bexit" runat="server" onclick="Bexit_Click" Text="退出" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" CssClass="login_button" />
            <TextBoxStyle Font-Size="1em" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="1em" 
                ForeColor="White"  />
        </asp:Login>
    
    </div>
    </form>
</body>
</html>
