<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchcheque.aspx.cs" Inherits="caiwu_searchcheque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="960px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司支票领用管理登记表</center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="ChequeId" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" Width="100%" AllowPaging="True" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="ChequeId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ChequeId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
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
                    SortExpression="ChequeDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_ChequeManager] WHERE ([UserId] = ?) ORDER BY [ChequeDate] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

