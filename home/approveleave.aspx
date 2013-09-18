<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="approveleave.aspx.cs" Inherits="home_approveleave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司请假申请审核</center>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
        AllowPaging="True" onrowupdating="GridView1_RowUpdating"  
        DataKeyNames="LeaveId" Width="940px" 
        onrowdatabound="GridView1_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="序号" SortExpression="LeaveId">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server"><%# Eval("LeaveId") %></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="UserId" HeaderText="UserId" 
            SortExpression="UserId" Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="请假人" 
            SortExpression="UserFullName" ReadOnly="True" />
        <asp:BoundField DataField="LeaveContent" HeaderText="请假事由" 
            SortExpression="LeaveContent" ReadOnly="True" />
        <asp:BoundField DataField="LeaveDays" HeaderText="请假天数" 
            SortExpression="LeaveDays" ReadOnly="True" />
        <asp:BoundField DataField="LeaveDuration" HeaderText="请假期间" 
            SortExpression="LeaveDuration" ReadOnly="True" />
        <asp:BoundField DataField="TransferPeople" HeaderText="交接人" 
            SortExpression="TransferPeople" ReadOnly="True" />
        <asp:BoundField  DataField="TransferContent" HeaderText="交接内容" 
            ReadOnly="True" />
        <asp:BoundField DataField="DepartmentIdea" HeaderText="部门意见" 
            SortExpression="DepartmentIdea" ReadOnly="True" />
        <asp:BoundField DataField="ApproveUserName" HeaderText="部门批准人" ReadOnly="True" 
            SortExpression="ApproveUserName" />
        <asp:BoundField DataField="ApprovePeople" HeaderText="批准人" 
            SortExpression="ApprovePeople" />
        <asp:BoundField DataField="LeaveDate" HeaderText="申请时间" 
            SortExpression="LeaveDate" ReadOnly="True" DataFormatString="{0:f}" />
        <asp:CommandField ShowEditButton="True" UpdateText="提交" HeaderText="编辑" />
        <asp:BoundField DataField="ApproveUserId" HeaderText="ApproveUserId" 
            SortExpression="ApproveUserId" Visible="False" />
        <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" 
            SortExpression="DepartmentId" Visible="False" />
        <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" 
            SortExpression="DepartmentName" Visible="False" />
    </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [vv_userleave] WHERE [ApprovePeople] IS NULL ORDER BY [LeaveDate] DESC"
        
        UpdateCommand="UPDATE v_userleave SET ApprovePeople = ? WHERE (LeaveId = ?)">
    </asp:SqlDataSource>
    
    </asp:Panel>
</asp:Content>

