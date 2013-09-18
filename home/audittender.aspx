<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="audittender.aspx.cs" Inherits="home_audittender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="overflow: scroll">
   <h4>审核项目报备情况</h4>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QualificationId" 
    DataSourceID="SqlDataSource1" EnableModelValidation="True" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="940px" 
           PageSize="15" onrowdatabound="GridView1_RowDataBound">
    <Columns>
        <asp:CommandField ShowSelectButton="True" >
        <ItemStyle Width="25px" />
        </asp:CommandField>
        <asp:TemplateField HeaderText="序号" InsertVisible="False" 
            SortExpression="QualificationId">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("QualificationId") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </ItemTemplate>
            <HeaderStyle Wrap="False" />
            <ItemStyle HorizontalAlign="Center" Width="30px" />
        </asp:TemplateField>
        <asp:BoundField DataField="UserLoginName" HeaderText="报备人" ReadOnly="true"
            SortExpression="UserLoginName" ItemStyle-Width="40px" >
<ItemStyle Width="40px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ProjectName" HeaderText="项目名称" ReadOnly="True" 
            SortExpression="ProjectName" ItemStyle-Width="150px">
        <HeaderStyle Wrap="False" />

<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Operator" HeaderText="经办人员" 
            SortExpression="Operator" ItemStyle-Width="55px" 
            ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center" Width="55px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Approver" HeaderText="批准人员" 
            SortExpression="Approver" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
        <HeaderStyle Wrap="False" />

<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="TenderDate" HeaderText="投标日期" ReadOnly="True" 
            SortExpression="TenderDate" ItemStyle-Width="90px">
        <HeaderStyle Wrap="False" />

<ItemStyle Width="90px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="QualificationContent" HeaderText="资质内容" 
            ReadOnly="True" SortExpression="QualificationContent" ItemStyle-Width="250px">
        <HeaderStyle Wrap="False" />

<ItemStyle Width="250px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Tender" HeaderText="投标托标" ReadOnly="True"  Visible="false" 
            SortExpression="Tender" ItemStyle-Width="55px" >
<ItemStyle Width="55px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ContactName" HeaderText="联系姓名" ReadOnly="True" 
            SortExpression="ContactName" ItemStyle-Width="55px" >
<ItemStyle Width="55px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ContactTel" HeaderText="联系固话" ReadOnly="True"  Visible="false" 
            SortExpression="ContactTel" ItemStyle-Width="90px" >
            
<ItemStyle Width="90px"></ItemStyle></asp:BoundField>
        <asp:BoundField DataField="UsedName" HeaderText="借用单位" ReadOnly="True" 
            SortExpression="UsedName" >
        <HeaderStyle Wrap="False" />
        </asp:BoundField>
        <asp:BoundField DataField="QualificationNotes" HeaderText="备注" 
            SortExpression="QualificationNotes" />
    </Columns>
        <HeaderStyle Wrap="False" />
</asp:GridView>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
    OldValuesParameterFormatString="original_{0}" 
    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
    SelectCommand="SELECT * FROM [v_qualification] ORDER BY AddDate DESC">
</asp:SqlDataSource>
<asp:Panel ID="Panel1" runat="Server" Visible="False">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="QualificationId" DataSourceID="SqlDataSource2" 
        EnableModelValidation="True" Height="50px" 
        onitemupdating="DetailsView1_ItemUpdating" 
        onmodechanging="DetailsView1_ModeChanging" Width="680px" 
    HorizontalAlign="Left" onitemdeleting="DetailsView1_ItemDeleting">
        <Fields>
            <asp:BoundField DataField="QualificationId" HeaderText="序号" 
                InsertVisible="False" ReadOnly="True" SortExpression="QualificationId" >
            <ControlStyle Width="550px" />
            <HeaderStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="报备人" SortExpression="TenderUserId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="UserLoginName" 
                        DataValueField="TenderUserId" Enabled="False" 
                        SelectedValue='<%# Bind("TenderUserId") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TenderUserId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="UserLoginName" 
                        DataValueField="TenderUserId" Enabled="False" 
                        SelectedValue='<%# Bind("TenderUserId") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
                <ControlStyle Width="550px" />
            </asp:TemplateField>
            <asp:BoundField DataField="ProjectName" HeaderText="项目名称" ReadOnly="True" 
                SortExpression="ProjectName" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="QualificationUser" HeaderText="建设单位" ReadOnly="True" 
                SortExpression="QualificationUser" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="UserAddress" HeaderText="项目地址" ReadOnly="True"  Visible="false" 
                SortExpression="UserAddress" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="PrepaidPrice" HeaderText="项目预算" ReadOnly="True"  Visible="false" 
                SortExpression="PrepaidPrice" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="UsedName" HeaderText="借用单位" ReadOnly="True" 
                SortExpression="UsedName" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="QualificationContent" HeaderText="资质内容" 
                ReadOnly="True" SortExpression="QualificationContent" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="Tender" HeaderText="投标托标" ReadOnly="True"  Visible="false" 
                SortExpression="Tender" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactName" HeaderText="联系姓名" ReadOnly="True" 
                SortExpression="ContactName" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactTel" HeaderText="联系固话" ReadOnly="True"  Visible="false" 
                SortExpression="ContactTel" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactPhone" HeaderText="联系手机" ReadOnly="True" 
                SortExpression="ContactPhone" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactAddress" HeaderText="联系地址" ReadOnly="True" 
                SortExpression="ContactAddress" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="TenderDate" HeaderText="投标日期" ReadOnly="True" 
                SortExpression="TenderDate" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="AddDate" HeaderText="填报时间" ReadOnly="True" 
                SortExpression="AddDate" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="经办人员" SortExpression="Operator">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Operator") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="needvalues">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Operator") %>'></asp:TextBox>
 
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Operator") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="550px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批准人员" SortExpression="Approver">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Approver") %>'></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="needvalues">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Approver") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Approver") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="550px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收费情况" SortExpression="ChargeCase"  Visible="false" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ChargeCase") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="needvalues">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ChargeCase") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ChargeCase") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="550px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收费额度" SortExpression="ChargeLine"  Visible="false" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("ChargeLine") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="needvalues">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ChargeLine") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ChargeLine") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="550px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="收费时间" SortExpression="ChargeDate"  Visible="false" >
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ChargeDate") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="needvalues">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ChargeDate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ChargeDate") %>'></asp:Label>
                </ItemTemplate>
                <ControlStyle Width="550px" />
            </asp:TemplateField>
            <asp:BoundField DataField="QualificationNotes" HeaderText="备注" 
                NullDisplayText=" " SortExpression="QualificationNotes" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:CommandField ShowEditButton="True" ValidationGroup="needvalues" 
                UpdateText="确定" ShowDeleteButton="True" />
        </Fields>
    </asp:DetailsView>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        DeleteCommand="DELETE FROM [ob_Qualification] WHERE [QualificationId] = ?" 
        InsertCommand="INSERT INTO [ob_Qualification] ([QualificationId], [TenderUserId], [ProjectName], [QualificationUser], [UserAddress], [PrepaidPrice], [UsedName], [QualificationContent], [Tender], [ContactName], [ContactTel], [ContactPhone], [ContactAddress], [TenderDate], [AddDate], [Operator], [Approver], [ChargeCase], [ChargeLine], [ChargeDate], [QualificationNotes]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [ob_Qualification]" 
        UpdateCommand="UPDATE [ob_Qualification] SET [TenderUserId] = ?, [ProjectName] = ?, [QualificationUser] = ?, [UserAddress] = ?, [PrepaidPrice] = ?, [UsedName] = ?, [QualificationContent] = ?, [Tender] = ?, [ContactName] = ?, [ContactTel] = ?, [ContactPhone] = ?, [ContactAddress] = ?, [TenderDate] = ?, [AddDate] = ?, [Operator] = ?, [Approver] = ?, [ChargeCase] = ?, [ChargeLine] = ?, [ChargeDate] = ?, [QualificationNotes] = ? WHERE [QualificationId] = ?">
        <DeleteParameters>
            <asp:Parameter Name="QualificationId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QualificationId" Type="Int32" />
            <asp:Parameter Name="TenderUserId" Type="Int32" />
            <asp:Parameter Name="ProjectName" Type="String" />
            <asp:Parameter Name="QualificationUser" Type="String" />
            <asp:Parameter Name="UserAddress" Type="String" />
            <asp:Parameter Name="PrepaidPrice" Type="String" />
            <asp:Parameter Name="UsedName" Type="String" />
            <asp:Parameter Name="QualificationContent" Type="String" />
            <asp:Parameter Name="Tender" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="ContactTel" Type="String" />
            <asp:Parameter Name="ContactPhone" Type="String" />
            <asp:Parameter Name="ContactAddress" Type="String" />
            <asp:Parameter Name="TenderDate" Type="String" />
            <asp:Parameter Name="AddDate" Type="DateTime" />
            <asp:Parameter Name="Operator" Type="String" />
            <asp:Parameter Name="Approver" Type="String" />
            <asp:Parameter Name="ChargeCase" Type="String" />
            <asp:Parameter Name="ChargeLine" Type="String" />
            <asp:Parameter Name="ChargeDate" Type="String" />
            <asp:Parameter Name="QualificationNotes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenderUserId" Type="Int32" />
            <asp:Parameter Name="ProjectName" Type="String" />
            <asp:Parameter Name="QualificationUser" Type="String" />
            <asp:Parameter Name="UserAddress" Type="String" />
            <asp:Parameter Name="PrepaidPrice" Type="String" />
            <asp:Parameter Name="UsedName" Type="String" />
            <asp:Parameter Name="QualificationContent" Type="String" />
            <asp:Parameter Name="Tender" Type="String" />
            <asp:Parameter Name="ContactName" Type="String" />
            <asp:Parameter Name="ContactTel" Type="String" />
            <asp:Parameter Name="ContactPhone" Type="String" />
            <asp:Parameter Name="ContactAddress" Type="String" />
            <asp:Parameter Name="TenderDate" Type="String" />
            <asp:Parameter Name="AddDate" Type="DateTime" />
            <asp:Parameter Name="Operator" Type="String" />
            <asp:Parameter Name="Approver" Type="String" />
            <asp:Parameter Name="ChargeCase" Type="String" />
            <asp:Parameter Name="ChargeLine" Type="String" />
            <asp:Parameter Name="ChargeDate" Type="String" />
            <asp:Parameter Name="QualificationNotes" Type="String" />
            <asp:Parameter Name="QualificationId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT [TenderUserId], [UserLoginName] FROM [ob_Tenderinfo]">
    </asp:SqlDataSource>

</asp:Content>

