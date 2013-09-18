using System;
using System.Web.Security;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class baseinfo_changepassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ChangePasswordPushButton_Click2(object sender, EventArgs e)
    {
        string md5password = FormsAuthentication.HashPasswordForStoringInConfigFile(NewPassword.Text, "MD5");
        string oldpassword = FormsAuthentication.HashPasswordForStoringInConfigFile(CurrentPassword.Text, "MD5");
        if (oldpassword == (string)Session["currentpassword"])
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            string updatesqlstr = "update ob_userinfo set UserPassword='" + md5password + "' where UserId=" + Session["userid"];
            SqlCommand cmd = new SqlCommand(updatesqlstr, conn);
            try
            {
                conn.Open();
            }
            catch (System.Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                if (cmd.ExecuteNonQuery() > 0)
                {
                    conn.Close();
                    changepage();
                }
                else
                {
                    conn.Close();
                    Response.Write("<script>alert('由于未知原因密码没有修改成功！');history.back();</script>");
                }
            }
        }
        else
        {
            Response.Write("<script>alert('请输入正确的原密码！');history.back();</script>");
        }


    }
    protected void CancelPushButton_Click(object sender, EventArgs e)
    {
        changepage();
        
    }
    private void changepage()
    {
        //根据用户权限导航主页
        if ((bool)Session["Admin"])
        {
            Response.Redirect("~/home/AdminDefault.aspx");
        }
        else
        {
            Response.Redirect("~/home/userDefault.aspx");
        }
    }
}