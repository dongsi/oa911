<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegistrationCalls.aspx.cs" Inherits="RegistrationCalls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="text-align: center;">
    
         <table align="center" class="alltable" width="100%">
            <tr>
                <td align="center" colspan="6" style="font-size:1.0em;font-weight:bold;">
                   <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司话费公示登记表</center>
                   </td>
            </tr>
  <tr>
    <td style="width:80px">姓名</td>
     <td  >
                    <asp:TextBox ID="FullName" runat="server"  ></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="FullName" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
    <td style="width:80px">电话号码</td>
     <td  >
                    <asp:TextBox ID="PhoneNumber" runat="server"   ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="PhoneNumber" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
                 <td style="width:80px">话费期间</td>
      <td  >
                   
                     <asp:TextBox ID="DuringCalls" runat="server"     Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="DuringCalls" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
                </tr>
  <tr >
    <td style="width:80px"  >实际话费</td>
      <td   >
                   
                    <asp:TextBox ID="ActualCalls" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="ActualCalls" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
        
 
   
                <td style="width:80px">超出话费</td>
     <td  >
                    <asp:TextBox ID="ExcessCharges" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="ExcessCharges" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
                </td>
                <td >备注</td>
                <td >
        <asp:TextBox ID="Remark" runat="server"     Width="220px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="Remark" 
                        ValidationGroup="newExpress">*</asp:RequiredFieldValidator>
      </td>

  </tr>
  
  <tr>
     <td colspan="6" style="color: #FF0000;">
                   <asp:Label ID ="label1" runat ="server"  Text="备注：话费期间是指从几月几号到几月几号之间的话费。例“2013.7.1~2013.7.31” "></asp:Label><br/>
                    <asp:Button ID="Bsave" runat="server" Text="确认登记" onclick="Bsave_Click" 
                        ValidationGroup="newExpress" />
                        <asp:Label ID ="label2" runat ="server" Visible ="false"></asp:Label>
                </td>
  </tr>
</table>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                    SelectCommand="SELECT * FROM [ob_CallsPublicity]">
                </asp:SqlDataSource>
</asp:Content>

