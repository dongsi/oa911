<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managerattendance.aspx.cs" Inherits="attend_managerattendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div align="center">
   <center style="font-size:1.0em;font-weight:bold;">员工当月考勤情况</center>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" EnableModelValidation="True" AllowPaging="True" 
        Width="940px" PageSize="25" onrowdatabound="GridView1_RowDataBound">
    <Columns>
        <asp:TemplateField HeaderText="序号" SortExpression="AttendanceId">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AttendanceId") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="UserFullName" HeaderText="姓名" 
            SortExpression="UserFullName" />
        <asp:BoundField DataField="BeginDate" HeaderText="上班时间" 
            SortExpression="BeginDate" DataFormatString="{0:f}" />
        <asp:TemplateField HeaderText="考勤状态" SortExpression="begintime">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("begintime") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" 
                    Text='<%# Eval("begintime") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="BeginIp" HeaderText="上班IP" 
            SortExpression="BeginIp" />
        <asp:BoundField DataField="BeginName" HeaderText="考勤地址" 
            SortExpression="BeginName" />
        <asp:BoundField DataField="EndDate" HeaderText="下班时间" 
            SortExpression="EndDate" DataFormatString="{0:f}" />
        <asp:TemplateField HeaderText="考勤状态" SortExpression="endtime">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("endtime") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("endtime") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="EndIp" HeaderText="下班IP" 
            SortExpression="EndIp" />
        <asp:BoundField DataField="EndName" HeaderText="考勤地址" 
            SortExpression="EndName" />
        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
            Visible="False" />
    </Columns>
</asp:GridView>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
    
        SelectCommand="SELECT * FROM [tempallattendance] ORDER BY [UserFullName], [AttendanceId] DESC">
</asp:SqlDataSource>

</asp:Content>

