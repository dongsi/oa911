<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addworklog.aspx.cs" Inherits="worklog_addworklog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
 <table class="alltable" Width="960px">
    <tr height="30">
        <td colspan="4"  style="font-size:1.0em;font-weight:bold">山东风范电子科技有限公司员工工作日志</td>
    </tr>
    <tr height="30">
        <td width="100px">
                工作地点</td>
        <td width="358px">
                <asp:TextBox ID="ProjectName" runat="server" Width="340px" Height="28px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="输入有效内容！" ValidationGroup="newlog" ControlToValidate="ProjectName" 
                    Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td width="100px">
                项目负责人</td>
        <td width="358px">
                <asp:TextBox ID="ProjectManager" runat="server" Width="340px" Height="28px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="输入有效内容！" ValidationGroup="newlog" 
                    ControlToValidate="ProjectManager" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr height="30">
     <td width="86px" rowspan="2">
               工作描述<br /> 
               <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label">
                    详细记载每项工作名称、耗用时间等需要记录的内容，便于发放工资钱考核统计，不注明耗用时间的一律按&quot;日常工作&quot;计算发工资</asp:Label>
               </td>
        <td width="258px" rowspan="2">
                
            <asp:TextBox ID="WorkContent" runat="server" Height="293px" 
                style="margin-top: 0px" TextMode="MultiLine" Width="345px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="WorkContent" ErrorMessage="输入有效内容！" ForeColor="Red" Text="*" 
                ValidationGroup="newlog"></asp:RequiredFieldValidator>
                
        </td>
        <td width="100px">
                配合人</td>
        <td width="258px">
                <asp:TextBox ID="Associater" runat="server" Width="340px" Height="28px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="输入有效内容！" ValidationGroup="newlog" ControlToValidate="Associater" 
                    Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
       
    </tr>
    <tr height="200">
        <td width="86px">
                明日计划</td>
        <td width="258px">
                <asp:TextBox ID="NextPlan" runat="server" Height="265px" TextMode="MultiLine" 
                    Width="340px"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="输入有效内容！" ValidationGroup="newlog" 
                    ControlToValidate="NextPlan" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr height="30">
        <td colspan="4" style="color: #FF0000">
                备注：除填写每项工作情况外，还要填写耗用材料、耗用时间，非“明日安排”内的，<br/>即临时添加的任务要注明新增。<asp:Button ID="BSave" 
                    runat="server" onclick="BSave_Click" Text="保存工作日志" ValidationGroup="newlog" />
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" 
                    Visible="False"></asp:Label>
        </td>
    </tr>
</table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                    SelectCommand="SELECT * FROM [ob_WorkLog]">
                </asp:SqlDataSource>
                   </asp:Panel>
</asp:Content>

