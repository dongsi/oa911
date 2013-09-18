<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="attendreport.aspx.cs" Inherits="attend_attendreport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <center style="font-size:1.0em;font-weight:bold;">请选择考勤类型来显示不同的考勤</center>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
            RepeatDirection="Horizontal" 
            onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem Selected="True">正常考勤</asp:ListItem>
            <asp:ListItem >请假考勤</asp:ListItem>
            <asp:ListItem>特殊考勤</asp:ListItem>
        </asp:RadioButtonList>

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
             <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="600px" InteractiveDeviceInfos="(集合)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="940px">
        <LocalReport ReportPath="report\attendanceReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" 
                    Name="DataSetattendance" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
                    SelectCommand="SELECT * FROM [tempattendance]">
    </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <rsweb:ReportViewer ID="ReportViewer4" runat="server" Font-Names="Verdana" 
                    Font-Size="8pt" InteractiveDeviceInfos="(集合)" WaitMessageFont-Names="Verdana" 
                    WaitMessageFont-Size="14pt" Width="940px">
                    <LocalReport ReportPath="report\leavereport.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource2" Name="DataSetleave" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                   SelectCommand="SELECT [LeaveId], [UserId], [LeaveContent], [LeaveDays], [LeaveDuration], [TransferPeople], [DepartmentIdea], [ApprovePeople], [LeaveDate], [ApproveUserId], [UserFullName], [DepartmentId], [DepartmentName], [ApproveUserName] FROM [vv_userleave] WHERE  (CONVERT (nvarchar(6), [LeaveDate], 112) = ?) AND ([UserId] = ? OR ?=0) ORDER BY [UserId], [LeaveDate]">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="LeaveDate" QueryStringField="currmonth" 
                            Type="String" />
                        <asp:QueryStringParameter Name="UserId" QueryStringField="curruserid" 
                            Type="String" />
                           <asp:QueryStringParameter Name="UserIdall" QueryStringField="curruserid" 
                            Type="Int32" />
                        
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <rsweb:ReportViewer ID="ReportViewer3" runat="server" Font-Names="Verdana" 
                    Font-Size="8pt" Height="600px" InteractiveDeviceInfos="(集合)" 
                    WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="940px">
                    <LocalReport ReportPath="report\specialreport.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="SqlDataSource3" Name="DataSetspecial" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>"    
                   SelectCommand="SELECT SpecialAttId, UserFullName, SpecialContent, SpecialDuration, SpecialDate, ApprovePeople, UserId, ApproveIdea FROM v_special WHERE (CONVERT (nvarchar(6), SpecialDate, 112) = ?) AND (UserId = ? OR ?=0) ORDER BY [UserId],[SpecialDate] ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="SpecialDate" QueryStringField="currmonth" 
                            Type="String" />
                        <asp:QueryStringParameter Name="UserId" QueryStringField="curruserid" 
                        type="String"/>
                        <asp:QueryStringParameter Name="UserIdall" QueryStringField="curruserid" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
        </asp:MultiView>


</asp:Content>

