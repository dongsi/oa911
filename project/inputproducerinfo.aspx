<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputproducerinfo.aspx.cs" Inherits="project_inputproducerinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" 
    Width="935px">
   
   
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司厂商信息登记表</center>
    <table cellpadding="0" cellspacing="0" class="alltable" width="930px">
        <tr>
            <td colspan="3">
                厂商名称</td>
            <td colspan="3">
                设备名称</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:TextBox ID="ProducerName" runat="server" TextMode="MultiLine" 
                    Width="430px" Height="60px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="ProducerName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
            <td colspan="3">
                <asp:TextBox ID="ProductName" runat="server" TextMode="MultiLine" Width="430px" 
                    Height="60px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ProductName" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td colspan="3">
                网址</td>
            <td colspan="3">
                厂址</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:TextBox ID="HomePage" runat="server" TextMode="MultiLine" Width="430px" 
                    Height="60px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="HomePage" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
            <td colspan="3">
                <asp:TextBox ID="ProducerAddress" runat="server" 
                    Width="430px" Height="60px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ProducerAddress" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 81px">
                商务联系人</td>
            <td>
                <asp:TextBox ID="ProducerContact" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="ProducerContact" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
            <td>
                商务固话</td>
            <td>
                <asp:TextBox ID="ContactTel" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="ContactTel" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
            <td>
                商务手机</td>
            <td>
                <asp:TextBox ID="ContactPhone" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ContactPhone" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 81px">
                技术联系人</td>
            <td>
                <asp:TextBox ID="TechContact" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="TechContact" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
            <td>
                技术固话</td>
            <td>
                <asp:TextBox ID="TechTel" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="TechTel" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
            <td>
                技术手机</td>
            <td>
                <asp:TextBox ID="TechPhone" runat="server" Width="180px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="TechPhone" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="newproducer">*</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td style="width: 81px">
                备注</td>
            <td colspan="4">
                <asp:TextBox ID="producerNotes" runat="server" Width="550px" Height="60px" 
                    TextMode="MultiLine"></asp:TextBox>
                </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="提交登记" onclick="Button1_Click" 
                    ValidationGroup="newproducer" />
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
        </tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_MetaProducerinfo] WHERE [MetaProducerId] = ?" 
            InsertCommand="INSERT INTO [ob_MetaProducerinfo] ([MetaProducerId], [UserId], [ProducerName], [ProductName], [HomePage], [ProducerAddress], [ProducerContact], [ContactTel], [ContactPhone], [TechContact], [TechTel], [TechPhone], [producerNotes], [MetaProducerDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_MetaProducerinfo]" 
            UpdateCommand="UPDATE [ob_MetaProducerinfo] SET [UserId] = ?, [ProducerName] = ?, [ProductName] = ?, [HomePage] = ?, [ProducerAddress] = ?, [ProducerContact] = ?, [ContactTel] = ?, [ContactPhone] = ?, [TechContact] = ?, [TechTel] = ?, [TechPhone] = ?, [producerNotes] = ?, [MetaProducerDate] = ? WHERE [MetaProducerId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="MetaProducerId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MetaProducerId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="ProducerName" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="HomePage" Type="String" />
                <asp:Parameter Name="ProducerAddress" Type="String" />
                <asp:Parameter Name="ProducerContact" Type="String" />
                <asp:Parameter Name="ContactTel" Type="String" />
                <asp:Parameter Name="ContactPhone" Type="String" />
                <asp:Parameter Name="TechContact" Type="String" />
                <asp:Parameter Name="TechTel" Type="String" />
                <asp:Parameter Name="TechPhone" Type="String" />
                <asp:Parameter Name="producerNotes" Type="String" />
                <asp:Parameter Name="MetaProducerDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="ProducerName" Type="String" />
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="HomePage" Type="String" />
                <asp:Parameter Name="ProducerAddress" Type="String" />
                <asp:Parameter Name="ProducerContact" Type="String" />
                <asp:Parameter Name="ContactTel" Type="String" />
                <asp:Parameter Name="ContactPhone" Type="String" />
                <asp:Parameter Name="TechContact" Type="String" />
                <asp:Parameter Name="TechTel" Type="String" />
                <asp:Parameter Name="TechPhone" Type="String" />
                <asp:Parameter Name="producerNotes" Type="String" />
                <asp:Parameter Name="MetaProducerDate" Type="DateTime" />
                <asp:Parameter Name="MetaProducerId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
   </asp:Panel>
</asp:Content>

