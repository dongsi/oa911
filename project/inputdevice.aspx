<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputdevice.aspx.cs" Inherits="project_inputdevice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
   <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司设备返修管理登记表</center>
        <table style="width: 100%;" cellpadding="0" cellspacing="0" class="alltable">
            <tr>
                <td>
                    设备名称</td>
                <td>
                    品牌</td>
                <td>
                    使用单位</td>
                <td>
                    用户联系人</td>
                <td>
                    电话</td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    &nbsp;
                    <asp:TextBox ID="DeviceName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DeviceName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Brand" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Brand" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="UseUnit" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="UseUnit" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="UseContact" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="UseContact" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Usetel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="Usetel" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                   送修人</td>
                <td>
                    送修时间</td>
                <td>
                    维修单位</td>
                <td>
                    维修联系人</td>
                <td>
                    电话</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Repairor" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="Repairor" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="RepairDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="RepairDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="RepairUnit" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="RepairUnit" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="RepairContact" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="RepairContact" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="RepairTel" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="RepairUnit" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    维修单位收费情况</td>
                <td>
                    合同到期时间</td>
                <td>
                    修后安装时间</td>
                <td>
                    收费标准</td>
                <td>
                    开票情况</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="RepairPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="RepairPrice" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="ContractDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="ContractDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="RepareedDate" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="RepareedDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="GetMoney" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="GetMoney" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="InvoiceState" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="InvoiceState" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newdevice">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="color: #FF0000; text-align: left">
                    备注：所列各项必须如实填写，不得空格；送修人必须负责提货及修复后安装。</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="提交" ValidationGroup="newdevice" 
                        onclick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_DeviceRepair] WHERE [DeviceId] = ?" 
            InsertCommand="INSERT INTO [ob_DeviceRepair] ([DeviceId], [DeviceName], [Brand], [UseUnit], [UseContact], [Usetel], [Repairor], [RepairDate], [RepairUnit], [RepairContact], [RepairTel], [RepairPrice], [ContractDate], [RepareedDate], [GetMoney], [Approver], [invoiceState], [DeviceDate], [UserId]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_DeviceRepair]" 
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

