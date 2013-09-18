<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stampmanager.aspx.cs" Inherits="caiwu_stampmanager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="100%" HorizontalAlign="Center" 
        ScrollBars="Horizontal">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司公章管理登记表</center>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="Stampid" 
            DataSourceID="SqlDataSource1" Width="100%" 
            onrowdatabound="GridView1_RowDataBound">
            <Columns>
                <asp:CommandField ShowEditButton="True" HeaderText="编辑">
                <ItemStyle Width="40px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="Stampid">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="StampContent" HeaderText="事由" 
                    SortExpression="StampContent" />
                <asp:BoundField DataField="StampUser" HeaderText="使用单位" 
                    SortExpression="StampUser" />
                <asp:BoundField DataField="UserAddress" HeaderText="联系地址" 
                    SortExpression="UserAddress" />
                <asp:BoundField DataField="UserName" HeaderText="联系人" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="UserTel" HeaderText="联系固话" 
                    SortExpression="UserTel" />
                <asp:BoundField DataField="UserPhone" HeaderText="联系手机" 
                    SortExpression="UserPhone" />
                <asp:BoundField DataField="UseDate" HeaderText="时间" SortExpression="UseDate" />
                <asp:BoundField DataField="Operator" HeaderText="经办人" 
                    SortExpression="Operator" />
                <asp:BoundField DataField="Approver" HeaderText="批准人" 
                    SortExpression="Approver" />
                <asp:BoundField DataField="StampNotes" HeaderText="备注" 
                    SortExpression="StampNotes" />
                <asp:BoundField DataField="StampDate" HeaderText="提交时间" 
                    SortExpression="StampDate" DataFormatString="{0:f}" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_Stamp] ORDER BY [StampDate] DESC" 
            UpdateCommand="UPDATE ob_Stamp SET StampContent = ?, StampUser = ?, UserAddress = ?, UserName = ?, UserTel = ?, UserPhone = ?, UseDate = ?, Operator = ?, Approver = ?, StampNotes = ? WHERE (Stampid = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

