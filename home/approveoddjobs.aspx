<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="approveoddjobs.aspx.cs" Inherits="home_approveoddjobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
        <h4>审核零星施工、维修管理申请</h4>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="OddJobsId" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" onrowupdating="GridView1_RowUpdating" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField HeaderText="序号" SortExpression="OddJobsId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("OddJobsId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UnitName" HeaderText="单位名称" 
                    SortExpression="UnitName" ReadOnly="True" />
                <asp:BoundField DataField="UseContact" HeaderText="用户联系人" 
                    SortExpression="UseContact" ReadOnly="True" />
                <asp:BoundField DataField="UseTel" HeaderText="电话" 
                    SortExpression="UseTel" ReadOnly="True" />
                <asp:BoundField DataField="JobsContent" HeaderText="零星施工及报修内容" 
                    SortExpression="JobsContent" ReadOnly="True" />
                <asp:BoundField DataField="Sender" HeaderText="派遣人" ReadOnly="True" 
                    SortExpression="Sender" />
                <asp:BoundField DataField="GoDate" HeaderText="派遣时间" 
                    SortExpression="GoDate" ReadOnly="True" />
                <asp:BoundField DataField="Worker" HeaderText="实施人" ReadOnly="True" 
                    SortExpression="Worker" />
                <asp:BoundField DataField="RealContent" HeaderText="实际使用设备、材料及人工明细" 
                    SortExpression="RealContent" ReadOnly="True" />
                <asp:BoundField DataField="EndDate" HeaderText="完成时间" 
                    SortExpression="EndDate" ReadOnly="True" />
                <asp:BoundField DataField="GetMoney" HeaderText="收费标准" 
                    SortExpression="GetMoney" ReadOnly="True" />
                <asp:BoundField DataField="Approver" HeaderText="审批人" 
                    SortExpression="Approver" />
                <asp:BoundField DataField="InvoiceState" HeaderText="开票情况" 
                    SortExpression="InvoiceState" />
                <asp:BoundField DataField="OddJobsDate" HeaderText="提交时间" 
                    SortExpression="OddJobsDate" ReadOnly="True" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" 
                    SortExpression="UserId" Visible="False" />
                <asp:BoundField DataField="UserFullName" HeaderText="提交人" 
                    SortExpression="UserFullName" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [v_oddjobs] WHERE ([Approver] IS NULL) ORDER BY [OddJobsDate] DESC"
            
            UpdateCommand="UPDATE v_oddjobs SET Approver = ?, InvoiceState = ? WHERE (OddJobsId = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

