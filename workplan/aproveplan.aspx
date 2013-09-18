<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="aproveplan.aspx.cs" Inherits="workplan_aproveplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="950px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司周工作计划</center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="PlanId" 
        DataSourceID="SqlDataSource1" Width="100%" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" 
                    DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                    HeaderText="删除" >
                <ItemStyle Width="30px" />
                </asp:CommandField>
                <asp:TemplateField ShowHeader="False" HeaderText="编辑">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="编辑" Visible="<%# isDepartmentHeader() %>" Width="20px"></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序号" SortExpression="PlanId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="计划期间" SortExpression="PlanDuration">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Height="43px" 
                            Text='<%# Bind("PlanDuration") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("PlanDuration") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="工作计划（含上周未完成部分）" SortExpression="PlanContent">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Height="100px" 
                            Text='<%# Bind("PlanContent") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("PlanContent") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="责任人" SortExpression="Subitemheader">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Subitemheader") %>' Width="60px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Subitemheader") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DepartmentName" HeaderText="部门" 
                    SortExpression="DepartmentName" ReadOnly="True" />
                <asp:BoundField DataField="UserFullName" HeaderText="负责人" ReadOnly="True" 
                    SortExpression="UserFullName" />
                <asp:TemplateField HeaderText="备注" SortExpression="Notes">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Height="100px" 
                            Text='<%# Bind("Notes") %>' TextMode="MultiLine" Width="98%"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Plandate" DataFormatString="{0:f}" HeaderText="录入时间" 
                    ReadOnly="True" SortExpression="Plandate" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [v_weekplan]  ORDER BY [Plandate] DESC" 
            
            UpdateCommand="UPDATE v_weekplan SET PlanDuration = ?, PlanContent = ?, Subitemheader = ?,Notes=? WHERE (PlanId = ?)" 
            DeleteCommand="DELETE FROM ob_WeekPlan WHERE (PlanId = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

