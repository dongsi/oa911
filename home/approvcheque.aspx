<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="approvcheque.aspx.cs" Inherits="home_approvcheque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="940px" HorizontalAlign="Center">
    <h4>审核支票申请表</h4>
    <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ChequeId" DataSourceID="SqlDataSource6" 
            EnableModelValidation="True" onrowupdating="GridView6_RowUpdating" 
            Width="100%" onrowdatabound="GridView6_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="ChequeId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ChequeId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="25px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="ChequeContent" HeaderText="领用事由" ReadOnly="True" 
                    SortExpression="ChequeContent" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="ChequeCom" HeaderText="收款单位" ReadOnly="True" 
                    SortExpression="ChequeCom" >
                <ItemStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="ComAddress" HeaderText="联系地址" ReadOnly="True" 
                    SortExpression="ComAddress" />
                <asp:BoundField DataField="ContactName" HeaderText="联系人" ReadOnly="True" 
                    SortExpression="ContactName" />
                <asp:BoundField DataField="ContactTel" HeaderText="联系固话" ReadOnly="True" 
                    SortExpression="ContactTel" />
                <asp:BoundField DataField="ContactPhone" HeaderText="联系手机" ReadOnly="True" 
                    SortExpression="ContactPhone" />
                <asp:BoundField DataField="WriteCom" HeaderText="出票单位" ReadOnly="True" 
                    SortExpression="WriteCom" />
                <asp:BoundField DataField="ChequeNumber" HeaderText="票据号码" ReadOnly="True" 
                    SortExpression="ChequeNumber" />
                <asp:BoundField DataField="ChequePrice" HeaderText="支付金额" ReadOnly="True" 
                    SortExpression="ChequePrice" />
                <asp:BoundField DataField="WriteDate" HeaderText="开具时间" ReadOnly="True" 
                    SortExpression="WriteDate" />
                <asp:BoundField DataField="Operator" HeaderText="经办人" ReadOnly="True" 
                    SortExpression="Operator" />
                <asp:BoundField DataField="Approver" HeaderText="批准人" 
                    SortExpression="Approver" />
                <asp:BoundField DataField="ChequeNotes" HeaderText="收款单位开票情况" 
                    SortExpression="ChequeNotes" />
                <asp:BoundField DataField="ChequeDate" HeaderText="申请时间" ReadOnly="True" 
                    SortExpression="ChequeDate" />
                <asp:CommandField ShowEditButton="True">
                <ItemStyle Width="60px" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_ChequeManager] WHERE [ChequeId] = ?" 
            InsertCommand="INSERT INTO [ob_ChequeManager] ([ChequeId], [UserId], [ChequeContent], [ChequeCom], [ComAddress], [ContactName], [ContactTel], [ContactPhone], [WriteCom], [ChequeNumber], [ChequePrice], [WriteDate], [Operator], [Approver], [ChequeNotes], [ChequeDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_ChequeManager] WHERE ([Approver] IS NULL) ORDER BY [ChequeDate] DESC" 
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

