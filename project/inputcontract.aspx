<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputcontract.aspx.cs" Inherits="project_inputcontract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="940px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司合同管理登记表</center>
        <table style="width: 100%;" cellpadding="0" cellspacing="0" class="alltable">
            <tr>
                <td colspan="2">
                   
                    建设单位</td>
                <td colspan="2">
                  
                    项目名称</td>
                <td colspan="2">
                    出票单位</td>
            </tr>
            <tr>
                <td colspan="2">
                   
                    <asp:TextBox ID="BuilderName" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="280px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="BuilderName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                   
                </td>
                <td colspan="2">
                    
                    <asp:TextBox ID="ProjectName" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="280px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="ProjectName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    
                </td>
                <td colspan="2">
                    <asp:TextBox ID="InvoiceCom" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="280px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="InvoiceCom" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    
                    签订时间</td>
                <td>
                   
                    <asp:TextBox ID="SignDate" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="SignDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                   
                </td>
                <td>
                   
                    验收时间</td>
                <td>
                    <asp:TextBox ID="CheckDate" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="CheckDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
                <td>
                    质保期</td>
                <td>
                    <asp:TextBox ID="LifeOfQuality" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="LifeOfQuality" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    质保起止日期</td>
                <td>
                    <asp:TextBox ID="DateOfQuality" runat="server" Height="40px" 
                        TextMode="MultiLine" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="DateOfQuality" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
                <td>
                    合同金额</td>
                <td>
                    <asp:TextBox ID="ContractPrice" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="ContractPrice" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
                <td>
                    开票金额</td>
                <td>
                    <asp:TextBox ID="InvoicePrice" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="InvoicePrice" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    质保金额</td>
                <td>
                    <asp:TextBox ID="QualityPrice" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="QualityPrice" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newcontract">*</asp:RequiredFieldValidator>
                    </td>
                <td>
                    备注</td>
                <td colspan="3">
                    <asp:TextBox ID="ContractNotes" runat="server" Height="60px" 
                        TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td colspan="5" style="color: #FF0000; text-align: left">
                    备注：所列各项必须如实填写，不得空格，出票单位填写：“风范”或“点击”。</td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="提交登记" 
                        ValidationGroup="newcontract" />
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_ContractManager] WHERE [ContractId] = ?" 
            InsertCommand="INSERT INTO [ob_ContractManager] ([ContractId], [UserId], [BuilderName], [ProjectName], [SignDate], [CheckDate], [LifeOfQuality], [DateOfQuality], [ContractPrice], [InvoicePrice], [InvoiceCom], [QualityPrice], [ContractNotes], [ContractDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_ContractManager]" 
            UpdateCommand="UPDATE [ob_ContractManager] SET [UserId] = ?, [BuilderName] = ?, [ProjectName] = ?, [SignDate] = ?, [CheckDate] = ?, [LifeOfQuality] = ?, [DateOfQuality] = ?, [ContractPrice] = ?, [InvoicePrice] = ?, [InvoiceCom] = ?, [QualityPrice] = ?, [ContractNotes] = ?, [ContractDate] = ? WHERE [ContractId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ContractId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ContractId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="BuilderName" Type="String" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="SignDate" Type="String" />
                <asp:Parameter Name="CheckDate" Type="String" />
                <asp:Parameter Name="LifeOfQuality" Type="String" />
                <asp:Parameter Name="DateOfQuality" Type="String" />
                <asp:Parameter Name="ContractPrice" Type="String" />
                <asp:Parameter Name="InvoicePrice" Type="String" />
                <asp:Parameter Name="InvoiceCom" Type="String" />
                <asp:Parameter Name="QualityPrice" Type="String" />
                <asp:Parameter Name="ContractNotes" Type="String" />
                <asp:Parameter Name="ContractDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="BuilderName" Type="String" />
                <asp:Parameter Name="ProjectName" Type="String" />
                <asp:Parameter Name="SignDate" Type="String" />
                <asp:Parameter Name="CheckDate" Type="String" />
                <asp:Parameter Name="LifeOfQuality" Type="String" />
                <asp:Parameter Name="DateOfQuality" Type="String" />
                <asp:Parameter Name="ContractPrice" Type="String" />
                <asp:Parameter Name="InvoicePrice" Type="String" />
                <asp:Parameter Name="InvoiceCom" Type="String" />
                <asp:Parameter Name="QualityPrice" Type="String" />
                <asp:Parameter Name="ContractNotes" Type="String" />
                <asp:Parameter Name="ContractDate" Type="DateTime" />
                <asp:Parameter Name="ContractId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

