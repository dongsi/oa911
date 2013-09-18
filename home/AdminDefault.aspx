<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="home_AdminDefault" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server"  style="text-align: center ;" >
     
        <br/>
	   <table width="100%">
      
       <tr  class="" > 
		<td>有<a href="approvestamp.aspx"><asp:Label ID="Lstamp" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的公章登记</td>
		<td> 有<a href="approvcheque.aspx"><asp:Label ID="Lcheque" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的支票申请
      </td>
		<td>  有<a href="approveleave.aspx"><asp:Label ID="Lleave" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的请假申请
       </td>
		<td> 有<a href="approvespecial.aspx"><asp:Label ID="Lspecial" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的特殊考勤
       </td>
	<td> 有<a href="approveoddjobs.aspx"><asp:Label ID="Loddjobs" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的零工维修
      </td>
		<td >  有<a href="approvedevicerepair.aspx"><asp:Label ID="Ldevicerepair" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的设备维修</td>
		<td > 有<a href="audittender.aspx"><asp:Label ID="Lqualification" runat="server" Text="0" ForeColor="#0000CC"></asp:Label></a>项待审批的项目报备 </td>
		 
        </tr>
        
	   </table>
      
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server">
    <h5 align='center'>山东风范电子科技有限公司售后服务400电话值班安排</h5>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="WatchId" DataSourceID="SqlDataSource4" Width="100%" 
            onrowdatabound="GridView3_RowDataBound">
            <Columns>
	<asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="WatchId">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="WatchId" HeaderText="WatchId" InsertVisible="False" 
                    ReadOnly="True" SortExpression="WatchId" Visible="False" />
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
                <asp:BoundField DataField="Notes" HeaderText="备注" SortExpression="Notes" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="WatchDate" HeaderText="WatchDate" 
                    SortExpression="WatchDate" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT top 2 * FROM [ob_Watch] ORDER BY [WatchDate] DESC">
        </asp:SqlDataSource>
    </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Width="960px" HorizontalAlign="Center" ScrollBars="Auto">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司会议纪要（即会议记录）</center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" 
            DataKeyNames="minutesId" Width="960px" EnableModelValidation="True">
            <Columns>
               
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:BoundField DataField="meetingDate" DataFormatString="{0:f}" 
                    HeaderText="会议时间" ReadOnly="True" SortExpression="meetingDate" Visible="false" >
                </asp:BoundField>
                <asp:BoundField  DataField ="minutesPlace" HeaderText="会议地点" SortExpression="minutesPlace">
                    
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                <asp:BoundField  DataField ="minutesType" HeaderText="会议类型" SortExpression="minutesType">
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                <asp:BoundField  DataField ="attendPersonnel" HeaderText="参会人员" SortExpression="attendPersonnel">
                    
                    <ItemStyle Width="55px" />
                </asp:BoundField>
                
                <asp:BoundField  DataField="minutesContent" HeaderText="会议内容" SortExpression="minutesContent">
                   
                    <ItemStyle Width="500px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserFullName" HeaderText="记录人" ReadOnly="True" 
                    SortExpression="UserFullName" />
                <asp:BoundField DataField="meetingDate" DataFormatString="{0:f}" 
                    HeaderText="会议时间" ReadOnly="True" SortExpression="meetingDate" />
                    <asp:BoundField DataField ="remark" HeaderText="备注" SortExpression="remark">
                   
                    <ItemStyle Width="100px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT top 6 * FROM v_minutes ORDER BY meetingDate DESC">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>