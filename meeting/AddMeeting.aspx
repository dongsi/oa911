<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddMeeting.aspx.cs" Inherits="meeting_AddMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center" 
        Width="960px">
         <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司会议安排计划</center>
        <table style="width:100%;" class="alltable">
            <tr>
                <td>
                    会议时间及地点</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TBmeetingTime" runat="server" Width="900px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TBmeetingTime" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="Red" ValidationGroup="newmeeting">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    会议内容</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TBMeetingContent" runat="server" Height="350px" 
                        TextMode="MultiLine" Width="900px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TBMeetingContent" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="newmeetinng">*</asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="保存会议安排" 
                        ValidationGroup="newmeeting" />
                          <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label" 
                    Visible="False"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                        DeleteCommand="DELETE FROM [ob_Meeting] WHERE [meetingId] = ?" 
                        InsertCommand="INSERT INTO [ob_Meeting] ([meetingId], [meetingTime], [meetingContent], [DepartmentId], [userId], [meetingDate]) VALUES (?, ?, ?, ?, ?, ?)" 
                        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                        SelectCommand="SELECT * FROM [ob_Meeting]" 
                        UpdateCommand="UPDATE [ob_Meeting] SET [meetingTime] = ?, [meetingContent] = ?, [DepartmentId] = ?, [userId] = ?, [meetingDate] = ? WHERE [meetingId] = ?">
                        <DeleteParameters>
                            <asp:Parameter Name="meetingId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="meetingId" Type="Int32" />
                            <asp:Parameter Name="meetingTime" Type="String" />
                            <asp:Parameter Name="meetingContent" Type="String" />
                            <asp:Parameter Name="DepartmentId" Type="Int32" />
                            <asp:Parameter Name="userId" Type="Int32" />
                            <asp:Parameter Name="meetingDate" Type="DateTime" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="meetingTime" Type="String" />
                            <asp:Parameter Name="meetingContent" Type="String" />
                            <asp:Parameter Name="DepartmentId" Type="Int32" />
                            <asp:Parameter Name="userId" Type="Int32" />
                            <asp:Parameter Name="meetingDate" Type="DateTime" />
                            <asp:Parameter Name="meetingId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

