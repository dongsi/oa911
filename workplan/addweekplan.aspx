<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addweekplan.aspx.cs" Inherits="workplan_addweekplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="960px">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司周工作计划</center>
             <table style="width: 100%;" cellpadding="0" cellspacing="0" class="alltable" align='center'>
  <tr>
    <td  width="100px">计划期间</td>
    <td >
                   
                    <asp:TextBox ID="PlanDuration" runat="server"  Height="28px" width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="PlanDuration" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newweekplan">*</asp:RequiredFieldValidator>
                </td>
    <td  width="100px" >部门负责人</td>
    <td >
                    <asp:TextBox ID="Subitemheader" runat="server"   Height="28px"  width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="Subitemheader" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newweekplan">*</asp:RequiredFieldValidator>
                </td>
  </tr>
  <tr>
    <td colspan="3">工作计划（含上周未完成部分)</td>
    <td >备注</td>
  </tr>
  <tr>
    <td colspan="3">
                    <asp:TextBox ID="PlanContent" runat="server" Height="300px" width="95%"
                        TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="PlanContent" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newweekplan">*</asp:RequiredFieldValidator>
                </td>
    <td >
                    <asp:TextBox ID="Notes" runat="server" Height="300px"  TextMode="MultiLine" width="80%"></asp:TextBox>
               </td>
  </tr>
  <tr>
    <td colspan="4"style="color: #FF0000">
                    备注：“计划期间”为几月几日至几月几日；“本周工作计划（含上周未完成内容）”先填写上周未完成内容，后填写本周工作计划，并按1、2、3………序号排序；“

分项负责人”对应”“工作计划”序号一一对应起来。
                    <asp:Button ID="BSave" runat="server" onclick="BSave_Click1" Text="提交新计划" 
                        ValidationGroup="newweekplan" />
                </td>
  </tr>
</table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_WeekPlan] WHERE [PlanId] = ?" 
            InsertCommand="INSERT INTO [ob_WeekPlan] ([PlanId], [PlanDuration], [PlanContent], [Subitemheader], [DepartmentId], [UserId], [Notes], [Plandate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_WeekPlan]" 
            UpdateCommand="UPDATE [ob_WeekPlan] SET [PlanDuration] = ?, [PlanContent] = ?, [Subitemheader] = ?, [DepartmentId] = ?, [UserId] = ?, [Notes] = ?, [Plandate] = ? WHERE [PlanId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="PlanId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PlanId" Type="Int32" />
                <asp:Parameter Name="PlanDuration" Type="Object" />
                <asp:Parameter Name="PlanContent" Type="Object" />
                <asp:Parameter Name="Subitemheader" Type="Object" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="Notes" Type="Object" />
                <asp:Parameter Name="Plandate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="PlanDuration" Type="Object" />
                <asp:Parameter Name="PlanContent" Type="Object" />
                <asp:Parameter Name="Subitemheader" Type="Object" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="Notes" Type="Object" />
                <asp:Parameter Name="Plandate" Type="DateTime" />
                <asp:Parameter Name="PlanId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

