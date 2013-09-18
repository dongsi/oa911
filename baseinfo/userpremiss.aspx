<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userpremiss.aspx.cs" Inherits="userpremiss" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            text-align: center;
            width: 519px;
        }
        .style2
        {
            height: 52px;
            width: 519px;
            text-align: left;
        }
        .style3
        {
            text-align: center;
            width: 213px;
        }
        .style4
        {
            height: 52px;
            width: 213px;
            text-align: left;
        }
        .style5
        {
            width: 213px;
            text-align: left;
        }
        .style6
        {
            text-align: center;
            width: 129px;
        }
        .style7
        {
            height: 52px;
            width: 129px;
            text-align: center;
        }
        .style8
        {
            width: 129px;
            text-align: left;
        }
        .style9
        {
            width: 519px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="950px">
    <p></p>
        <asp:Button ID="Button1" runat="server" Text="授权" onclick="Button1_Click" />
        <asp:Label ID="label22" runat ="server"    Visible="false"    ForeColor="Red" >
        </asp:Label>
        <asp:Label ID="label23" runat ="server"  Visible="false"   Text ="00000000000000000000000000000"  >
        </asp:Label>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>  
        
    <table style="border-style: solid; border-width: thin; width: 100%; margin-top: 5px;" 
        border="1px" cellpadding="0" cellspacing="0" frame="box">
        <tr>
            <td class="style6" style="width: 200px" rowspan="11">
                
                <asp:ListBox ID="ListBox1" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="UserSimpName" 
                    DataValueField="UserId" Height="311px" 
                    onselectedindexchanged="ListBox1_SelectedIndexChanged" Width="136px" 
                    AutoPostBack="True">
                </asp:ListBox>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                    ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                    
                    SelectCommand="SELECT [UserFullName], [UserId], [UserPremiss], [UserSimpName] FROM [ob_userinfo] where isDelete='0'">
                </asp:SqlDataSource>
            </td>
            <td class="style6" style="width: 200px">
                功能模块</td>
            <td class="style3" style="width: 400px">
                管理员模块</td>
            <td class="style1" style="width: 500px">
                &nbsp;通用子模块</td>
        </tr>
        <tr>
            <td class="style7">
                <asp:Label ID="Label3" runat="server" Text="基本资料"></asp:Label>
            </td>
            <td class="style4">
                
                <asp:CheckBox ID="CheckBox0" runat="server" Text="添加用户" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox1" runat="server" Text="管理用户" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox3" runat="server" Text="管理部门" AutoPostBack="True" />
                <br />
                <asp:CheckBox ID="CheckBox4" runat="server" Text="用户授权" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox7" runat="server" Text="编辑IP址" AutoPostBack="True" />
                
            </td>
            <td class="style2">
                
                <asp:CheckBox ID="CheckBox2" runat="server" Text="密码修改" AutoPostBack="True" />
                
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label4" runat="server" Text="考勤管理"></asp:Label>
            </td>
            <td class="style5">
               
                <asp:CheckBox ID="CheckBox8" runat="server" Text="正常考勤" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox9" runat="server" Text="请假考勤" AutoPostBack="True" />
                <br />
                <asp:CheckBox ID="CheckBox10" runat="server" Text="特殊考勤" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox11" runat="server" Text="查询考勤" AutoPostBack="True" />
               
            </td>
            <td class="style9">
                
                <asp:CheckBox ID="CheckBox34" runat="server" Text="请假申请" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox35" runat="server" Text="特殊情况" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox65" runat="server" Text="考勤考核"  AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label5" runat="server" Text="工作日志"></asp:Label>
            </td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox13" runat="server" Text="审核日志" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox14" runat="server" Text="导出日志" AutoPostBack="True" />
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox37" runat="server" Text="填写日志" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox38" runat="server" Text="查看日志" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label6" runat="server" Text="本周计划"></asp:Label>
            </td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox15" runat="server" Text="审核计划" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox16" runat="server" Text="导出计划" AutoPostBack="True" />
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox39" runat="server" Text="填写计划" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox40" runat="server" Text="查看计划" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                会议安排</td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox48" runat="server" Text="增加安排" />
		<asp:CheckBox ID="CheckBox51" runat="server" Text="会议纪要" />
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox49" runat="server" Text="查看安排" />
		<asp:CheckBox ID="CheckBox52" runat="server" Text="查看纪要" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label7" runat="server" Text="财务管理"></asp:Label>
            </td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox41" runat="server" AutoPostBack="True" Text="开票编辑" />
                <asp:CheckBox ID="CheckBox42" runat="server" AutoPostBack="True" Text="盖章编辑" />
                <asp:CheckBox ID="CheckBox43" runat="server" AutoPostBack="True" Text="票金编辑" />
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox17" runat="server" AutoPostBack="True" Text="开票登记" />
                <asp:CheckBox ID="CheckBox19" runat="server" AutoPostBack="True" Text="盖章登记" />
                <asp:CheckBox ID="CheckBox21" runat="server" AutoPostBack="True" Text="票金申请" />
                <asp:CheckBox ID="CheckBox18" runat="server" AutoPostBack="True" Text="开票查询" />
                <br />
                <asp:CheckBox ID="CheckBox20" runat="server" AutoPostBack="True" Text="盖章查询" />
                <asp:CheckBox ID="CheckBox22" runat="server" AutoPostBack="True" Text="票金查询" />
                <asp:CheckBox ID="CheckBox56" runat="server" AutoPostBack="True" Text="配置成本" />
                <br />
                <asp:CheckBox ID="CheckBox64" runat="server" AutoPostBack="True" Text="话费公示" />
                <asp:CheckBox ID="CheckBox63" runat="server" AutoPostBack="True" Text="话费登记" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label8" runat="server" Text="工程管理"></asp:Label>
            </td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox44" runat="server" Text="厂商编辑" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox46" runat="server" Text="零维编辑" AutoPostBack="True" />
                <br />
                <asp:CheckBox ID="CheckBox47" runat="server" Text="合同编辑" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox45" runat="server" Text="维修编辑" AutoPostBack="True" />
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox23" runat="server" Text="厂商登记" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox29" runat="server" Text="合同登记" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox27" runat="server" Text="零维登记" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox25" runat="server" Text="维修登记" AutoPostBack="True" />
                <br />
                <asp:CheckBox ID="CheckBox24" runat="server" Text="厂商查询" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox33" runat="server" Text="合同查询" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox28" runat="server" Text="零维查询" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox26" runat="server" Text="维修查询" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label9" runat="server" Text="项目报备"></asp:Label>
            </td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox5" runat="server" Text="添加用户" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox6" runat="server" Text="编辑用户" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox12" runat="server" Text="报备审批" AutoPostBack="True" />
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox36" runat="server" Text="报备查询" AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label10" runat="server" Text="日常办公"></asp:Label>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox30" runat="server" Text="常用文件" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox50" runat="server" Text="学习园地"  AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox53" runat="server" Text="常用格式" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox54" runat="server" Text="公司制度" AutoPostBack="True" /><br/>
                <asp:CheckBox ID="CheckBox61" runat="server" Text="资质证件" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox69" runat="server" Text="登记快递" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox62" runat="server" Text="查看快递" AutoPostBack="True" />
                <br/>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label11" runat="server" Text="报价文件"></asp:Label>
            </td>
            <td class="style5">
                &nbsp;
            </td>
            <td class="style9">
                <asp:CheckBox ID="CheckBox55" runat="server" Text="初步配置" />
                <asp:CheckBox ID="CheckBox57" runat="server" Text="报价草案" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox31" runat="server" Text="最终报价" AutoPostBack="True" />
                <asp:CheckBox ID="CheckBox58" runat="server" Text="下单采购" AutoPostBack="True" />
                <br />
                <asp:CheckBox ID="CheckBox59" runat="server" AutoPostBack="True" Text="采购合同" />
                <asp:CheckBox ID="CheckBox60" runat="server" AutoPostBack="True" Text="项目合同" />
                <asp:CheckBox ID="CheckBox67" runat="server" AutoPostBack="True" Text="文件草案" />
                <asp:CheckBox ID="CheckBox68" runat="server" AutoPostBack="True" Text="文件定稿" />
                <br />
                <asp:CheckBox ID="CheckBox66" runat="server" AutoPostBack="True" Text="外包报价" />
                 <asp:CheckBox ID="CheckBox70" runat="server" AutoPostBack="True" Text="开票结算" />
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style5">
                <asp:CheckBox ID="CheckBox32" runat="server" Text="400客服值班" 
                    AutoPostBack="True" />
            </td>
            
        </tr>
        
    </table>
    </ContentTemplate>
    </asp:UpdatePanel> 
    </asp:Panel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [os_MenuPremiss]"></asp:SqlDataSource>
</asp:Content>


