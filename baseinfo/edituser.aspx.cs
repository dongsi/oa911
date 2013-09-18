using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class baseinfo_edituser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Boolean editadmin = (Boolean)e.Values["Admin"];
        if (editadmin)
        {
            Response.Write("<script>alert('管理员账号不能删除！');history.back();</script>");
            e.Cancel = true;
        }
        else
        {
            SqlDataSource1.DeleteCommand = "update [ob_userinfo] set isDelete='1' WHERE [UserId] = " + GridView1.DataKeys[e.RowIndex].Values["UserId"].ToString().Trim();
            try
            {
                SqlDataSource1.Delete();
            }
            catch (System.Exception ex)
            {
                Response.Write("<script>alert('该用户已经使用，不能删除！" + ex.Message + "');history.back();</script>");
                e.Cancel = true;
            }
            finally 
            { 
               GridView1.DataBind(); 
            }

           
        }

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string usersimpnamestr = e.NewValues["UserSimpName"].ToString().Trim();
        string userfullnamestr = e.NewValues["UserFullName"].ToString().Trim();
        DropDownList ddl = (DropDownList)GridView1.Rows[e.RowIndex].Cells[0].FindControl("DropDownList1");
        string userdepartmentstr = ddl.SelectedValue.ToString().Trim();
        DropDownList ddrole = (DropDownList)GridView1.Rows[e.RowIndex].Cells[0].FindControl("DDuserrole");
        string userrolestr = ddrole.SelectedValue.ToString().Trim();
        string adminstr = "0";
        if ((Boolean)e.NewValues["Admin"])
        {
            adminstr = "1";
        }
        else
        {
            adminstr = "0";
        }
        string Resignationstr = "0";
        if ((Boolean)e.NewValues["Resignation"])
        {
            Resignationstr = "1";
        }
        else
        {
            Resignationstr = "0";
        }
        string useridstr = GridView1.DataKeys[e.RowIndex].Values["UserId"].ToString().Trim();

        SqlDataSource1.UpdateCommand = "UPDATE [ob_userinfo] SET [UserSimpName] = '" + usersimpnamestr
            + "', [UserFullName] = '" + userfullnamestr + "',[DepartmentId] =" + userdepartmentstr
            + ",[UserRole] = '" + userrolestr + "', [Admin] = " + adminstr + ", [Resignation] =" + Resignationstr + " WHERE [UserId] = " + useridstr;
        SqlDataSource1.Update();
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelUserName.Text = GridView1.SelectedRow.Cells[1].Text;
        Panel2.Visible = true;
    }
    protected void CancelPushButton_Click(object sender, EventArgs e)
    {
        Panel2.Visible = false;
    }
    protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
    {
        string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(NewPassword.Text, "MD5");
        SqlDataSource1.UpdateCommand = "UPDATE [ob_userinfo] SET UserPassword='" + md5password + "'WHERE [UserId] =" + GridView1.SelectedDataKey.Value.ToString().Trim();
        SqlDataSource1.Update();
        GridView1.DataBind();
        Panel2.Visible = false;
    }
}