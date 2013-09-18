<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ControlWatch.aspx.cs" Inherits="ControlWatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" Width="100%">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司售后服务400电话值班安排</center>
        <table style="width: 960px;" cellpadding="0" cellspacing="0" class="alltable">
            <tr>
                <td rowspan="2">
                    时间</td>
                <td colspan="2">
                    值班人</td>
                <td colspan="2">
                    应急值班人</td>
                <td colspan="2">
                    值班监督</td>
                <td rowspan="2">
                    备注</td>
            </tr>
            <tr>
                <td>
                    &nbsp; 姓名</td>
                <td>
                    电话</td>
                <td>
                    姓名</td>
                <td>
                    电话</td>
                <td>
                    姓名</td>
                <td>
                    电话</td>
            </tr>
            <tr>
                <td style="width: 120px">
                    <asp:TextBox ID="WatchTime" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="WatchTime" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="ControlName" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="ControlName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="ControlPhone" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="ControlPhone" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="WatchName" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="WatchName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="WatchPhone" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="WatchPhone" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="CheckName" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="CheckName" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="CheckPhone" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="CheckPhone" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
                <td style="width: 120px">
                    <asp:TextBox ID="Notes" runat="server" Width="100px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="Notes" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newwatch">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="6" style="color: #0000FF; text-align: left">
                    备注：值班时间为每周日至下周六，在周六下午例会后更新；右列“备注”栏填写每月周序或者节假日名称，如“国庆节”等。</td>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="提交" />
                    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    
        <asp:Panel ID="Panel2" runat="server" ScrollBars="Horizontal">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="WatchId" DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" 
            Width="100%">
            <Columns>
                <asp:CommandField DeleteText="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                    HeaderText="删除" ShowDeleteButton="True" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="编辑" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="编辑"></asp:LinkButton>
                        &nbsp;
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="WatchId">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </EditItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="WatchTime" HeaderText="值班时间" 
                    SortExpression="WatchTime" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ControlName" HeaderText="值班人" 
                    SortExpression="ControlName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ControlPhone" HeaderText="电话" 
                    SortExpression="ControlPhone" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchName" HeaderText="应急值班人" 
                    SortExpression="WatchName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchPhone" HeaderText="电话" 
                    SortExpression="WatchPhone" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CheckName" HeaderText="值班监督" 
                    SortExpression="CheckName" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CheckPhone" HeaderText="电话" 
                    SortExpression="CheckPhone" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Notes" HeaderText="备注" 
                    SortExpression="Notes" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchDate" HeaderText="添加时间" 
                    SortExpression="WatchDate" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_Watch] WHERE [WatchId] = ?" 
            InsertCommand="INSERT INTO [ob_Watch] ([WatchId], [WatchTime], [ControlName], [ControlPhone], [WatchName], [WatchPhone], [CheckName], [CheckPhone], [Notes], [WatchDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT TOP 3 * FROM [ob_Watch] ORDER BY [WatchDate] DESC" 
            
                UpdateCommand="UPDATE [ob_Watch] SET [WatchTime] = ?, [ControlName] = ?, [ControlPhone] = ?, [WatchName] = ?, [WatchPhone] = ?, [CheckName] = ?, [CheckPhone] = ?, [Notes] = ? WHERE [WatchId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="WatchId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WatchId" Type="Int32" />
                <asp:Parameter Name="WatchTime" Type="String" />
                <asp:Parameter Name="ControlName" Type="String" />
                <asp:Parameter Name="ControlPhone" Type="String" />
                <asp:Parameter Name="WatchName" Type="String" />
                <asp:Parameter Name="WatchPhone" Type="String" />
                <asp:Parameter Name="CheckName" Type="String" />
                <asp:Parameter Name="CheckPhone" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="WatchDate" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WatchTime" Type="String" />
                <asp:Parameter Name="ControlName" Type="String" />
                <asp:Parameter Name="ControlPhone" Type="String" />
                <asp:Parameter Name="WatchName" Type="String" />
                <asp:Parameter Name="WatchPhone" Type="String" />
                <asp:Parameter Name="CheckName" Type="String" />
                <asp:Parameter Name="CheckPhone" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                
                <asp:Parameter Name="WatchId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </asp:Panel>
        <h5  style="text-align:center"><a  href='http://lt.400ring.com/' target="viewer">进入400电话设置</a></h5>
<table style="width: 960px;" cellpadding="0" cellspacing="0"  class="alltable">
 <tr> 
  <td>企业名称</td>
  <td>山东风范电子科技有限公司</td>
  <td>用户名</td>
  <td>4000167679</td>
  <td>密码</td>
  <td>123</td>
 </tr> 
</table>

<h5 style="text-align:center">万网服务器信息</h5>
<table style="width: 960px;" cellpadding="0" cellspacing="0"  class="alltable">
 <tr> 
  <td>服务器IP</td>
  <td>223.4.145.87</td>
  <td>管理帐号</td>
  <td>whza012386adm</td>
  <td>管理密码</td>
  <td>jn667799</td>
 </tr> 
</table>
<h5 style="text-align:center">公司网络设置信息</h5>
<table style="width: 960px;" cellpadding="0" cellspacing="0"  class="alltable">
<tr> 
  <td>路由器用户名</td>
  <td>admin</td>
  <td>路由器密码 </td>
  <td>admin </td> 
  <td>路由器MTU:</td>
  <td>1480</td>
  <td>路由器无线登录密码</td>
  <td >66778899</td>
</tr> 
<tr> 
  <td>广电 I P</td>
  <td>60.233.81.134</td>
  <td>子网掩码</td>
  <td>255.255.255.128</td>
  <td> 默认网关</td>
  <td>60.233.81.129 </td>
  <td> DNS：</td>
  <td>210.77.192.88/211.94.33.193</td>
  
 </tr> 

 <tr>
 <td> 广电账号</td>
  <td>023096 </td>
  <td> 密码</td>
  <td>1390641</td>
  <td>服务器IP：</td>
  <td>10.7.1.9</td>
  <td> </td>
  <td> </td>
 </tr>
</table>
    </asp:Panel>
</asp:Content>

