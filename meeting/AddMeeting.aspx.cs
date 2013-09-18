using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class meeting_AddMeeting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string strmeetingtime = TBmeetingTime.Text;
        string strmeetingcontent = TBMeetingContent.Text;
        string strdepartmentid = Session["departmentid"].ToString();
        string struserid = Session["userid"].ToString();
        string insertsql = "INSERT INTO [ob_Meeting] ([meetingTime], [meetingContent], [DepartmentId], [userId], [meetingDate]) VALUES ('"
            + strmeetingtime + "','" + strmeetingcontent + "'," + strdepartmentid + "," + struserid + ",getdate())";
        SqlDataSource3.InsertCommand = insertsql;
        try
        {
            SqlDataSource3.Insert();
        }
        catch (System.Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "')</script>");
        }
        finally
        {
            Label1.Text = "保存成功！";
            Label1.Visible = true;
            Button2.Enabled = false;
        }

    }
}