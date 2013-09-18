<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="approvestamp.aspx.cs" Inherits="home_approvestamp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="940px">
    <h4>审核公章申请</h4>
    <asp:GridView ID="GridView5" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="Stampid" 
            DataSourceID="SqlDataSource5" EnableModelValidation="True" 
            onrowupdating="GridView5_RowUpdating" 
            onrowdatabound="GridView5_RowDataBound">
            <Columns>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="Stampid">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="StampContent" HeaderText="事由" ReadOnly="True" 
                    SortExpression="StampContent" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="StampUser" HeaderText="使用单位" ReadOnly="True" 
                    SortExpression="StampUser" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserAddress" HeaderText="联系地址" ReadOnly="True" 
                    SortExpression="UserAddress" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserName" HeaderText="联系人" ReadOnly="True" 
                    SortExpression="UserName" >
                <ItemStyle Width="45px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserTel" HeaderText="联系固话" ReadOnly="True" 
                    SortExpression="UserTel" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserPhone" HeaderText="联系手机" ReadOnly="True" 
                    SortExpression="UserPhone" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="UseDate" HeaderText="时间" ReadOnly="True" 
                    SortExpression="UseDate" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Operator" HeaderText="经办人" ReadOnly="True" 
                    SortExpression="Operator" >
                <ItemStyle Width="45px" />
                </asp:BoundField>
                <asp:BoundField DataField="Approver" HeaderText="批准人" 
                    SortExpression="Approver" >
                <ItemStyle Width="45px" />
                </asp:BoundField>
                <asp:BoundField DataField="StampNotes" HeaderText="备注" ReadOnly="True" 
                    SortExpression="StampNotes" >
                <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="StampDate" HeaderText="申请时间" ReadOnly="True" 
                    SortExpression="StampDate" DataFormatString="{0:f}" >
                <ItemStyle Width="80px" />
                </asp:BoundField>
                <asp:CommandField ShowEditButton="True" >
                <ItemStyle Width="40px" />
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_Stamp] WHERE [Stampid] = ?" 
            InsertCommand="INSERT INTO [ob_Stamp] ([Stampid], [UserId], [StampContent], [StampUser], [UserAddress], [UserName], [UserTel], [UserPhone], [UseDate], [Operator], [Approver], [StampNotes], [StampDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_Stamp] WHERE ([Approver] IS NULL) ORDER BY [StampDate] DESC" 
            UpdateCommand="UPDATE [ob_Stamp] SET [UserId] = ?, [StampContent] = ?, [StampUser] = ?, [UserAddress] = ?, [UserName] = ?, [UserTel] = ?, [UserPhone] = ?, [UseDate] = ?, [Operator] = ?, [Approver] = ?, [StampNotes] = ?, [StampDate] = ? WHERE [Stampid] = ?">
            <DeleteParameters>
                <asp:Parameter Name="Stampid" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Stampid" Type="Int32" />
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StampContent" Type="String" />
                <asp:Parameter Name="StampUser" Type="String" />
                <asp:Parameter Name="UserAddress" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="UserTel" Type="String" />
                <asp:Parameter Name="UserPhone" Type="String" />
                <asp:Parameter Name="UseDate" Type="String" />
                <asp:Parameter Name="Operator" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="StampNotes" Type="String" />
                <asp:Parameter Name="StampDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserId" Type="Int32" />
                <asp:Parameter Name="StampContent" Type="String" />
                <asp:Parameter Name="StampUser" Type="String" />
                <asp:Parameter Name="UserAddress" Type="String" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="UserTel" Type="String" />
                <asp:Parameter Name="UserPhone" Type="String" />
                <asp:Parameter Name="UseDate" Type="String" />
                <asp:Parameter Name="Operator" Type="String" />
                <asp:Parameter Name="Approver" Type="String" />
                <asp:Parameter Name="StampNotes" Type="String" />
                <asp:Parameter Name="StampDate" Type="DateTime" />
                <asp:Parameter Name="Stampid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

