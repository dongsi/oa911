<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="worklog.aspx.cs" Inherits="worklog_worklog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="text-align: center; width:100%">
<center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司工作日志工作安排</center>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
        
        
         UpdateCommand="UPDATE ob_WorkLog SET NextPlan = ? WHERE (WorkLogId = ?)" 
        SelectCommand="SELECT ob_WorkLog.WorkLogId, ob_WorkLog.UserId, ob_WorkLog.DepartmentId, ob_WorkLog.ProjectName, ob_WorkLog.ProjectManager, ob_WorkLog.Associater, ob_WorkLog.WorkDate, ob_WorkLog.WorkContent, ob_WorkLog.ProjectContent, ob_WorkLog.EndOf, ob_WorkLog.UseTime, ob_WorkLog.PlanEndDate, ob_WorkLog.LogDate, ob_WorkLog.Review, ob_WorkLog.NextPlan, ob_userinfo.UserFullName FROM ob_WorkLog INNER JOIN ob_userinfo ON ob_WorkLog.UserId = ob_userinfo.UserId  ORDER BY ob_WorkLog.LogDate DESC ">
    </asp:SqlDataSource>
    <div style="overflow: auto; text-align: center;">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="WorkLogId" 
         Width="100%" 
         
            PagerSettings-PageButtonCount="10" PageSize="10"  
            >
        <Columns>
            <asp:CommandField ShowEditButton="True" HeaderText="编辑">
            <ControlStyle Width="25px" />
            <ItemStyle Width="30px" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                SortExpression="WorkLogId">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("WorkLogId") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("WorkLogId") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle Wrap="True" />
                <ItemStyle Width="20px" />
            </asp:TemplateField>
            <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" 
                SortExpression="DepartmentId" Visible="False" ReadOnly="True" />
            
            <asp:BoundField DataField="UserFullName" HeaderText="填写人" 
                SortExpression="UserFullName" ReadOnly="True" >
            <ItemStyle Width="20px" />
            </asp:BoundField>
            
            <asp:BoundField DataField="WorkDate" HeaderText="报告日期" Visible="False"
                SortExpression="WorkDate" ReadOnly="True">
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="35px" />
            </asp:BoundField>
            <asp:BoundField DataField="WorkContent" HeaderText="工作描述" 
                SortExpression="WorkContent" ReadOnly="True">
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="300px" />
            </asp:BoundField>
            <asp:BoundField DataField="ProjectContent" HeaderText="工程量" 
                SortExpression="ProjectContent" ReadOnly="True" Visible="False" >
            <ItemStyle Width="150px" />
            </asp:BoundField>
            <asp:BoundField DataField="Review" HeaderText="审阅" ReadOnly="True" 
                SortExpression="Review" >
                
            <ItemStyle Width="140px" Wrap="True" />
            
            </asp:BoundField>
            <asp:TemplateField HeaderText="明日安排" SortExpression="NextPlan">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="100px" 
                        style="margin-bottom: 0px" Text='<%# Bind("NextPlan") %>' 
                        TextMode="MultiLine" Width="220px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("NextPlan") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="150px" />
            </asp:TemplateField>
            <asp:BoundField DataField="ProjectManager" HeaderText="负责人" 
                SortExpression="ProjectManager" ReadOnly="True">
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="20px" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="EndOf" HeaderText="是否完成" SortExpression="EndOf" 
                ReadOnly="True" Visible="False">
            <HeaderStyle Wrap="True" />
            </asp:CheckBoxField>
            <asp:BoundField DataField="UseTime" HeaderText="耗用时间" SortExpression="UseTime" 
                ReadOnly="True" Visible="False">
            
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="PlanEndDate" HeaderText="计划完成时间" 
                SortExpression="PlanEndDate" ReadOnly="True" Visible="False">
            
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="LogDate" HeaderText="提交时间" 
                SortExpression="LogDate" ReadOnly="True"  >
 
 
 
            <ItemStyle Width="50px" />
            </asp:BoundField>
 
 
 
            <asp:BoundField DataField="ProjectName" HeaderText="工作地点" 
                SortExpression="ProjectName" ReadOnly="True">
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="Associater" HeaderText="配合人" 
                SortExpression="Associater" ReadOnly="True">
            <HeaderStyle Wrap="True" />
            <ItemStyle Width="50px" />
            </asp:BoundField>
 
 
 
        </Columns>
        <HeaderStyle Wrap="False" />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
        SelectCommand="SELECT ob_WorkLog.WorkLogId, ob_WorkLog.UserId, ob_WorkLog.DepartmentId, ob_WorkLog.ProjectName, ob_WorkLog.ProjectManager, ob_WorkLog.Associater, ob_WorkLog.WorkDate, ob_WorkLog.WorkContent, ob_WorkLog.ProjectContent, ob_WorkLog.NextPlan, ob_WorkLog.EndOf, ob_WorkLog.UseTime, ob_WorkLog.PlanEndDate, ob_WorkLog.LogDate, ob_WorkLog.Review, ob_userinfo.UserFullName FROM ob_WorkLog INNER JOIN ob_userinfo ON ob_WorkLog.UserId = ob_userinfo.UserId WHERE (ob_WorkLog.DepartmentId = ?) ORDER BY ob_WorkLog.LogDate DESC " 
        UpdateCommand="UPDATE ob_WorkLog SET NextPlan = ? WHERE (WorkLogId = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="departid" SessionField="DepartmentId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        UpdateCommand="UPDATE ob_WorkLog SET NextPlan = ? WHERE (WorkLogId = ?)" 
        SelectCommand="SELECT ob_WorkLog.UserId, ob_WorkLog.DepartmentId, ob_WorkLog.WorkLogId, ob_WorkLog.ProjectName, ob_WorkLog.ProjectManager, ob_WorkLog.Associater, ob_WorkLog.WorkDate, ob_WorkLog.WorkContent, ob_WorkLog.ProjectContent, ob_WorkLog.NextPlan, ob_WorkLog.EndOf, ob_WorkLog.UseTime, ob_WorkLog.PlanEndDate, ob_WorkLog.LogDate, ob_WorkLog.Review, ob_userinfo.UserFullName FROM ob_WorkLog INNER JOIN ob_userinfo ON ob_WorkLog.UserId = ob_userinfo.UserId WHERE (ob_WorkLog.UserId = ?) ORDER BY ob_WorkLog.LogDate DESC ">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>

