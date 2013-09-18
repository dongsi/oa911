<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchinvoice.aspx.cs" Inherits="caiwu_searchinvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="Server" Width="960px" HorizontalAlign="Center" 
        ScrollBars="Auto">
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司发票领用管理登记表</center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="960px" 
        AllowPaging="True" DataKeyNames="InvoiceId" onrowdatabound="GridView1_RowDataBound"
        onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                HeaderText="删除" ShowDeleteButton="True">
            <ItemStyle Width="30px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="编辑">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="更新"></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="取消"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="编辑"></asp:LinkButton>
                    
                </ItemTemplate>
                <ItemStyle Width="60px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                SortExpression="InvoiceId">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("InvoiceId") %>'></asp:Label>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                Visible="False" />
            <asp:BoundField DataField="InvoiceName" HeaderText="付款单位" 
                SortExpression="InvoiceName" ReadOnly="True" />
            <asp:BoundField DataField="InvoiceContent" HeaderText="领用事由" 
                SortExpression="InvoiceContent" ReadOnly="True" />
            <asp:BoundField DataField="WriteDate" HeaderText="开具时间" 
                SortExpression="WriteDate" ReadOnly="True" />
            <asp:BoundField DataField="InvoiceMaker" HeaderText="经办人" 
                SortExpression="InvoiceMaker" ReadOnly="True" />
            <asp:BoundField DataField="ContactName" HeaderText="联系人" 
                SortExpression="ContactName" ReadOnly="True" />
            <asp:BoundField DataField="ContactTel" HeaderText="联系固话" 
                SortExpression="ContactTel" ReadOnly="True" />
            <asp:BoundField DataField="ContactPhone" HeaderText="联系手机" 
                SortExpression="ContactPhone" ReadOnly="True" />
            <asp:BoundField DataField="InvoiceCom" HeaderText="出票单位" 
                SortExpression="InvoiceCom" ReadOnly="True" />
            <asp:BoundField DataField="InvoicePrice" HeaderText="开票金额" 
                SortExpression="InvoicePrice" ReadOnly="True" />
            <asp:BoundField DataField="InMoney" HeaderText="回款情况" 
                SortExpression="InMoney" />
            <asp:BoundField DataField="InvoiceNotes" HeaderText="备注" 
                SortExpression="InvoiceNotes" ReadOnly="True" />
            <asp:BoundField DataField="InvoiceDate" HeaderText="登记时间" 
                SortExpression="InvoiceDate" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
        SelectCommand="SELECT * FROM [ob_InvoiceManager] WHERE ([UserId] = ?) ORDER BY [InvoiceDate] DESC" 
        DeleteCommand="DELETE FROM [ob_InvoiceManager] WHERE [InvoiceId] = ?" 
        InsertCommand="INSERT INTO [ob_InvoiceManager] ([InvoiceId], [UserId], [InvoiceName], [InvoiceContent], [WriteDate], [InvoiceMaker], [ContactName], [ContactTel], [ContactPhone], [InvoiceCom], [InvoicePrice], [InMoney], [InvoiceNotes], [InvoiceDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [ob_InvoiceManager] SET [UserId] = ?, [InvoiceName] = ?, [InvoiceContent] = ?, [WriteDate] = ?, [InvoiceMaker] = ?, [ContactName] = ?, [ContactTel] = ?, [ContactPhone] = ?, [InvoiceCom] = ?, [InvoicePrice] = ?, [InMoney] = ?, [InvoiceNotes] = ?, [InvoiceDate] = ? WHERE [InvoiceId] = ?">
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
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="ContactTel" Type="String" />
            <asp:Parameter Name="ContactPhone" Type="String" />
            <asp:Parameter Name="InvoiceCom" Type="String" />
            <asp:Parameter Name="InvoicePrice" Type="String" />
            <asp:Parameter Name="InMoney" Type="String" />
            <asp:Parameter Name="InvoiceNotes" Type="String" />
            <asp:Parameter Name="InvoiceDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UserId" Type="Int32" />
            <asp:Parameter Name="InvoiceName" Type="String" />
            <asp:Parameter Name="InvoiceContent" Type="String" />
            <asp:Parameter Name="WriteDate" Type="String" />
            <asp:Parameter Name="InvoiceMaker" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
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
</asp:Panel>
</asp:Content>

