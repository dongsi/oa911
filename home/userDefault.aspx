<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userDefault.aspx.cs" Inherits="home_userDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>欢迎使用OA办公系统，你今天考勤了吗？ </p>
    
    <asp:Panel ID="Panel4" runat="server">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司售后服务400电话值班安排</center>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="WatchId" DataSourceID="SqlDataSource4" 
            EnableModelValidation="True" Width="100%">
            <Columns>
                <asp:BoundField DataField="WatchId" HeaderText="WatchId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="WatchId" Visible="False" />
                <asp:BoundField DataField="WatchTime" HeaderText="值班时间" 
                    SortExpression="WatchTime" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ControlName" HeaderText="值班人" 
                    SortExpression="ControlName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ControlPhone" HeaderText="电话" 
                    SortExpression="ControlPhone" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchName" HeaderText="应急值班人" 
                    SortExpression="WatchName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchPhone" HeaderText="电话" 
                    SortExpression="WatchPhone" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CheckName" HeaderText="值班监督" 
                    SortExpression="CheckName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CheckPhone" HeaderText="电话" 
                    SortExpression="CheckPhone" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Notes" HeaderText="备注" SortExpression="Notes" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchDate" HeaderText="WatchDate" 
                    SortExpression="WatchDate" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT TOP 2 * FROM [ob_Watch] ORDER BY [WatchDate] DESC">
        </asp:SqlDataSource>
    </asp:Panel>
     <asp:Panel ID="Panel5" runat="server" Width="960px" HorizontalAlign="Center" ScrollBars="Auto">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司会议纪要（即会议记录）</center>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource5" onrowdatabound="GridView4_RowDataBound" 
            DataKeyNames="minutesId" Width="960px" EnableModelValidation="True">
            <Columns>
               
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField   DataField ="minutesTime" HeaderText="会议时间"  SortExpression="minutesTime" Visible="false">
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                <asp:BoundField  DataField ="minutesPlace" HeaderText="会议地点" SortExpression="minutesPlace">
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                <asp:BoundField  DataField ="minutesType" HeaderText="会议类型" SortExpression="minutesType">
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                <asp:BoundField  DataField ="attendPersonnel" HeaderText="参会人员" SortExpression="attendPersonnel">
                    
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                
                <asp:BoundField  DataField="minutesContent" HeaderText="会议内容" SortExpression="minutesContent">
                   
                    <ItemStyle Width="500px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserFullName" HeaderText="记录人" ReadOnly="True" 
                    SortExpression="UserFullName" />
                <asp:BoundField DataField="meetingDate" DataFormatString="{0:f}" 
                    HeaderText="会议时间" ReadOnly="True" SortExpression="meetingDate" />
                    <asp:BoundField DataField ="remark" HeaderText="备注" SortExpression="remark">
                   
                    <ItemStyle Width="100px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT top 6 * FROM v_minutes ORDER BY meetingDate DESC">
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
    <h5>待审批的请假：
        </h5>
    <hr />
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [v_userleave] WHERE (([DepartmentId] = ?) AND ([DepartmentIdea] IS NULL)) ORDER BY [LeaveDate] DESC">
    <SelectParameters>
        <asp:SessionParameter Name="DepartmentId" SessionField="departmentid" 
            Type="Int32" />
    </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" Width="940px" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="LeaveId" HeaderText="序号" SortExpression="LeaveId" />
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
                <asp:BoundField DataField="TransferPeople" HeaderText="工作交接人" 
                    SortExpression="TransferPeople" />
                <asp:BoundField DataField="DepartmentIdea" HeaderText="部门意见" 
                    SortExpression="DepartmentIdea" />
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
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="Server" Visible="False">
    <p>部门审批意见：</p>
        <table style="width:700px;" align="center" class="alltable">
            <tr style="height: 30px">
                <td width="100px">
                    请假人</td>
                <td width="200px">
                    请假事由</td>
                <td width="400px">
                    部门意见</td>
            </tr>
            <tr style="height: 120px">
                <td>
                    <asp:Label ID="Lusername" runat="server" Text="Label" Width="90px"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Lleavecontent" runat="server" Text="Label" Width="190px"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TBdepartmentidea" runat="server" Height="195px" 
                        TextMode="MultiLine" Width="380px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Text="*" ValidationGroup="newidea" ControlToValidate="TBdepartmentidea"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr style="height: 30px">
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Bsave" runat="server" Text="提交部门意见" onclick="Bsave_Click" 
                        ValidationGroup="newidea" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                        SelectCommand="SELECT * FROM [ob_UserLeave]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
    <p>
    已经审批的请假：
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="940px">
            <Columns>
                <asp:BoundField DataField="LeaveId" HeaderText="序号" SortExpression="LeaveId" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="UserFullName" HeaderText="UserFullName" 
                    SortExpression="UserFullName" Visible="False" />
                <asp:BoundField DataField="LeaveContent" HeaderText="请假事由" 
                    SortExpression="LeaveContent" />
                <asp:BoundField DataField="LeaveDays" HeaderText="请假天数" 
                    SortExpression="LeaveDays" />
                <asp:BoundField DataField="LeaveDuration" HeaderText="请假期间" 
                    SortExpression="LeaveDuration" />
                <asp:BoundField DataField="TransferPeople" HeaderText="交接人" 
                    SortExpression="TransferPeople" />
                <asp:BoundField DataField="DepartmentIdea" HeaderText="部门意见" 
                    SortExpression="DepartmentIdea" />
                <asp:BoundField DataField="ApprovePeople" HeaderText="审批人" 
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            
            SelectCommand="SELECT LeaveId, UserId, LeaveContent, LeaveDays, LeaveDuration, TransferPeople, DepartmentIdea, ApprovePeople, LeaveDate, ApproveUserId, UserFullName, DepartmentId, DepartmentName, TransferContent FROM v_userleave WHERE (UserId = ?) AND (LeaveDate &gt; DATEADD(month, - 1, GETDATE())) ORDER BY LeaveDays">
            <SelectParameters>
                <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </asp:Panel>
</asp:Content>

