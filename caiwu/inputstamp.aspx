<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputstamp.aspx.cs" Inherits="caiwu_inputstamp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="Server" Width="960px" HorizontalAlign="Center">
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司公章管理登记表</center>
    <table style="width:100%;" cellpadding="0" cellspacing="0" class="alltable">
        <tr>
            <td>
                事由</td>
            <td>
                使用单位</td>
            <td>
                联系地址</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="StampContent" runat="server" Height="60px" 
                    TextMode="MultiLine" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="StampContent" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:TextBox ID="StampUser" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="StampUser" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:TextBox ID="UserAddress" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="UserAddress" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                联系人</td>
            <td>
                联系固话</td>
            <td>
                联系手机</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="UserName" runat="server" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="UserName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:TextBox ID="UserTel" runat="server" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="UserTel" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:TextBox ID="UserPhone" runat="server" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="UserPhone" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                时间</td>
            <td>
                经办人</td>
            <td>
                备注</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="UseDate" runat="server" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="UseDate" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:TextBox ID="Operator" runat="server" Width="290px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="Operator" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newstamp">*</asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:TextBox ID="StampNotes" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="290px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: left; color: #FF0000;">
                备注：必须如实填写，不得空缺，以备核实（事由、使用单位、地址必须写全称，不得简化）。</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="提交登记" onclick="Button1_Click" />
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        DeleteCommand="DELETE FROM [ob_Stamp] WHERE [Stampid] = ?" 
        InsertCommand="INSERT INTO [ob_Stamp] ([Stampid], [UserId], [StampContent], [StampUser], [UserAddress], [UserName], [UserTel], [UserPhone], [UseDate], [Operator], [Approver], [StampNotes], [StampDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [ob_Stamp]" 
        UpdateCommand="UPDATE [ob_Stamp] SET [UserId] = ?, [StampContent] = ?, [StampUser] = ?, [UserAddress] = ?, [UserName] = ?, [UserTel] = ?, [UserPhone] = ?, [UseDate] = ?, [Operator] = ?, [Approver] = ?, [StampNotes] = ?, [StampDate] = ? WHERE [Stampid] = ?">
        <DeleteParameters>
            <asp:Parameter Name="Stampid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Stampid" Type="Int32" />
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="StampContent" Type="String" />
            <asp:Parameter Name="StampUser" Type="String" />
            <asp:Parameter Name="UserAddress" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserTel" Type="String" />
            <asp:Parameter Name="UserPhone" Type="String" />
            <asp:Parameter Name="UseDate" Type="String" />
            <asp:Parameter Name="Operator" Type="String" />
            <asp:Parameter Name="Approver" Type="String" />
            <asp:Parameter Name="StampNotes" Type="String" />
            <asp:Parameter Name="StampDate" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="StampContent" Type="String" />
            <asp:Parameter Name="StampUser" Type="String" />
            <asp:Parameter Name="UserAddress" Type="String" />
            <asp:Parameter Name="UserName" Type="String" />
            <asp:Parameter Name="UserTel" Type="String" />
            <asp:Parameter Name="UserPhone" Type="String" />
            <asp:Parameter Name="UseDate" Type="String" />
            <asp:Parameter Name="Operator" Type="String" />
            <asp:Parameter Name="Approver" Type="String" />
            <asp:Parameter Name="StampNotes" Type="String" />
            <asp:Parameter Name="StampDate" Type="DateTime" />
            <asp:Parameter Name="Stampid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Panel>
</asp:Content>

