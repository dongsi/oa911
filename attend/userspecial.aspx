<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userspecial.aspx.cs" Inherits="attend_userspecial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>

        <table align="center" class="alltable" style="width: 100%;">
            <tr>
                <td colspan="2" style="font-size:1.0em;font-weight:bold;">
                    <h4>山东风范电子科技有限公司特殊考勤登记表</h4></td>
            </tr>
            <tr>
                <td align="center">
                    特殊考勤原因</td>
                <td align="center">
                    时间段</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="SpecialContent" runat="server" Height="100px" 
                        TextMode="MultiLine" Width="700px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="RequiredFieldValidator" Text="*" 
                        ControlToValidate="SpecialContent" ValidationGroup="newspecial"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="SpecialDuration" runat="server" Height="100px" 
                        TextMode="MultiLine" Width="180px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="RequiredFieldValidator" Text="*" 
                        ControlToValidate="SpecialDuration" ValidationGroup="newspecial"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="color: #FF0000;">
                    备注：1、特殊考勤仅限于以下几种情况：出发；工地无法上网考勤；公司网站发生故障。2、本登记表不作为迟到、早退的理由填写；即便填写易将作为迟到、早退处

理。3、“时间段”为从几日几点到几日几点。
                    <asp:Button ID="Bsave" runat="server" Text="提交申请" 
                        ValidationGroup="newspecial" onclick="Bsave_Click" />
                </td>
            </tr>
        </table>

    </div>
    <hr />
<div align="center">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True" Width="100%">
        <Columns>
            <asp:BoundField DataField="SpecialAttId" HeaderText="序号" 
                SortExpression="SpecialAttId" />
            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                Visible="False" />
            <asp:BoundField DataField="SpecialContent" HeaderText="特殊考勤原因" 
                SortExpression="SpecialContent" />
            <asp:BoundField DataField="SpecialDuration" HeaderText="时间段" 
                SortExpression="SpecialDuration" />
            <asp:BoundField DataField="SpecialDate" HeaderText="提交时间" 
                SortExpression="SpecialDate" />
            <asp:BoundField DataField="ApproveIdea" HeaderText="意见" 
                SortExpression="ApproveIdea" />
            <asp:BoundField DataField="ApprovePeople" HeaderText="批准人" 
                SortExpression="ApprovePeople" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
        ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
        SelectCommand="SELECT * FROM [ob_SpecialAtt] WHERE ([UserId] = ?) ORDER BY [SpecialDate] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="UserId" SessionField="userid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</div>

</asp:Content>

