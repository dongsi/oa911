<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchoddjobs.aspx.cs" Inherits="project_searchoddjobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="940px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司零星施工、维修管理登记表</center>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="OddJobsId" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="100%">
    <Columns>
        <asp:BoundField DataField="OddJobsId" HeaderText="序号" InsertVisible="False" 
            ReadOnly="True" SortExpression="OddJobsId" />
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
        <asp:BoundField DataField="OddJobsDate" HeaderText="提交时间" 
            SortExpression="OddJobsDate" />
        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
            Visible="False" />
    </Columns>
</asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_OddJobs] WHERE ([UserId] = ?) ORDER BY [OddJobsDate] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

