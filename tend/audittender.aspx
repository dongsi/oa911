<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="audittender.aspx.cs" Inherits="tend_audittender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="overflow: scroll">
   <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司项目报备情况审核</center>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
    AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="QualificationId" 
    DataSourceID="SqlDataSource1" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Width="960px" 
           PageSize="15" onrowdatabound="GridView1_RowDataBound">
    <Columns>
      <asp:TemplateField ShowHeader="False" HeaderText="删除" >
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                            Visible='<%# Session["admin"] %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
        <asp:CommandField ShowSelectButton="True" HeaderText="选择" >
        <ItemStyle Width="30px" HorizontalAlign="Center" />
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
            SortExpression="UserLoginName"  >
<ItemStyle Width="40px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ProjectName" HeaderText="项目名称" ReadOnly="True" 
            SortExpression="ProjectName" >
        <HeaderStyle Wrap="False" />

<ItemStyle Width="150px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Operator" HeaderText="经办人" 
            SortExpression="Operator"
            ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center" ></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Approver" HeaderText="批准人" 
            SortExpression="Approver"  ItemStyle-HorizontalAlign="Center">
        <HeaderStyle Wrap="False" />

<ItemStyle HorizontalAlign="Center" Width="50px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="TenderDate" HeaderText="投标日期" ReadOnly="True"  ItemStyle-ForeColor="Red"
            SortExpression="TenderDate" >
        <HeaderStyle Wrap="False" />

<ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="QualificationContent" HeaderText="资质内容" 
            ReadOnly="True" SortExpression="QualificationContent" ItemStyle-Width="250px">
        <HeaderStyle Wrap="False" />

<ItemStyle Width="250px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Tender" HeaderText="投标托标" ReadOnly="True"  Visible="false"
            SortExpression="Tender" >
<ItemStyle Width="55px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ContactName" HeaderText="联系姓名" ReadOnly="True" 
            SortExpression="ContactName"  >
<ItemStyle Width="55px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ContactTel" HeaderText="联系固话" ReadOnly="True" Visible="false" 
            SortExpression="ContactTel"  >
<ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ContactPhone" HeaderText="联系固话/手机" ReadOnly="True" 
            SortExpression="ContactPhone" >
<ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ContactAddress" HeaderText="联系地址" ReadOnly="True" 
            SortExpression="ContactAddress"  >
<ItemStyle Width="150px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="AddDate" HeaderText="填报时间" ReadOnly="True" 
            SortExpression="AddDate"  DataFormatString="{0:f}" >
<ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ChargeCase" HeaderText="收费情况" 
            SortExpression="ChargeCase" Visible="False" >
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="ChargeLine" HeaderText="收费额度" Visible="false" 
            SortExpression="ChargeLine"  >
<ItemStyle Width="55px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="ChargeDate" HeaderText="收费时间" Visible="false" 
            SortExpression="ChargeDate"  >
<ItemStyle Width="90px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="QualificationUser" HeaderText="建设单位" ReadOnly="True" 
            SortExpression="QualificationUser" >
        <HeaderStyle Wrap="False" />

<ItemStyle Width="120px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="UserAddress" HeaderText="项目地址" 
            SortExpression="UserAddress" ReadOnly="True"   Visible="false">
<ItemStyle Width="120px" HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="PrepaidPrice" HeaderText="项目预算" ReadOnly="True"  Visible="false" 
            SortExpression="PrepaidPrice" >
        <HeaderStyle Wrap="False" />
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="UsedName" HeaderText="借用单位" ReadOnly="True" 
            SortExpression="UsedName" >
        <HeaderStyle Wrap="False" />
        <ItemStyle HorizontalAlign="Center" />
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
    SelectCommand="SELECT * FROM [v_qualification] ORDER BY AddDate DESC" 
        DeleteCommand="DELETE FROM [ob_Qualification] WHERE [QualificationId] = ?">
    
    
</asp:SqlDataSource>
<asp:Panel ID="Panel1" runat="Server" Visible="False">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="QualificationId" DataSourceID="SqlDataSource2" Height="50px" 
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
            <asp:BoundField DataField="UserAddress" HeaderText="项目地址" ReadOnly="True" 
                SortExpression="UserAddress" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="PrepaidPrice" HeaderText="项目预算" ReadOnly="True" 
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
            <asp:BoundField DataField="Tender" HeaderText="投标托标" ReadOnly="True" 
                SortExpression="Tender" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactName" HeaderText="联系姓名" ReadOnly="True" 
                SortExpression="ContactName" >
            <ControlStyle Width="550px" />
            </asp:BoundField>
            <asp:BoundField DataField="ContactTel" HeaderText="联系固话" ReadOnly="True" 
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
            <asp:TemplateField HeaderText="收费情况" SortExpression="ChargeCase">
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
            <asp:TemplateField HeaderText="收费额度" SortExpression="ChargeLine">
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
            <asp:TemplateField HeaderText="收费时间" SortExpression="ChargeDate">
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
                UpdateText="确定" ShowDeleteButton="True" 
                DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" />
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

