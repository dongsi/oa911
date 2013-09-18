<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="approvespecial.aspx.cs" Inherits="home_approvespecial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="960px">
    <center style="font-size:1.0em;font-weight:bold;" >山东风范电子科技有限公司特殊考勤申请审核</center>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
                ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
                SelectCommand="SELECT * FROM [v_special] WHERE ([ApprovePeople] IS NULL) ORDER BY [SpecialDate] DESC" 
                UpdateCommand="UPDATE v_special SET ApprovePeople = ? WHERE (SpecialAttId = ?)">
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="SpecialAttId" DataSourceID="SqlDataSource3" onrowupdating="GridView3_RowUpdating" 
                Width="960px" onrowdatabound="GridView3_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="序号" SortExpression="SpecialAttId">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SpecialAttId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="UserFullName" HeaderText="申请人" ReadOnly="True" 
                        SortExpression="UserFullName">
                    <ItemStyle Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SpecialContent" HeaderText="特殊原因" ReadOnly="True" 
                        SortExpression="SpecialContent">
                    <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SpecialDuration" HeaderText="时间段" ReadOnly="True" 
                        SortExpression="SpecialDuration">
                    <ItemStyle Width="180px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SpecialDate" HeaderText="填写时间" ReadOnly="True" 
                        SortExpression="SpecialDate" DataFormatString="{0:f}">
                    <ItemStyle Width="140px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ApproveIdea" HeaderText="意见" 
                        SortExpression="ApproveIdea" ItemStyle-Width="100px" >
                    <ControlStyle Width="100px" />
                    <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ApprovePeople" HeaderText="批准人" 
                        SortExpression="ApprovePeople" ItemStyle-Width="60px" >
                    <ControlStyle Width="60px" />
                    <ItemStyle Width="60px" />
                    </asp:BoundField>
                    <asp:CommandField ShowEditButton="True" HeaderText="编辑">
                    <ItemStyle Width="60px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" 
                        SortExpression="UserId" Visible="False" />
                </Columns>
            </asp:GridView>
    </asp:Panel>
</asp:Content>

