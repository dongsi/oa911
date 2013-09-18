<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editExpress.aspx.cs" Inherits="editExpress" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="text-align: center;">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司快递收发表</center>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="courierTransceiverid" 
       
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
                            Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')
&quot;&gt;删除&lt;/div&gt;" 
                            Visible='<%# Session["admin"] %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
            <asp:BoundField DataField="UserFullName" HeaderText="经办人" 
                SortExpression="UserFullName" ReadOnly="True" >
           
             <ItemStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="sendReceiveTime" HeaderText="收发时间" 
                SortExpression="sendReceiveTime" ReadOnly="True" >
             <ItemStyle Width="55px" />
            </asp:BoundField>
           
            <asp:TemplateField HeaderText="内容摘要" SortExpression="Content">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Height="140px" 
                        Text='<%# Bind("Content") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Content") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="邮寄单位" SortExpression="Mailunit">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Height="140px" 
                        Text='<%# Bind("Mailunit") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Mailunit") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            
            <asp:BoundField DataField="receiver" HeaderText="收件人" 
                SortExpression="receiver"  ReadOnly="True" >
              <ItemStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="sender" HeaderText="发件人" 
                SortExpression="sender" ReadOnly="True" >
              <ItemStyle Width="40px" />
            </asp:BoundField>
            <asp:BoundField DataField="transceiverType" HeaderText="快递类型" 
                SortExpression="transceiverType"  ReadOnly="True">
          <ItemStyle Width="55px" />
            </asp:BoundField>
            <asp:BoundField DataField="submitTime" HeaderText="提交时间" 
                SortExpression="submitTime" ReadOnly="True" >
            <ItemStyle Width="72px" />
            </asp:BoundField>
            <asp:BoundField DataField="DepartmentName" HeaderText="部门" 
                SortExpression="DepartmentName" ReadOnly="True"   Visible="false">
            
            </asp:BoundField>
              <asp:TemplateField HeaderText="备注" SortExpression="note">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Height="100px" 
                        Text='<%# Bind("note") %>' TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("note") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
        </Columns>
        <HeaderStyle HorizontalAlign="Center"  />
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
             DeleteCommand="DELETE FROM [ob_CourierTransceiver] WHERE [courierTransceiverid] = ?"
            SelectCommand="SELECT  courierTransceiverid,
[Content],receiver,Mailunit,sender,sendReceiveTime,transceiverType,submitTime,note,UserFullName,DepartmentName  FROM 
v_CourierTransceiver ORDER BY submitTime DESC" 
            UpdateCommand="UPDATE ob_CourierTransceiver SET [Content] = ?, Mailunit = ?,note= ?  WHERE 
(courierTransceiverid = ?)">
    </asp:SqlDataSource>




</asp:Content>