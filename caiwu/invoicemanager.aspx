<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="invoicemanager.aspx.cs" Inherits="caiwu_invoicemanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="940px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司发票领用管理登记表</center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" Width="940px" 
             DataKeyNames="InvoiceId" 
            onrowdatabound="GridView1_RowDataBound" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" HeaderText="编辑" >
                <ItemStyle Width="40px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="序号" SortExpression="InvoiceId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("InvoiceId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="UserFullName" HeaderText="登记人" 
                    SortExpression="UserFullName" ReadOnly="True" />
                <asp:BoundField DataField="InvoiceContent" HeaderText="领用事由" 
                    SortExpression="InvoiceContent" />
                <asp:BoundField DataField="InvoiceName" HeaderText="付款单位" 
                    SortExpression="InvoiceName" />
                <asp:BoundField DataField="ContactName" HeaderText="联系人" 
                    SortExpression="ContactName" />
                <asp:BoundField DataField="ContactTel" HeaderText="联系固话" 
                    SortExpression="ContactTel" />
                <asp:BoundField DataField="ContactPhone" HeaderText="联系手机" 
                    SortExpression="ContactPhone" />
                <asp:BoundField DataField="InvoiceCom" HeaderText="出票单位" 
                    SortExpression="InvoiceCom" />
                <asp:BoundField DataField="InvoicePrice" HeaderText="开票金额" 
                    SortExpression="InvoicePrice" />
                <asp:BoundField DataField="WriteDate" HeaderText="开具时间" 
                    SortExpression="WriteDate" />
                <asp:BoundField DataField="InvoiceMaker" HeaderText="经办人" 
                    SortExpression="InvoiceMaker" />
                <asp:BoundField DataField="InMoney" HeaderText="回款情况" 
                    SortExpression="InMoney" />
                <asp:BoundField DataField="InvoiceNotes" HeaderText="备注" 
                    SortExpression="InvoiceNotes" />
                <asp:BoundField DataField="InvoiceDate" HeaderText="登记日期" 
                    SortExpression="InvoiceDate" ReadOnly="True" DataFormatString="{0:f}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [v_invoice] ORDER BY [InvoiceDate] DESC" 
            
            UpdateCommand="UPDATE v_invoice SET  InvoiceContent = ?, InvoiceName = ?,ContactName = ?, ContactTel = ?, ContactPhone = ?,InvoiceCom = ?, InvoicePrice = ?, WriteDate = ?, InvoiceMaker = ?,   InMoney = ?, InvoiceNotes = ? WHERE (InvoiceId = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

