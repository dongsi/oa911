<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputinvoice.aspx.cs" Inherits="caiwu_inputinvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        DeleteCommand="DELETE FROM [ob_InvoiceManager] WHERE [InvoiceId] = ?" 
        InsertCommand="INSERT INTO [ob_InvoiceManager] ([InvoiceId], [UserId], [InvoiceName],  [InvoiceContent], [WriteDate], [InvoiceMaker], [ContactName], [ContactTel], [ContactPhone], [InvoiceCom], [InvoicePrice], [InMoney], [InvoiceNotes], [InvoiceDate]) VALUES (?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [ob_InvoiceManager]" 
        UpdateCommand="UPDATE [ob_InvoiceManager] SET [UserId] = ?, [InvoiceName] = ?,  [InvoiceContent] = ?, [WriteDate] = ?, [InvoiceMaker] = ?, [ContactName] = ?, [ContactTel] = ?, [ContactPhone] = ?, [InvoiceCom] = ?, [InvoicePrice] = ?, [InMoney] = ?, [InvoiceNotes] = ?, [InvoiceDate] = ? WHERE [InvoiceId] = ?">
        <DeleteParameters>
            <asp:Parameter Name="InvoiceId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InvoiceId" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="InvoiceName" Type="String" />
            
            <asp:Parameter Name="InvoiceContent" Type="String" />
            <asp:Parameter Name="WriteDate" Type="String" />
            <asp:Parameter Name="InvoiceMaker" Type="String" />
            <asp:Parameter Name="ContactName" Type="Object" />
            <asp:Parameter Name="ContactTel" Type="String" />
            <asp:Parameter Name="ContactPhone" Type="String" />
            <asp:Parameter Name="InvoiceCom" Type="String" />
            <asp:Parameter Name="InvoicePrice" Type="String" />
            <asp:Parameter Name="InMoney" Type="String" />
            <asp:Parameter Name="InvoiceNotes" Type="String" />
            <asp:Parameter Name="InvoiceDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="InvoiceName" Type="String" />
            
            <asp:Parameter Name="InvoiceContent" Type="String" />
            <asp:Parameter Name="WriteDate" Type="String" />
            <asp:Parameter Name="InvoiceMaker" Type="String" />
            <asp:Parameter Name="ContactName" Type="Object" />
            <asp:Parameter Name="ContactTel" Type="String" />
            <asp:Parameter Name="ContactPhone" Type="String" />
            <asp:Parameter Name="InvoiceCom" Type="String" />
            <asp:Parameter Name="InvoicePrice" Type="String" />
            <asp:Parameter Name="InMoney" Type="String" />
            <asp:Parameter Name="InvoiceNotes" Type="String" />
            <asp:Parameter Name="InvoiceDate" Type="DateTime" />
            <asp:Parameter Name="InvoiceId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="Server" HorizontalAlign="Center" Width="960px">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司发票领用管理登记表</center>

    <table class="alltable" width="930px" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="4" style="width: 593px">
                
                领用事由
            </td>
            <td colspan="2" style="width: 306px">
                付款单位
            </td>
        </tr>
        <tr style="height: 30px">
            <td colspan="4" style="width: 593px">

                <asp:TextBox ID="InvoiceContent" runat="server" TextMode="MultiLine" 
                    Width="570px" BackColor="#EEF3F8" Font-Bold="True" ForeColor="Black" 
                    Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="InvoiceContent" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td colspan="2" style="width: 306px">
                <asp:TextBox ID="InvoiceName" runat="server" TextMode="MultiLine" Width="290px" 
                    BackColor="#EEF3F8" Font-Bold="True" Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="InvoiceName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr style="width: 22%">
            <td style="width: 82px">
                
                联系人</td>
            <td style="width: 204px">
                <asp:TextBox ID="ContactName" runat="server" Width="184px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ContactName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 102px">
                联系固话</td>
            <td style="width: 204px">
                <asp:TextBox ID="ContactTel" runat="server" Width="190px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ContactTel" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 102px">
                联系手机</td>
            <td style="width: 204px">
                <asp:TextBox ID="ContactPhone" runat="server" Width="190px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ContactPhone" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="width: 286px">
                出票单位</td>
            <td style="width: 102px">
                开票金额</td>
            <td style="width: 204px">
                开具时间</td>
            <td style="width: 102px">
                经办人</td>
            <td style="width: 204px">
                回款情况</td>
        </tr>
        <tr>
            <td colspan="2" style="width: 286px">
                <asp:TextBox ID="InvoiceCom" runat="server" Width="190px" 
                    BackColor="#EEF3F8" Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="InvoiceCom" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 102px">
                <asp:TextBox ID="InvoicePrice" runat="server" Width="90px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="InvoicePrice" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 204px">
                <asp:TextBox ID="WriteDate" runat="server" Width="194px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="WriteDate" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 102px">
                <asp:TextBox ID="InvoiceMaker" runat="server" Width="92px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="InvoiceMaker" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
            <td style="width: 204px">
                <asp:TextBox ID="InMoney" runat="server" Width="194px" BackColor="#EEF3F8" 
                    Font-Bold="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="InMoney" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newinvoice">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 82px">
                备注</td>
            <td colspan="5" style="width: 818px">
                <asp:TextBox ID="InvoiceNotes" runat="server" TextMode="MultiLine" 
                    Width="818px" BackColor="#EEF3F8" Font-Bold="True" Height="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="5" style="width: 696px; color: #FF0000;">
                备注：所列各项必须如实填写，不得空格，出票单位填写：“风范”或“点击”。</td>
            <td style="width: 204px">
                <asp:Button ID="Button1" runat="server" Text="提交登记" onclick="Button1_Click" 
                    ValidationGroup="newinvoice" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="color: #FF0000;">
                <asp:Label ID="Label1" runat="server" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table>
    </asp:Panel>

</asp:Content>

