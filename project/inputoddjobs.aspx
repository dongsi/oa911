<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="inputoddjobs.aspx.cs" Inherits="project_inputoddjobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="940px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司零星施工、维修管理登记表</center>
        <table width=100% class="alltable" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    
                    单位名称</td>
                <td>
                    
                    用户联系人</td>
                <td>
                    
                    电话</td>
            </tr>
            <tr>
                <td>
                    
                    <asp:TextBox ID="UnitName" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="290px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="UnitName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    
                </td>
                <td>
                    
                    <asp:TextBox ID="UseContact" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="UseContact" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    
                </td>
                <td>
                    
                    <asp:TextBox ID="UseTel" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="UseTel" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    
                </td>
            </tr>
            <tr>
                <td>
                   
                    零星施工及报修内容</td>
                <td colspan="2">
                   
                    实际使用设备、材料及人工明细</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="JobsContent" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="290px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="JobsContent" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    </td>
                <td colspan="2">
                    <asp:TextBox ID="RealContent" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="490px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RealContent" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    派遣人</td>
                <td>
                    派遣时间</td>
                <td>
                    实施人</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="Sender" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="Sender" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="GoDate" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="GoDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="Worker" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="Worker" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    完成时间</td>
                <td>
                    收费标准</td>
                <td>
                    开票情况</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="EndDate" runat="server" Width="250px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="EndDate" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    </td>
                <td>
                    <asp:TextBox ID="GetMoney" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="GetMoney" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    </td>
                <td>
                    <asp:TextBox ID="InvoiceState" runat="server" Height="60px" 
                        TextMode="MultiLine" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="InvoiceState" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="oddjobs">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td colspan="2" style="color: #FF0000; text-align: left">
                    备注：所列各项必须如实填写，不得空格。</td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="提交" 
                        ValidationGroup="oddjobs" />
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                    </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_OddJobs] WHERE [OddJobsId] = ?" 
            InsertCommand="INSERT INTO [ob_OddJobs] ([OddJobsId], [UnitName], [UseContact], [UseTel], [JobsContent], [GoDate], [RealContent], [EndDate], [GetMoney], [Approver], [InvoiceState], [OddJobsDate], [UserId]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_OddJobs]" 
            UpdateCommand="UPDATE [ob_OddJobs] SET [UnitName] = ?, [UseContact] = ?, [UseTel] = ?, [JobsContent] = ?, [GoDate] = ?, [RealContent] = ?, [EndDate] = ?, [GetMoney] = ?, [Approver] = ?, [InvoiceState] = ?, [OddJobsDate] = ?, [UserId] = ? WHERE [OddJobsId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="OddJobsId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OddJobsId" Type="Int32" />
                <asp:Parameter Name="UnitName" Type="String" />
                <asp:Parameter Name="UseContact" Type="String" />
                <asp:Parameter Name="UseTel" Type="String" />
                <asp:Parameter Name="JobsContent" Type="String" />
                <asp:Parameter Name="GoDate" Type="String" />
                <asp:Parameter Name="RealContent" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="GetMoney" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="InvoiceState" Type="String" />
                <asp:Parameter Name="OddJobsDate" Type="DateTime" />
                <asp:Parameter Name="UserId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UnitName" Type="String" />
                <asp:Parameter Name="UseContact" Type="String" />
                <asp:Parameter Name="UseTel" Type="String" />
                <asp:Parameter Name="JobsContent" Type="String" />
                <asp:Parameter Name="GoDate" Type="String" />
                <asp:Parameter Name="RealContent" Type="String" />
                <asp:Parameter Name="EndDate" Type="String" />
                <asp:Parameter Name="GetMoney" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="InvoiceState" Type="String" />
                <asp:Parameter Name="OddJobsDate" Type="DateTime" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="OddJobsId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

