<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="managerworklog.aspx.cs" Inherits="worklog_managerworklog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="text-align: center;">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司工作日志审核</center>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="WorkLogId" 
        onrowdeleting="GridView1_RowDeleting" 
        PageSize="10" 
        Width="100%" onrowdatabound="GridView1_RowDataBound" >
        <Columns>
            <asp:CommandField ShowEditButton="True" ItemStyle-HorizontalAlign="NotSet" 
                HeaderText="编辑">
             <ControlStyle Width="25px" />
             <ItemStyle Width="30px" />
            </asp:CommandField>
            <asp:CommandField DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                ShowDeleteButton="True" HeaderText="删除">
            <HeaderStyle Wrap="False" />
            <ItemStyle Width="40px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="序号" SortExpression="WorkLogId">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30px" />
            </asp:TemplateField>
            <asp:BoundField DataField="UserFullName" HeaderText="姓名" 
                SortExpression="UserFullName" ReadOnly="True" >
           
            <ItemStyle Width="20px" />
            </asp:BoundField>
            <asp:BoundField DataField="WorkDate" HeaderText="报告日期"  Visible="False"
                SortExpression="WorkDate" ReadOnly="True" >
            <ItemStyle Width="70px" />
            </asp:BoundField>
            <asp:BoundField DataField="WorkContent" HeaderText="工作描述" ReadOnly="True">
            <ItemStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProjectContent" HeaderText="工程量" ReadOnly="True" 
                Visible="False">
            <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="审阅" SortExpression="Review">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="140px" 
                        Text='<%# Bind("Review") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Review") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="140px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="明日安排" SortExpression="NextPlan">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Height="140px" 
                        Text='<%# Bind("NextPlan") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("NextPlan") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="228px" />
            </asp:TemplateField>
            <asp:CheckBoxField DataField="EndOf" HeaderText="是否完成" SortExpression="EndOf" 
                Visible="False" ReadOnly="True" />
            <asp:BoundField DataField="UseTime" HeaderText="耗用时间" 
                SortExpression="UseTime" Visible="False" ReadOnly="True" >
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProjectManager" HeaderText="负责人" 
                SortExpression="ProjectManager" ReadOnly="True" >
            
            <ItemStyle Width="20px" />
            </asp:BoundField>
            <asp:BoundField DataField="PlanEndDate" HeaderText="计划完成时间" 
                SortExpression="PlanEndDate" Visible="False" ReadOnly="True">
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="LogDate" HeaderText="提交时间" 
                SortExpression="LogDate" ReadOnly="True" >
            <ItemStyle Width="72px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProjectName" HeaderText="工作地点" 
                SortExpression="ProjectName" ReadOnly="True" >
            <ItemStyle Width="80px" />
            </asp:BoundField>
            <asp:BoundField DataField="Associater" HeaderText="配合人" 
                SortExpression="Associater" ReadOnly="True" >
            <ItemStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="DepartmentName" HeaderText="部门" 
                SortExpression="DepartmentName" ReadOnly="True" Visible="False" >
            <ItemStyle Width="80px" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center"  />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
        
            
            SelectCommand="SELECT WorkLogId, DepartmentName, ProjectName, ProjectManager, Associater, WorkDate, WorkContent, ProjectContent, EndOf, UseTime, PlanEndDate, LogDate, UserFullName, Review, NextPlan FROM v_worklog ORDER BY LogDate DESC" 
            UpdateCommand="UPDATE ob_WorkLog SET Review = ?, NextPlan = ? WHERE (WorkLogId = ?)">
    </asp:SqlDataSource>




</asp:Content>

