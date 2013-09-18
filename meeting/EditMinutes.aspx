<%@ page title="" language="C#" masterpagefile="~/MasterPage.master" autoeventwireup="true" CodeFile="EditMinutes.aspx.cs"  inherits="meeting_EditMinutes" theme="baseSkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" Width="960px" HorizontalAlign="Center" ScrollBars="Auto">
    <center style="font-size:1.0em;font-weight:bold;">山东风范电子科技有限公司会议纪要（即会议记录）</center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" onrowdatabound="GridView1_RowDataBound" 
            DataKeyNames="minutesId" Width="960px" EnableModelValidation="True">
            <Columns>
                <asp:TemplateField HeaderText="删除" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;"  

Visible="<%# isDepartmentHeader() %>"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="编辑" ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="编辑" Visible="<%# isDepartmentHeader() %>"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序号">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="meetingDate" DataFormatString="{0:f}" 
                    HeaderText="会议时间" ReadOnly="True" SortExpression="meetingDate" />
              
                <asp:TemplateField HeaderText="会议地点" SortExpression="minutesPlace">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Height="200px"  Width="40px" 
                            Text='<%# Bind("minutesPlace") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("minutesPlace") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="55px" />
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="会议类型" SortExpression="minutesType">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Height="200px"  Width="40px" 
                            Text='<%# Bind("minutesType") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("minutesPlace") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="参会人员" SortExpression="attendPersonnel">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Height="200px" Width="40px" 
                            Text='<%# Bind("attendPersonnel") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("attendPersonnel") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="55px" />
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="会议内容" SortExpression="minutesContent">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Height="200px" 
                            Text='<%# Bind("minutesContent") %>' TextMode="MultiLine" Width="500px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("minutesContent") %>' 
                            Width="500px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="500px" />
                </asp:TemplateField>
                <asp:BoundField DataField="UserFullName" HeaderText="记录人" ReadOnly="True" 
                    SortExpression="UserFullName" />
                
                    <asp:TemplateField HeaderText="备注" SortExpression="remark">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Height="200px" 
                            Text='<%# Bind("remark") %>' TextMode="MultiLine" Width="80px"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("remark") %>' 
                            Width="100px"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM ob_Minutes WHERE (minutesId = ?)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT minutesTime, minutesPlace,minutesType,attendPersonnel,minutesContent, remark, UserFullName, meetingDate, minutesId FROM v_minutes 

ORDER BY meetingDate DESC"

            UpdateCommand="UPDATE ob_Minutes SET  minutesPlace = ?,minutesType= ?, attendPersonnel = ?, minutesContent = ?, remark = ?  WHERE (minutesId = ?)">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

