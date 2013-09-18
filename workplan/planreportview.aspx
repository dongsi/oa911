<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="planreportview.aspx.cs" Inherits="workplan_planreportview" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司工作计划表</center>
     <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(集合)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt" Width="920px">
        <LocalReport ReportPath="report\weekplanReport.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="SqlDataSource1" Name="weekplanDataSet" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [v_weekplan] WHERE ([Plandate] BETWEEN ? AND ?) ORDER BY [Plandate] DESC">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1990-1-1" Name="PlanDate1" 
                QueryStringField="date1" Type="DateTime" />
            <asp:QueryStringParameter DefaultValue="1900-1-1" Name="PlanDate2" 
                QueryStringField="date2" Type="DateTime" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

