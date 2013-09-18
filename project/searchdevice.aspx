<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchdevice.aspx.cs" Inherits="project_searchdevice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司设备返修管理登记表</center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="DeviceId" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" PageSize="15" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="25px" />
                </asp:TemplateField>
                <asp:BoundField DataField="DeviceId" HeaderText="DeviceId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="DeviceId" Visible="False" />
                <asp:BoundField DataField="DeviceName" HeaderText="设备名称" 
                    SortExpression="DeviceName" >
                <ItemStyle Width="60px" />
                </asp:BoundField>
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
                <asp:BoundField DataField="DeviceDate" DataFormatString="{0:f}" 
                    HeaderText="登记日期" SortExpression="DeviceDate" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_DeviceRepair] WHERE [DeviceId] = ?" 
            InsertCommand="INSERT INTO [ob_DeviceRepair] ([DeviceId], [DeviceName], [Brand], [UseUnit], [UseContact], [Usetel], [Repairor], [RepairDate], [RepairUnit], [RepairContact], [RepairTel], [RepairPrice], [ContractDate], [RepareedDate], [GetMoney], [Approver], [invoiceState], [DeviceDate], [UserId]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_DeviceRepair] WHERE ([UserId] = ?) ORDER BY [DeviceDate] DESC" 
            UpdateCommand="UPDATE [ob_DeviceRepair] SET [DeviceName] = ?, [Brand] = ?, [UseUnit] = ?, [UseContact] = ?, [Usetel] = ?, [Repairor] = ?, [RepairDate] = ?, [RepairUnit] = ?, [RepairContact] = ?, [RepairTel] = ?, [RepairPrice] = ?, [ContractDate] = ?, [RepareedDate] = ?, [GetMoney] = ?, [Approver] = ?, [invoiceState] = ?, [DeviceDate] = ?, [UserId] = ? WHERE [DeviceId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="DeviceId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DeviceId" Type="Int32" />
                <asp:Parameter Name="DeviceName" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="UseUnit" Type="String" />
                <asp:Parameter Name="UseContact" Type="String" />
                <asp:Parameter Name="Usetel" Type="String" />
                <asp:Parameter Name="Repairor" Type="String" />
                <asp:Parameter Name="RepairDate" Type="String" />
                <asp:Parameter Name="RepairUnit" Type="String" />
                <asp:Parameter Name="RepairContact" Type="String" />
                <asp:Parameter Name="RepairTel" Type="String" />
                <asp:Parameter Name="RepairPrice" Type="String" />
                <asp:Parameter Name="ContractDate" Type="String" />
                <asp:Parameter Name="RepareedDate" Type="String" />
                <asp:Parameter Name="GetMoney" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="invoiceState" Type="String" />
                <asp:Parameter Name="DeviceDate" Type="DateTime" />
                <asp:Parameter Name="UserId" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="DeviceName" Type="String" />
                <asp:Parameter Name="Brand" Type="String" />
                <asp:Parameter Name="UseUnit" Type="String" />
                <asp:Parameter Name="UseContact" Type="String" />
                <asp:Parameter Name="Usetel" Type="String" />
                <asp:Parameter Name="Repairor" Type="String" />
                <asp:Parameter Name="RepairDate" Type="String" />
                <asp:Parameter Name="RepairUnit" Type="String" />
                <asp:Parameter Name="RepairContact" Type="String" />
                <asp:Parameter Name="RepairTel" Type="String" />
                <asp:Parameter Name="RepairPrice" Type="String" />
                <asp:Parameter Name="ContractDate" Type="String" />
                <asp:Parameter Name="RepareedDate" Type="String" />
                <asp:Parameter Name="GetMoney" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="invoiceState" Type="String" />
                <asp:Parameter Name="DeviceDate" Type="DateTime" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="DeviceId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

