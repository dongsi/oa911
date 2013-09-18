<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="contractmanager.aspx.cs" Inherits="project_contractmanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="940px" HorizontalAlign="Center" ScrollBars="Auto">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司合同管理编辑</center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" Width="100%" DataKeyNames="ContractId" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:CommandField ShowEditButton="True" >
                <ItemStyle Width="40px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="序号" SortExpression="ContractId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserFullName" HeaderText="登记人" 
                    SortExpression="UserFullName" ReadOnly="True" />
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
                    SortExpression="ContractDate" DataFormatString="{0:f}" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            
            SelectCommand="SELECT * FROM [v_contractmanager] ORDER BY [ContractDate] DESC" 
            UpdateCommand="UPDATE v_contractmanager SET BuilderName = ?, ProjectName = ?, SignDate = ?, 
            CheckDate = ?, LifeOfQuality = ?, DateOfQuality = ?, ContractPrice = ?, InvoicePrice = ?, 
            InvoiceCom = ?, QualityPrice = ?, ContractNotes = ? WHERE (ContractId = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

