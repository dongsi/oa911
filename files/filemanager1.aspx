<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="filemanager1.aspx.cs" Inherits="files_filemanager1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   

    <asp:Panel ID="Panel2" runat="server">
    
    <asp:FileUpload ID="FileUpload1" runat="server" Width="491px" />
    <asp:Label ID="Label4" runat="server" Text="下一步骤"></asp:Label>
     <asp:DropDownList  ID="nextStep"  Visible="False" runat="server"  
            Width ='80px' DataSourceID="SqlDataSource3"   DataTextField="ItemName"  DataValueField="ItemName" ></asp:DropDownList> 
     备注  <asp:TextBox ID="remark" runat="server"></asp:TextBox>
    <asp:Button ID="Upload" runat="Server" Text="上传" onclick="Upload_Click"  OnClientClick="return confirm('是否确定要上传？');" />
    <asp:Label ID="Label2" runat="Server"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT MenuId,ItemName,MenuTab FROM os_MenuPremiss where ParentMenuId= 75 AND MenuTab >4  ORDER BY MenuTab ASC" 
            >
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="type" />
            </SelectParameters>
          
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel1" runat="Server" Width="100%" HorizontalAlign="Center">
    <hr />
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" 
            AutoGenerateColumns="False" DataKeyNames="UploadFileId" Width="940px" 
            onrowdeleting="GridView1_RowDeleting" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" 
            onrowdatabound="GridView1_RowDataBound" PageSize="18">
            <Columns>
                <asp:TemplateField ShowHeader="False" HeaderText="删除" >
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" 
                            Text="&lt;div id=&quot;de&quot; onclick=&quot;JavaScript:return confirm('确定删除吗？')&quot;&gt;删除&lt;/div&gt;" 
                            Visible='<%# Session["admin"] %>'></asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序号" InsertVisible="False" 
                    SortExpression="UploadFileId">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("UploadFileId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="文件名">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocalFileName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "../UploadedImages/"+Eval("RemoteFileName") %>' Text='<%# Eval("LocalFileName") %>'></asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                 <asp:BoundField DataField="nextStep" HeaderText="下一步骤" ReadOnly="True" >
                 </asp:BoundField>
                <asp:BoundField DataField="UserFullName" HeaderText="上传人" ReadOnly="True" />
                  <asp:BoundField DataField="remark" HeaderText="备注" ReadOnly="True" >
                  </asp:BoundField>
 		        <asp:BoundField HeaderText="周数"  DataField="weekdays" Visible ="false"
			        SortExpression="weekdays"  ReadOnly="True" >
		        </asp:BoundField >
                <asp:BoundField DataField="UploadDate" HeaderText="上传时间" 
                    SortExpression="UploadDate" ReadOnly="True" >
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="RemoteFileName" HeaderText="服务器文件名" ReadOnly="True" 
                    Visible="False">
                <ItemStyle Width="115px" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#339966" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionStringGridView %>" 
            DeleteCommand="DELETE FROM [ob_UploadFile] WHERE [UploadFileId] = ?" 
            InsertCommand="INSERT INTO ob_UploadFile(UploadFileId, UploadUserId, LocalFileName, RemoteFileName, FileSize, UploadDate, Filetype,nextStep) VALUES (?, ?, ?, ?, ?, ?, ?,)" 
            ProviderName="<%$ ConnectionStrings:ConnectionStringGridView.ProviderName %>" 
            SelectCommand="SELECT  UploadFileId,LocalFileName,nextStep,remark,RemoteFileName,FileSize,UploadDate ,Filetype ,weekdays,UserFullName FROM v_uploadfile where (filetype=? ) ORDER BY UploadDate DESC" 
            
            
            UpdateCommand="UPDATE [ob_UploadFile] SET [UploadUserId] = ?, [LocalFileName] = ?, [RemoteFileName] = ?, [FileSize] = ?, [UploadDate] = ? WHERE [UploadFileId] = ?">
            <DeleteParameters>
                <asp:Parameter Name="UploadFileId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UploadFileId" Type="Int32" />
                <asp:Parameter Name="UploadUserId" Type="Int32" />
                <asp:Parameter Name="LocalFileName" Type="String" />
                <asp:Parameter Name="RemoteFileName" Type="String" />
                <asp:Parameter Name="FileSize" Type="Int32" />
                <asp:Parameter Name="UploadDate" Type="DateTime" />
                <asp:Parameter Name="nextStep" Type="String" />
                
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="type" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UploadUserId" Type="Int32" />
                <asp:Parameter Name="LocalFileName" Type="String" />
                <asp:Parameter Name="RemoteFileName" Type="String" />
                <asp:Parameter Name="FileSize" Type="Int32" />
                <asp:Parameter Name="UploadDate" Type="DateTime" />
                <asp:Parameter Name="UploadFileId" Type="Int32" />
                <asp:Parameter Name="nextStep" Type="String" />
                
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    
</asp:Content>

