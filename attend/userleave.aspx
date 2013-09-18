<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userleave.aspx.cs" Inherits="attend_userleave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
          <table align="center" class="alltable" width="100%">
            <tr>
                <td align="center" colspan="6" style="font-size:1.0em;font-weight:bold;">
                    <h4>山东风范电子科技有限公司员工请假审批表</h4></td>
            </tr>
  <tr>
    <td style="width:80px">请假期间</td>
     <td  >
                    <asp:TextBox ID="leaveDuration" runat="server"  Width="220px"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="leaveDuration" 
                        ValidationGroup="newleave">*</asp:RequiredFieldValidator>
                </td>
    <td style="width:80px">工作交接人</td>
     <td  >
                    <asp:TextBox ID="TransferPeople" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="TransferPeople" 
                        ValidationGroup="newleave">*</asp:RequiredFieldValidator>
                </td>
    <td style="width:80px">请假天数</td>
      <td  >
                   
                    <asp:TextBox ID="LeaveDays" runat="server" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="LeaveDays" 
                        ValidationGroup="newleave">*</asp:RequiredFieldValidator>
                </td>
  </tr>
  <tr>
    <td colspan="4">请假事由</td>
    <td colspan="2">交接内容</td>
  </tr>
  <tr>
     <td colspan="4" style="height: 140px" width="200px">
                    <asp:TextBox ID="LeaveContent" runat="server" Height="140px" TextMode="MultiLine" 
                        Width="320%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="LeaveContent" 
                        ValidationGroup="newLeave">*</asp:RequiredFieldValidator>
                </td>
    <td colspan="2">
        <asp:TextBox ID="TransferContent" runat="server" Height="140px" 
            TextMode="MultiLine" Width="98%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="TransferContent" 
                        ValidationGroup="newLeave">*</asp:RequiredFieldValidator>
      </td>
  </tr>
  <tr>
     <td colspan="6" style="height: 47px; color: #FF0000;">
                    备注：请假事由必须真实，否则，一经查实与实际不符，按旷工处理；请假期间填写为：几月几日至几月几日；请假人需将目前工作交接给其他人员，否则不予允许；

请假人需先由部门经理批准；然后，再经批准人批准方可准予休假。
                    <asp:Button ID="Bsave" runat="server" Text="提交请假申请" onclick="Bsave_Click" 
                        ValidationGroup="newleave" />
                </td>
  </tr>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT * FROM [ob_UserLeave] WHERE ([UserId] = ?) ORDER BY [LeaveDate] DESC">
    <SelectParameters>
        <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
    </SelectParameters>
        </asp:SqlDataSource>
    </div>
     <div align="center" style="overflow: auto">
     <hr />
         <asp:Panel ID="Panel1" runat="server">
             <asp:GridView ID="GridView1" runat="server" 
    DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                 Width="960px">
                 <Columns>
                     <asp:BoundField DataField="LeaveId" HeaderText="序号" InsertVisible="False" 
                         ReadOnly="True" SortExpression="LeaveId" />
                     <asp:BoundField DataField="LeaveContent" HeaderText="请假事由" 
                         SortExpression="LeaveContent" />
                     <asp:BoundField DataField="LeaveDays" HeaderText="请假天数" 
                         SortExpression="LeaveDays" />
                     <asp:BoundField DataField="LeaveDuration" HeaderText="请假期间" 
                         SortExpression="LeaveDuration" />
                     <asp:BoundField DataField="TransferPeople" HeaderText="工作交接人" 
                         SortExpression="TransferPeople" />
                     <asp:BoundField DataField="TransferContent" HeaderText="交接内容" />
                     <asp:BoundField DataField="DepartmentIdea" HeaderText="部门意见" 
                         SortExpression="DepartmentIdea" />
                     <asp:BoundField DataField="ApprovePeople" HeaderText="批准人" 
                         SortExpression="ApprovePeople" />
                     <asp:BoundField DataField="LeaveDate" HeaderText="请假时间" 
                         SortExpression="LeaveDate" />
                 </Columns>
             </asp:GridView>
         </asp:Panel>

    </div>
    

</asp:Content>

