<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editdepartment.aspx.cs" Inherits="baseinfo_editdepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div style="text-align:center“>
<asp:Label ID="Label1" runat="Server">新建部门名称：</asp:Label>
<asp:TextBox ID="newdepartment" runat="Server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="请输入有效的部门名称！" ControlToValidate="newdepartment" ValidationGroup="newdepartment"></asp:RequiredFieldValidator>
<asp:Button ID="createdepartment" Text="创建" runat="Server" 
        onclick="createdepartment_Click" />
</div>
<hr />
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="DepartmentId" DataSourceID="SqlDataSource1" onrowdeleting="GridView1_RowDeleting" 
        onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" 
                InsertVisible="False" ReadOnly="True" SortExpression="DepartmentId" 
                Visible="False" />
            <asp:BoundField DataField="DepartmentName" HeaderText="部门名称" 
                SortExpression="DepartmentName" />
            <asp:BoundField DataField="departmentRole" HeaderText="部门权限" 
                SortExpression="departmentRole" Visible="False" />
            <asp:CommandField ShowEditButton="True" UpdateText="确定" HeaderText="编辑" />
 <asp:CommandField ShowDeleteButton="True" DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                HeaderText="删除" />
        </Columns>
    </asp:GridView>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        DeleteCommand="DELETE FROM [ob_Department] WHERE [DepartmentId] = ?" 
        InsertCommand="INSERT INTO [ob_Department] ([DepartmentId], [DepartmentName], [departmentRole]) VALUES (?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [ob_Department]" 
        UpdateCommand="UPDATE [ob_Department] SET [DepartmentName] = ?, [departmentRole] = ? WHERE [DepartmentId] = ?">
        <DeleteParameters>
            <asp:Parameter Name="DepartmentId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DepartmentId" Type="Int32" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="departmentRole" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="departmentRole" Type="String" />
            <asp:Parameter Name="DepartmentId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

