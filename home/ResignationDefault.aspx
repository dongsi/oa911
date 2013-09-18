<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ResignationDefault.aspx.cs" Inherits="home_ResignationDefault" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<p>欢迎使用OA办公系统，你今天考勤了吗？ </p>
    
    <asp:Panel ID="Panel2" runat="Server" Visible="False">
        <table  align="center" class="alltable">
            <tr >
                <td width="100px">
                      <asp:Label ID="Label1" runat="Server"></asp:Label>
                       <asp:Label ID="Label2" runat="Server"></asp:Label>
                </td>
            </tr>
           
        </table>
    </asp:Panel>
    </asp:Content>




