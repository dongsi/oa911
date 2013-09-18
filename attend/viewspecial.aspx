<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="viewspecial.aspx.cs" Inherits="attend_viewspecial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="960px" HorizontalAlign="Center">
    <center style="font-size:1.0em;font-weight:bold;">员工特殊考勤情况</center>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource4" Width="960px" AllowPaging="True" 
                EnableModelValidation="True" 
        onrowdatabound="GridView4_RowDataBound" PageSize="20">
        <Columns>
            <asp:TemplateField HeaderText="序号" SortExpression="SpecialAttId">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="25px" />
            </asp:TemplateField>
            <asp:BoundField DataField="UserFullName" HeaderText="申请人" 
                SortExpression="UserFullName" >
            <ItemStyle Width="50px" />
            </asp:BoundField>
            <asp:BoundField DataField="SpecialContent" HeaderText="特殊考勤事由" 
                SortExpression="SpecialContent" >
            <ItemStyle Width="180px" />
            </asp:BoundField>
            <asp:BoundField DataField="SpecialDuration" HeaderText="考勤期间" 
                SortExpression="SpecialDuration" >
            <ItemStyle Width="160px" />
            </asp:BoundField>
            <asp:BoundField DataField="SpecialDate" HeaderText="申请日期" 
                SortExpression="SpecialDate" />
            <asp:BoundField DataField="ApproveIdea" HeaderText="意见" 
                SortExpression="ApproveIdea" />
            <asp:BoundField DataField="ApprovePeople" HeaderText="批准人" 
                SortExpression="ApprovePeople" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                Visible="False" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [v_special] WHERE ([ApprovePeople] IS NOT NULL) ORDER BY [SpecialDate] DESC">
        </asp:SqlDataSource> 
    </asp:Panel>
</asp:Content>

