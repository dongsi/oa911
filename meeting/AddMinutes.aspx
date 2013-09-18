<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddMinutes.aspx.cs" Inherits="meeting_AddMinutes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" 
         Width="960px">
         <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司会议纪要（即会议记录）</center>
        <table style="width:100%;" class="alltable">
            <tr>
                <td>
                    会议地点</td>
                     <td width="25%">
                    <asp:TextBox ID="TBMinutesplace" runat="server" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TBMinutesplace" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="Red" ValidationGroup="newminutes">*</asp:RequiredFieldValidator>
                        </td>
                    <td >
                    参会人员</td>
                     <td width="25%">
                        <asp:TextBox ID="TBattendPersonnel" runat="server" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TBattendPersonnel" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="Red" ValidationGroup="newminutes">*</asp:RequiredFieldValidator>
                   
                    </td>
                    <td >
                    会议类型</td>
                     <td width="25%">
                        <asp:TextBox ID="TBminutesType" runat="server" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TBminutesType" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="Red" ValidationGroup="newminutes">*</asp:RequiredFieldValidator>
                   
                    </td>
                     
            </tr>
          
            <tr>
                <td colspan ='5'>
                    会议记录</td>
                     <td >
                    备注</td>
                     
            </tr>
            <tr>
                <td colspan ='5'>
                    <asp:TextBox ID="TBMinutesContent" runat="server" Height="350px" 
                        TextMode="MultiLine" Width="750px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TBMinutesContent" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newminutes">*</asp:RequiredFieldValidator>
                    </td>
                     <td >
                         <asp:TextBox ID="TBremark" runat="server" Height="350px" 
                        TextMode="MultiLine" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TBremark" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newminutes">*</asp:RequiredFieldValidator>
                    </td>
                    
            </tr>
            <tr>
                <td colspan='6'>
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="提交会议记录" 
                        ValidationGroup="newminutes" />
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" 
                    Visible="False"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                        DeleteCommand="DELETE FROM [ob_Minutes] WHERE [[minutesId] = ?" 
                        InsertCommand="INSERT INTO [ob_Minutes] ([minutesId] ,[minutesTime],[minutesPlace] ,

[attendPersonnel] ,[minutesType] ,[minutesContent],[remark],[userId],[meetingDate]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                        SelectCommand="SELECT * FROM [ob_Minutes]" 
                        UpdateCommand="UPDATE [ob_Minutes] SET [minutesTime]= ?,[minutesPlace] = ?, [attendPersonnel] = 

?,[minutesType]=?, [minutesContent] = ?, [remark] = ? , [userId] = ? ,[meetingDate] = ?, WHERE [minutesId] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="minutesId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="minutesId" Type="Int32" />
                            <asp:Parameter Name="minutesTime" Type="String" />
                            <asp:Parameter Name="minutesPlace" Type="String" />
                            <asp:Parameter Name="attendPersonnel" Type="String" />
                            <asp:Parameter Name="minutesType" Type="String" />
                            <asp:Parameter Name="minutesContent" Type="String" />
                            <asp:Parameter Name="remark" Type="String" />
                            <asp:Parameter Name="userId" Type="Int32" />
                            <asp:Parameter Name="meetingDate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="minutesTime" Type="String" />
                            <asp:Parameter Name="minutesPlace" Type="String" />
                            <asp:Parameter Name="attendPersonnel" Type="String" />
                            <asp:Parameter Name="minutesType" Type="String" />
                            <asp:Parameter Name="minutesContent" Type="String" />
                            <asp:Parameter Name="remark" Type="String" />
                            <asp:Parameter Name="userId" Type="Int32" />
                            <asp:Parameter Name="meetingDate" Type="DateTime" />
                            <asp:Parameter Name="minutesId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

