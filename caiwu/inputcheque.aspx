<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputcheque.aspx.cs" Inherits="caiwu_inputcheque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="960px">
        <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司支票领用管理登记表</center>
    <table style="width:100%;" cellpadding="0" cellspacing="0" class="alltable">
        <tr>
            <td colspan="2">
                领用事由</td>
            <td colspan="2">
                收款单位</td>
            <td colspan="2">
                联系地址</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="ChequeContent" runat="server" Height="60px" 
                    TextMode="MultiLine" Width="280px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ChequeContent" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td colspan="2">
                <asp:TextBox ID="ChequeCom" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="280px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ChequeCom" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td colspan="2">
                <asp:TextBox ID="ComAddress" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="280px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="ComAddress" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                联系人</td>
            <td>
                <asp:TextBox ID="ContactName" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ContactName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td>
                联系固话</td>
            <td>
                <asp:TextBox ID="ContactTel" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ContactTel" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td>
                联系手机</td>
            <td>
                <asp:TextBox ID="ContactPhone" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="ContactPhone" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
               </td>
        </tr>
        <tr>
            <td>
                出票单位</td>
            <td colspan="2">
                <asp:TextBox ID="WriteCom" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="280px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="WriteCom" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td>
                票据号码</td>
            <td colspan="2">
                <asp:TextBox ID="ChequeNumber" runat="server" Width="280px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ChequeNumber" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
               </td>
        </tr>
        <tr>
            <td>
                支付金额</td>
            <td>
                <asp:TextBox ID="ChequePrice" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="ChequePrice" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td>
                开具时间</td>
            <td>
                <asp:TextBox ID="WriteDate" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="WriteDate" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
            <td>
                经办人</td>
            <td>
                <asp:TextBox ID="Operator" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="Operator" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newcheque">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                备注</td>
            <td colspan="4">
                <asp:TextBox ID="ChequeNotes" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="580px"></asp:TextBox>
                </td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="提交登记" 
                    ValidationGroup="newcheque" />
                </td>
        </tr>
        <tr>
            <td colspan="5" style="color: #FF0000; text-align: left">
                备注：所列各项必须如实填写，不得空格，出票单位填写：“风范”或“点击”。</td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_ChequeManager] WHERE [ChequeId] = ?" 
            InsertCommand="INSERT INTO [ob_ChequeManager] ([ChequeId], [UserId], [ChequeContent], [ChequeCom], [ComAddress], [ContactName], [ContactTel], [ContactPhone], [WriteCom], [ChequeNumber], [ChequePrice], [WriteDate], [Operator], [Approver], [ChequeNotes], [ChequeDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_ChequeManager]" 
            UpdateCommand="UPDATE [ob_ChequeManager] SET [UserId] = ?, [ChequeContent] = ?, [ChequeCom] = ?, [ComAddress] = ?, [ContactName] = ?, [ContactTel] = ?, [ContactPhone] = ?, [WriteCom] = ?, [ChequeNumber] = ?, [ChequePrice] = ?, [WriteDate] = ?, [Operator] = ?, [Approver] = ?, [ChequeNotes] = ?, [ChequeDate] = ? WHERE [ChequeId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ChequeId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ChequeId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="ChequeContent" Type="String" />
                <asp:Parameter Name="ChequeCom" Type="String" />
                <asp:Parameter Name="ComAddress" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="ContactTel" Type="String" />
                <asp:Parameter Name="ContactPhone" Type="String" />
                <asp:Parameter Name="WriteCom" Type="String" />
                <asp:Parameter Name="ChequeNumber" Type="String" />
                <asp:Parameter Name="ChequePrice" Type="String" />
                <asp:Parameter Name="WriteDate" Type="String" />
                <asp:Parameter Name="Operator" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="ChequeNotes" Type="String" />
                <asp:Parameter Name="ChequeDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="ChequeContent" Type="String" />
                <asp:Parameter Name="ChequeCom" Type="String" />
                <asp:Parameter Name="ComAddress" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="ContactTel" Type="String" />
                <asp:Parameter Name="ContactPhone" Type="String" />
                <asp:Parameter Name="WriteCom" Type="String" />
                <asp:Parameter Name="ChequeNumber" Type="String" />
                <asp:Parameter Name="ChequePrice" Type="String" />
                <asp:Parameter Name="WriteDate" Type="String" />
                <asp:Parameter Name="Operator" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="ChequeNotes" Type="String" />
                <asp:Parameter Name="ChequeDate" Type="DateTime" />
                <asp:Parameter Name="ChequeId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </asp:Panel>
</asp:Content>

