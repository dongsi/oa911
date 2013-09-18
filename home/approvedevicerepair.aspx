<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="approvedevicerepair.aspx.cs" Inherits="home_approvedevicerepair" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="100%">
    <h4>审核设备维修申请</h4>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            DataKeyNames="DeviceId" onrowdatabound="GridView1_RowDataBound" onrowupdating="GridView1_RowUpdating" 
            >
            <Columns>
                <asp:CommandField ShowEditButton="True">
                <ItemStyle Width="50px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="序号" SortExpression="DeviceId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:BoundField DataField="DeviceName" HeaderText="设备名称" 
                    SortExpression="DeviceName" ReadOnly="True" />
                <asp:BoundField DataField="Brand" HeaderText="品牌" SortExpression="Brand" 
                    ReadOnly="True" />
                <asp:BoundField DataField="UseUnit" HeaderText="使用单位" 
                    SortExpression="UseUnit" ReadOnly="True" />
                <asp:BoundField DataField="UseContact" HeaderText="用户联系人" 
                    SortExpression="UseContact" ReadOnly="True" />
                <asp:BoundField DataField="Usetel" HeaderText="电话" 
                    SortExpression="Usetel" ReadOnly="True" />
                <asp:BoundField DataField="Repairor" HeaderText="送修人" 
                    SortExpression="Repairor" ReadOnly="True" />
                <asp:BoundField DataField="RepairDate" HeaderText="送修时间" 
                    SortExpression="RepairDate" ReadOnly="True" />
                <asp:BoundField DataField="RepairUnit" HeaderText="维修单位" 
                    SortExpression="RepairUnit" ReadOnly="True" />
                <asp:BoundField DataField="RepairContact" HeaderText="维修联系人" 
                    SortExpression="RepairContact" ReadOnly="True" />
                <asp:BoundField DataField="RepairTel" HeaderText="电话" 
                    SortExpression="RepairTel" ReadOnly="True" />
                <asp:BoundField DataField="RepairPrice" HeaderText="维修单位收费情况" 
                    SortExpression="RepairPrice" ReadOnly="True" />
                <asp:BoundField DataField="ContractDate" HeaderText="合同到期时间" 
                    SortExpression="ContractDate" ReadOnly="True" />
                <asp:BoundField DataField="RepareedDate" HeaderText="修后安装时间" 
                    SortExpression="RepareedDate" ReadOnly="True" />
                <asp:BoundField DataField="GetMoney" HeaderText="收费标准" 
                    SortExpression="GetMoney" ReadOnly="True" />
                <asp:BoundField DataField="Approver" HeaderText="审批人" 
                    SortExpression="Approver" />
                <asp:BoundField DataField="invoiceState" HeaderText="开票情况" 
                    SortExpression="invoiceState" ReadOnly="True" />
                <asp:BoundField DataField="DeviceDate" HeaderText="登记时间" 
                    SortExpression="DeviceDate" DataFormatString="{0:f}" ReadOnly="True" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" 
                    SortExpression="UserId" Visible="False" />
                <asp:BoundField DataField="UserFullName" HeaderText="登记人" 
                    SortExpression="UserFullName" ReadOnly="True" />
                <asp:BoundField DataField="DeviceId" HeaderText="DeviceId" ReadOnly="True" 
                    SortExpression="DeviceId" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [v_devicerepair] WHERE ([Approver] IS NULL) ORDER BY [DeviceDate] DESC" 
            UpdateCommand="UPDATE v_devicerepair SET Approver = ?, DeviceId = WHERE (DeviceId = ?)">
            <UpdateParameters>
                <asp:Parameter Name="?" />
                <asp:Parameter Name="?" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

