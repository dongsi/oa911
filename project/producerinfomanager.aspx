<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="producerinfomanager.aspx.cs" Inherits="project_producerinfomanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="Server" Width="100%" HorizontalAlign="Center" 
        ScrollBars="Horizontal">
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司厂商信息登记表</center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="100%" 
        AllowPaging="True" onrowdatabound="GridView1_RowDataBound" 
        DataKeyNames="MetaProducerId" PageSize="5">
    <Columns>
        <asp:CommandField ShowEditButton="True">
        <ItemStyle Width="40px" />
        </asp:CommandField>
        <asp:TemplateField HeaderText="序号" SortExpression="MetaProducerId">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="40px" />
        </asp:TemplateField>
        <asp:BoundField DataField="UserId" HeaderText="UserId" 
            SortExpression="UserId" ReadOnly="True" Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="登记人" 
            SortExpression="UserFullName" ReadOnly="True" />
        <asp:BoundField DataField="ProducerName" HeaderText="厂商名称" 
            SortExpression="ProducerName" />
        <asp:BoundField DataField="ProductName" HeaderText="设备名称" 
            SortExpression="ProductName" />
        <asp:BoundField DataField="HomePage" HeaderText="网址" 
            SortExpression="HomePage" />
        <asp:BoundField DataField="ProducerAddress" HeaderText="厂商地址" 
            SortExpression="ProducerAddress" />
        <asp:BoundField DataField="ProducerContact" HeaderText="商务联系人" 
            SortExpression="ProducerContact" />
        <asp:BoundField DataField="ContactTel" HeaderText="商务固话" 
            SortExpression="ContactTel" />
        <asp:BoundField DataField="ContactPhone" HeaderText="商务手机" 
            SortExpression="ContactPhone" />
        <asp:BoundField DataField="TechContact" HeaderText="技术联系人" 
            SortExpression="TechContact" />
        <asp:BoundField DataField="TechTel" HeaderText="技术固话" 
            SortExpression="TechTel" />
        <asp:BoundField DataField="TechPhone" HeaderText="技术手机" 
            SortExpression="TechPhone" />
        <asp:BoundField DataField="producerNotes" HeaderText="备注" 
            SortExpression="producerNotes" />
        <asp:BoundField DataField="MetaProducerDate" HeaderText="登记时间" 
            SortExpression="MetaProducerDate" DataFormatString="{0:f}" 
            ReadOnly="True" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
    
        SelectCommand="SELECT * FROM [v_metaproducerinfo] ORDER BY [MetaProducerDate] DESC" 
        UpdateCommand="UPDATE v_metaproducerinfo SET ProducerName = ?, ProductName = ?, HomePage = ?, 
        ProducerAddress = ?, ProducerContact = ?, ContactTel = ?, ContactPhone = ?, TechContact = ?, 
        TechTel = ?, TechPhone = ?, producerNotes = ? WHERE (MetaProducerId = ?)">
</asp:SqlDataSource>
</asp:Panel>
</asp:Content>

