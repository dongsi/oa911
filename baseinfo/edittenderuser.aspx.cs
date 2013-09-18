using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class baseinfo_edittenderuser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SqlDataSource1.DeleteCommand = "DELETE FROM [ob_Tenderinfo] WHERE [TenderUserId] = " + GridView1.DataKeys[e.RowIndex].Values["TenderUserId"].ToString();
        try
        {
            SqlDataSource1.Delete();
        }
        catch (System.Exception ex)
        {
            Response.Write("<script>alert('该用户已经被使用，不能删除！" + ex.Message + "');history.back();</script>");
            e.Cancel = true;
        }

        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string userloginnamestr = e.NewValues["UserLoginName"].ToString();

        string tenderuseridstr = GridView1.DataKeys[e.RowIndex].Values["TenderUserId"].ToString();

        SqlDataSource1.UpdateCommand = "UPDATE [ob_Tenderinfo] SET [UserLoginName] = '" +
            userloginnamestr + "' WHERE [TenderUserId] = " + tenderuseridstr;
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
        SqlDataSource1.UpdateCommand = "UPDATE [ob_Tenderinfo] SET UserLoginPassword='" + md5password + "'WHERE [TenderUserId] =" + GridView1.SelectedDataKey.Value.ToString();
        SqlDataSource1.Update();
        GridView1.DataBind();
        Panel2.Visible = false;
    }
}