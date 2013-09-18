<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchcontract.aspx.cs" Inherits="project_searchcontract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px" 
        ScrollBars="Horizontal">
   <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司合同管理查询</center>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
        EnableModelValidation="True" AllowPaging="True" AutoGenerateColumns="False" onrowdatabound="GridView1_RowDataBound" 
            DataKeyNames="ContractId" Width="1000px" PageSize="6">
        <Columns>
            <asp:BoundField DataField="ContractId" HeaderText="序号" InsertVisible="False" 
                ReadOnly="True" SortExpression="ContractId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                Visible="False" />
            <asp:BoundField DataField="BuilderName" HeaderText="建设单位" 
                SortExpression="BuilderName" />
            <asp:BoundField DataField="ProjectName" HeaderText="项目名称" 
                SortExpression="ProjectName" />
            <asp:BoundField DataField="SignDate" HeaderText="签订时间" 
                SortExpression="SignDate" />
            <asp:BoundField DataField="CheckDate" HeaderText="验收时间" 
                SortExpression="CheckDate" />
            <asp:BoundField DataField="LifeOfQuality" HeaderText="质保期" 
                SortExpression="LifeOfQuality" />
            <asp:BoundField DataField="DateOfQuality" HeaderText="质保起止日期" 
                SortExpression="DateOfQuality" />
            <asp:BoundField DataField="ContractPrice" HeaderText="合同金额" 
                SortExpression="ContractPrice" />
            <asp:BoundField DataField="InvoicePrice" HeaderText="开票金额" 
                SortExpression="InvoicePrice" />
            <asp:BoundField DataField="InvoiceCom" HeaderText="出票单位" 
                SortExpression="InvoiceCom" />
            <asp:BoundField DataField="QualityPrice" HeaderText="质保金额" 
                SortExpression="QualityPrice" />
            <asp:BoundField DataField="ContractNotes" HeaderText="备注" 
                SortExpression="ContractNotes" />
            <asp:BoundField DataField="ContractDate" HeaderText="登记时间" 
                SortExpression="ContractDate" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_ContractManager] WHERE ([UserId] = ?) ORDER BY [ContractDate] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
        </SelectParameters>
        </asp:SqlDataSource>
     </asp:Panel>
</asp:Content>

