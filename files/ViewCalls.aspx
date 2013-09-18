<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCalls.aspx.cs" Inherits="ViewCalls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="text-align: center;">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司快递收发表</center>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="callsId" 
       
        PageSize="10" 
        Width="100%" onrowdatabound="GridView1_RowDataBound" >
        <Columns>
            <asp:TemplateField HeaderText="序号" SortExpression="WorkLogId">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30px" />
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ItemStyle-HorizontalAlign="NotSet" 
                HeaderText="编辑">
             <ControlStyle Width="25px" />
             <ItemStyle Width="30px" />
            </asp:CommandField>
           <asp:TemplateField ShowHeader="False" HeaderText="删除" >
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                            Visible='<%# Session["admin"] %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
            <asp:TemplateField HeaderText="姓名" SortExpression="FullName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Height="100px" width="80px"
                        Text='<%# Bind("FullName") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("FullName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="电话号码" SortExpression="PhoneNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Height="100px" width="110px"
                        Text='<%# Bind("PhoneNumber") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="话费期间" SortExpression="DuringCalls">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Height="100px" 
                        Text='<%# Bind("DuringCalls") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DuringCalls") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="实际话费" SortExpression="ActualCalls">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Height="100px" width="80px"
                        Text='<%# Bind("ActualCalls") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ActualCalls") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="超出话费" SortExpression="ExcessCharges">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Height="100px" width="80px"
                        Text='<%# Bind("ExcessCharges") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ExcessCharges") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="UserFullName" HeaderText="操作人" 
                SortExpression="UserFullName"  ReadOnly="True" >
            </asp:BoundField>
           
            
            <asp:BoundField DataField="submitTime" HeaderText="提交时间" 
                SortExpression="submitTime" ReadOnly="True" >
            <ItemStyle Width="72px" />
            </asp:BoundField>
            
              <asp:TemplateField HeaderText="备注" SortExpression="Remark">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Height="100px" 
                        Text='<%# Bind("Remark") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="140px" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center"  />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
             DeleteCommand="DELETE FROM [ob_CallsPublicity] WHERE [callsId] = ?"
            SelectCommand="SELECT  callsId,FullName,PhoneNumber,DuringCalls,ActualCalls,ExcessCharges ,Remark,submitTime,UserFullName  FROM v_CallsPublicity ORDER BY submitTime DESC" 
            UpdateCommand="UPDATE ob_CallsPublicity SET FullName=? ,PhoneNumber=? ,DuringCalls=? ,ActualCalls=? ,ExcessCharges=? ,[Remark] = ？  WHERE (callsId = ?)">
    </asp:SqlDataSource>




</asp:Content>

