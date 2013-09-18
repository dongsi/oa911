<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchplan.aspx.cs" Inherits="workplan_searchplan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br/><h4 style="text-align:center;">请选择起止时间来导出周工作计划表</h4>
    <asp:TextBox ID="BeginDate" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="BeginDate" ValidationGroup="newdate">*</asp:RequiredFieldValidator>
    <asp:Button ID="Bbegin" runat="server" Text="选取起始时间" onclick="Bbegin_Click" />
    <asp:TextBox ID="EndDate" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="newdate" ControlToValidate="EndDate">*</asp:RequiredFieldValidator>
    <asp:Button ID="Bend" runat="server" Text="选取结束时间" onclick="Bend_Click" />
    <asp:Button ID="Bsearch" runat="Server" Text="查询" onclick="Bsearch_Click" 
        ValidationGroup="newdate" />
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
        BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" 
        Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" 
        Visible="False" Width="330px" 
        onselectionchanged="Calendar1_SelectionChanged">
        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
            Height="8pt" />
        <DayStyle BackColor="#CCCCCC" />
        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
        <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" 
            Font-Size="12pt" ForeColor="White" Height="12pt" />
        <TodayDayStyle BackColor="#999999" ForeColor="White" />
    </asp:Calendar>
</asp:Content>

