<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Editmeeting.aspx.cs" Inherits="meeting_Editmeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Width="960px" HorizontalAlign="Center" ScrollBars="Auto">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司会议安排计划</center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" 
            DataKeyNames="meetingId" Width="960px" EnableModelValidation="True">
            <Columns>
                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;"  Visible="<%# isDepartmentHeader() %>"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编辑" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="编辑" Visible="<%# isDepartmentHeader() %>"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="会议时间及地点" SortExpression="meetingTime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Height="100px" 
                            Text='<%# Bind("meetingTime") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("meetingTime") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="会议内容" SortExpression="meetingContent">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="200px" 
                            Text='<%# Bind("meetingContent") %>' TextMode="MultiLine" Width="600px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("meetingContent") %>' 
                            Width="600px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="600px" />
                </asp:TemplateField>
                <asp:BoundField DataField="DepartmentName" HeaderText="部门" 
                    SortExpression="DepartmentName" ReadOnly="True" />
                <asp:BoundField DataField="UserFullName" HeaderText="责任人" ReadOnly="True" 
                    SortExpression="UserFullName" />
                <asp:BoundField DataField="meetingDate" DataFormatString="{0:f}" 
                    HeaderText="录入时间" ReadOnly="True" SortExpression="meetingDate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM ob_Meeting WHERE (meetingId = ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT meetingTime, meetingContent, DepartmentName, UserFullName, meetingDate, meetingId FROM v_meeting ORDER BY meetingDate DESC" 
            
            
            UpdateCommand="UPDATE ob_Meeting SET meetingTime = ?, meetingContent = ? WHERE (meetingId = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
