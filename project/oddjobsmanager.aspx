<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="oddjobsmanager.aspx.cs" Inherits="project_oddjobsmanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="Server" HorizontalAlign="Center" Width="940px" 
    ScrollBars="Both">
<center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司零星施工、维修管理登记表</center>
<asp:GridView ID="GridView1" runat="Server" AutoGenerateColumns="False" 
       DataKeyNames="OddJobsId" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" ForeColor="Black" GridLines="Vertical" 
        AllowPaging="True" onrowdatabound="GridView1_RowDataBound" 
        >

    <Columns>
        <asp:TemplateField HeaderText="序号" SortExpression="OddJobsId">
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="20px" />
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True">
            <ControlStyle Width="60px" />
        <ItemStyle Width="30px" />
        </asp:CommandField>
        <asp:BoundField DataField="UnitName" HeaderText="单位名称" 
            SortExpression="UnitName" />
        <asp:BoundField DataField="UseContact" HeaderText="用户联系人" 
            SortExpression="UseContact" />
        <asp:BoundField DataField="UseTel" HeaderText="电话" SortExpression="UseTel" />
        <asp:BoundField DataField="JobsContent" HeaderText="零星施工及报修内容" 
            SortExpression="JobsContent" />
        <asp:BoundField DataField="Sender" HeaderText="派遣人" SortExpression="Sender" />
        <asp:BoundField DataField="GoDate" HeaderText="派遣时间" SortExpression="GoDate" />
        <asp:BoundField DataField="Worker" HeaderText="实施人" SortExpression="Worker" />
        <asp:BoundField DataField="RealContent" HeaderText="实际使用设备、材料及人工明细" 
            SortExpression="RealContent" />
        <asp:BoundField DataField="EndDate" HeaderText="完成时间" 
            SortExpression="EndDate" />
        <asp:BoundField DataField="GetMoney" HeaderText="收费标准" 
            SortExpression="GetMoney" />
        <asp:BoundField DataField="Approver" HeaderText="审批人" 
            SortExpression="Approver" />
        <asp:BoundField DataField="InvoiceState" HeaderText="开票情况" 
            SortExpression="InvoiceState" />
        <asp:BoundField DataField="OddJobsDate" HeaderText="登记时间" ReadOnly="True" 
            SortExpression="OddJobsDate" />
        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
            Visible="False" />
        <asp:BoundField DataField="UserFullName" HeaderText="登记人" 
            SortExpression="UserFullName" ReadOnly="True" />
    </Columns>
   

</asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [v_oddjobs] ORDER BY [OddJobsDate] DESC" 
        
            UpdateCommand="UPDATE v_oddjobs SET UnitName = ?, UseContact = ?, UseTel = ?, JobsContent = ?, Sender = ?, GoDate = ?, Worker = ?, RealContent = ?, EndDate = ?, GetMoney = ?, Approver = ?, InvoiceState = ? WHERE (OddJobsId = ?)">
    </asp:SqlDataSource>
</asp:Panel>
</asp:Content>

