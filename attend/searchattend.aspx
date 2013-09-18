<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchattend.aspx.cs" Inherits="attend_searchattend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server">
    <br/><h4>查询并导出考勤情况</h4>
    <asp:Label ID="Label1" runat="server" Text="选择要查询的月份："></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="Column1" DataValueField="Column1">
    </asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="要查询的人员："></asp:Label>
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="UserFullName" 
        DataValueField="UserId" ondatabound="DropDownList2_DataBound">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT [UserId], [UserFullName] FROM [ob_userinfo]">
    </asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="查询" onclick="Button1_Click" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" SelectCommand="SELECT distinct convert(nvarchar(6),[BeginDate],112)
  FROM [u911110oa].[dbo].[ob_Attend] where BeginDate is not null">
    </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

