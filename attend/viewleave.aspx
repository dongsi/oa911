<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewleave.aspx.cs" Inherits="attend_viewleave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel1" runat="server" Width="940px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">员工请假情况</center>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
        Width="940px" onrowdatabound="GridView2_RowDataBound" PageSize="16">
    <Columns>
        <asp:TemplateField HeaderText="序号" SortExpression="LeaveId">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
            Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="请假人" 
            SortExpression="UserFullName" />
        <asp:BoundField DataField="LeaveContent" HeaderText="请假事由" 
            SortExpression="LeaveContent" />
        <asp:BoundField DataField="LeaveDays" HeaderText="请假天数" 
            SortExpression="LeaveDays" />
        <asp:BoundField DataField="LeaveDuration" HeaderText="请假期间" 
            SortExpression="LeaveDuration" />
        <asp:BoundField DataField="TransferPeople" HeaderText="交接人" 
            SortExpression="TransferPeople" />
        <asp:BoundField DataField="TransferContent" HeaderText="交接内容" />
        <asp:BoundField DataField="DepartmentIdea" HeaderText="部门意见" 
            SortExpression="DepartmentIdea" />
        <asp:BoundField DataField="ApproveUserName" HeaderText="部门批准人" 
            SortExpression="ApproveUserName" />
        <asp:BoundField DataField="ApprovePeople" HeaderText="批准人" 
            SortExpression="ApprovePeople" />
        <asp:BoundField DataField="LeaveDate" HeaderText="申请时间" 
            SortExpression="LeaveDate" />
        <asp:BoundField DataField="ApproveUserId" HeaderText="ApproveUserId" 
            SortExpression="ApproveUserId" Visible="False" />
        <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" 
            SortExpression="DepartmentId" Visible="False" />
        <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" 
            SortExpression="DepartmentName" Visible="False" />
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
                SelectCommand="SELECT * FROM [vv_userleave] WHERE ([ApprovePeople] IS NOT NULL) ORDER BY [LeaveDate] DESC">
    </asp:SqlDataSource>
    </asp:Panel>

</asp:Content>

