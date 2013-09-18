<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchproducerinfo.aspx.cs" Inherits="project_searchproducerinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="960px" HorizontalAlign="Center" 
        ScrollBars="Auto">
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司厂商信息表</center>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="960px" AllowPaging="True"  onrowdatabound="GridView1_RowDataBound" 
        PageSize="6">
    <Columns>
        <asp:BoundField DataField="MetaProducerId" HeaderText="序号" 
            SortExpression="MetaProducerId" >
        <ItemStyle Width="40px" />
        </asp:BoundField>
        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
            Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="UserFullName" 
            SortExpression="UserFullName" Visible="False" />
        <asp:BoundField DataField="ProducerName" HeaderText="厂商名称" 
            SortExpression="ProducerName" >
        <ItemStyle Width="100px" />
        </asp:BoundField>
        <asp:BoundField DataField="ProductName" HeaderText="设备名称" 
            SortExpression="ProductName" >
        <ItemStyle Width="100px" />
        </asp:BoundField>
        <asp:BoundField DataField="HomePage" HeaderText="主页" 
            SortExpression="HomePage" >
        <ItemStyle Width="50px" />
        </asp:BoundField>
        <asp:BoundField DataField="ProducerAddress" HeaderText="厂商地址" 
            SortExpression="ProducerAddress" >
        <ItemStyle Width="100px" />
        </asp:BoundField>
        <asp:BoundField DataField="ProducerContact" HeaderText="商务联系人" 
            SortExpression="ProducerContact" >
        <ItemStyle Width="65px" />
        </asp:BoundField>
        <asp:BoundField DataField="ContactTel" HeaderText="商务固话" 
            SortExpression="ContactTel" >
        <ItemStyle Width="55px" />
        </asp:BoundField>
        <asp:BoundField DataField="ContactPhone" HeaderText="商务手机" 
            SortExpression="ContactPhone" >
        <ItemStyle Width="55px" />
        </asp:BoundField>
        <asp:BoundField DataField="TechContact" HeaderText="技术联系人" 
            SortExpression="TechContact" >
        <ItemStyle Width="65px" />
        </asp:BoundField>
        <asp:BoundField DataField="TechTel" HeaderText="技术固话" 
            SortExpression="TechTel" >
        <ItemStyle Width="55px" />
        </asp:BoundField>
        <asp:BoundField DataField="TechPhone" HeaderText="技术手机" 
            SortExpression="TechPhone" >
        <ItemStyle Width="55px" />
        </asp:BoundField>
        <asp:BoundField DataField="producerNotes" HeaderText="备注" 
            SortExpression="producerNotes" />
        <asp:BoundField DataField="MetaProducerDate" HeaderText="登记时间" 
            SortExpression="MetaProducerDate" />
    </Columns>
    <PagerStyle HorizontalAlign="Left" />
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
        SelectCommand="SELECT MetaProducerId, UserId, UserFullName, ProducerName, ProductName, HomePage, ProducerAddress, ProducerContact, ContactTel, ContactPhone, TechContact, TechTel, TechPhone, producerNotes, MetaProducerDate FROM v_metaproducerinfo ORDER BY MetaProducerDate ASC">
    </asp:SqlDataSource>
</asp:Panel>
</asp:Content>

