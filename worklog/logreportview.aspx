<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="logreportview.aspx.cs" Inherits="worklog_logreportview" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Width="960px" ScrollBars="Horizontal">
   
   <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="550px" InteractiveDeviceInfos="(集合)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="">
        <LocalReport ReportPath="report\LogReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="DS_worklog" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        
        
        
          SelectCommand="SELECT WorkLogId, DepartmentName, ProjectName, ProjectManager, Associater, WorkDate, WorkContent, ProjectContent, EndOf, UseTime, PlanEndDate, LogDate, UserFullName, Review, NextPlan, UserId FROM v_worklog WHERE (LogDate BETWEEN ? AND ?) AND (UserId = ?) ORDER BY LogDate DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1900-1-1" Name="LogDate1" 
                QueryStringField="date1" Type="DateTime" />
            <asp:QueryStringParameter DefaultValue="1900-1-1" Name="LogDate2" 
                QueryStringField="date2" Type="DateTime" />
            <asp:QueryStringParameter DefaultValue="" Name="selectid" 
                QueryStringField="selectuserid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
     </asp:Panel>
</asp:Content>

