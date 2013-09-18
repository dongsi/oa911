<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="registrationExpress.aspx.cs" Inherits="registrationExpress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="text-align: center;">
    
         <table align="center" class="alltable" width="100%">
            <tr>
                <td align="center" colspan="6" style="font-size:1.0em;font-weight:bold;">
                   <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司快递收发登记表</center>
                   </td>
            </tr>
  <tr>
    <td style="width:80px">收件人</td>
     <td  >
                    <asp:TextBox ID="receiver" runat="server"  ></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="receiver" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
    <td style="width:80px">发件人</td>
     <td  >
                    <asp:TextBox ID="senders" runat="server"   ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="senders" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
                 <td style="width:80px">快递类型</td>
      <td  >
                   
                    <asp:DropDownList ID ="transceiverType" runat ="server"   Width="154px">
                        <asp:ListItem Text="快递收取" Value="快递收取"></asp:ListItem>
                        <asp:ListItem Text="快递发送" Value="快递发送"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                </tr>
  <tr >
    <td style="width:80px"  >邮寄单位</td>
      <td   colspan="3">
                   
                    <asp:TextBox ID="Mailunit" runat="server"   Width="320px"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="Mailunit" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
        
 
   
                <td style="width:80px">收发时间</td>
     <td  >
                    <asp:TextBox ID="sendReceiveTime" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="sendReceiveTime" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
  </tr>
  <tr>
    <td colspan="4">内容摘要</td>
    <td colspan="2">备注</td>
  </tr>
  <tr>
     <td colspan="4" style="height: 81px" width="200px">
                    <asp:TextBox ID="Content" runat="server" Height="80px" TextMode="MultiLine" 
                        Width="300%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="Content" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
    <td colspan="2">
        <asp:TextBox ID="note" runat="server" Height="80px" 
            TextMode="MultiLine" Width="98%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="note" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
     <td colspan="6" style="color: #FF0000;">
                   <asp:Label ID ="label1" runat ="server"  Text=" 备注：内容摘要主要记录收取还是发送的快递的大体内容，收发时间记录的是应该收取或者发送快递的日期。"></asp:Label><br/>
                    <asp:Button ID="Bsave" runat="server" Text="确认提交" onclick="Bsave_Click" 
                        ValidationGroup="newExpress" />
                        <asp:Label ID ="label2" runat ="server" Visible ="false"></asp:Label>
                </td>
  </tr>
</table>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                    SelectCommand="SELECT * FROM [ob_CourierTransceiver]">
                </asp:SqlDataSource>
</asp:Content>

