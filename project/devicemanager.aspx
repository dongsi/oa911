<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="devicemanager.aspx.cs" Inherits="project_devicemanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="Server" HorizontalAlign="Center" ScrollBars="Both">
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司设备返修管理登记表</center>
<asp:GridView ID="GridView1" runat="Server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="DeviceId" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        onrowdatabound="GridView1_RowDataBound" >
    <Columns>
        <asp:TemplateField HeaderText="序号" SortExpression="DeviceId">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="30px" />
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True">
        <ItemStyle Width="50px" />
        </asp:CommandField>
        <asp:BoundField DataField="DeviceName" HeaderText="设备名称" 
            SortExpression="DeviceName" />
        <asp:BoundField DataField="Brand" HeaderText="品牌" SortExpression="Brand" />
        <asp:BoundField DataField="UseUnit" HeaderText="使用单位" 
            SortExpression="UseUnit" />
        <asp:BoundField DataField="UseContact" HeaderText="用户联系人" 
            SortExpression="UseContact" />
        <asp:BoundField DataField="Usetel" HeaderText="电话" SortExpression="Usetel" />
        <asp:BoundField DataField="Repairor" HeaderText="送修人" 
            SortExpression="Repairor" />
        <asp:BoundField DataField="RepairDate" HeaderText="送修时间" 
            SortExpression="RepairDate" />
        <asp:BoundField DataField="RepairUnit" HeaderText="维修单位" 
            SortExpression="RepairUnit" />
        <asp:BoundField DataField="RepairContact" HeaderText="维修联系人" 
            SortExpression="RepairContact" />
        <asp:BoundField DataField="RepairTel" HeaderText="电话" 
            SortExpression="RepairTel" />
        <asp:BoundField DataField="RepairPrice" HeaderText="维修单位收费情况" 
            SortExpression="RepairPrice" />
        <asp:BoundField DataField="ContractDate" HeaderText="合同到期时间" 
            SortExpression="ContractDate" />
        <asp:BoundField DataField="RepareedDate" HeaderText="修后安装时间" 
            SortExpression="RepareedDate" />
        <asp:BoundField DataField="GetMoney" HeaderText="收费标准" 
            SortExpression="GetMoney" />
        <asp:BoundField DataField="Approver" HeaderText="审批人" 
            SortExpression="Approver" />
        <asp:BoundField DataField="invoiceState" HeaderText="开票情况" 
            SortExpression="invoiceState" />
        <asp:BoundField DataField="DeviceDate" HeaderText="登记时间" ReadOnly="True" 
            SortExpression="DeviceDate" />
        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
            Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="登记人" ReadOnly="True" 
            SortExpression="UserFullName" />
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [v_devicerepair] ORDER BY [DeviceDate] DESC" 
        UpdateCommand="UPDATE v_devicerepair SET DeviceName = ?, Brand = ?, UseUnit = ?, UseContact = ?, Usetel = ?, Repairor = ?, RepairDate = ?, RepairUnit = ?, RepairContact = ?, RepairTel = ?, RepairPrice = ?, ContractDate = ?, RepareedDate = ?, GetMoney = ?, Approver = ?, invoiceState = ? WHERE (DeviceId = ?)">
    </asp:SqlDataSource>
</asp:Panel>
</asp:Content>

