<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chequemanager.aspx.cs" Inherits="caiwu_chequemanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="960px" HorizontalAlign="Center" 
        ScrollBars="Auto">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司支票领用管理登记表</center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="ChequeId" 
            DataSourceID="SqlDataSource1" Width="100%" 
            
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:CommandField ShowEditButton="True" HeaderText="编辑" >
                <ItemStyle Width="30px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="ChequeId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ChequeId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="ChequeContent" HeaderText="领用事由" 
                    SortExpression="ChequeContent" />
                <asp:BoundField DataField="ChequeCom" HeaderText="收款单位" 
                    SortExpression="ChequeCom" />
                <asp:BoundField DataField="ComAddress" HeaderText="联系地址" 
                    SortExpression="ComAddress" />
                <asp:BoundField DataField="ContactName" HeaderText="联系人" 
                    SortExpression="ContactName" />
                <asp:BoundField DataField="ContactTel" HeaderText="联系固话" 
                    SortExpression="ContactTel" />
                <asp:BoundField DataField="ContactPhone" HeaderText="联系手机" 
                    SortExpression="ContactPhone" />
                <asp:BoundField DataField="WriteCom" HeaderText="出票单位" 
                    SortExpression="WriteCom" />
                <asp:BoundField DataField="ChequeNumber" HeaderText="票据号码" 
                    SortExpression="ChequeNumber" />
                <asp:BoundField DataField="ChequePrice" HeaderText="支付金额" 
                    SortExpression="ChequePrice" />
                <asp:BoundField DataField="WriteDate" HeaderText="开具时间" 
                    SortExpression="WriteDate" />
                <asp:BoundField DataField="Operator" HeaderText="经办人" 
                    SortExpression="Operator" />
                <asp:BoundField DataField="Approver" HeaderText="批准人" 
                    SortExpression="Approver" />
                <asp:BoundField DataField="ChequeNotes" HeaderText="备注" 
                    SortExpression="ChequeNotes" />
                <asp:BoundField DataField="ChequeDate" HeaderText="登记时间" 
                    SortExpression="ChequeDate" ReadOnly="True" DataFormatString="{0:f}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            
            SelectCommand="SELECT * FROM [ob_ChequeManager] ORDER BY [ChequeDate] DESC" 
            DeleteCommand="DELETE FROM [ob_ChequeManager] WHERE [ChequeId] = ?" 
            InsertCommand="INSERT INTO [ob_ChequeManager] ([ChequeId], [UserId], [ChequeContent], [ChequeCom], [ComAddress], [ContactName], [ContactTel], [ContactPhone], [WriteCom], [ChequeNumber], [ChequePrice], [WriteDate], [Operator], [Approver], [ChequeNotes], [ChequeDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            UpdateCommand="UPDATE [ob_ChequeManager] SET [ChequeContent] = ?, [ChequeCom] = ?, [ComAddress] = ?, [ContactName] = ?, 
            [ContactTel] = ?, [ContactPhone] = ?, [WriteCom] = ?, [ChequeNumber] = ?, [ChequePrice] = ?, 
            [WriteDate] = ?, [Operator] = ?, [Approver] = ?, [ChequeNotes] = ? WHERE [ChequeId] = ?">
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
               
                <asp:Parameter Name="ChequeId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

