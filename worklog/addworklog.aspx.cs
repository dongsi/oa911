using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class worklog_addworklog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BSave_Click(object sender, EventArgs e)
    {
        string useridstr = Session["userid"].ToString();
        string departmentidstr = Session["departmentid"].ToString();

        string projectnamestr = ProjectName.Text.Trim();
        string projectmanagerstr = ProjectManager.Text.Trim();
        string associaterstr = Associater.Text.Trim();
        string workdatestr = "";
        string workcontentstr = WorkContent.Text.Trim();
       

        string nextplanstr = NextPlan.Text.Trim();

        string sqlstr = "INSERT INTO [ob_WorkLog] ([UserId], [DepartmentId], [ProjectName], [ProjectManager], [Associater], [WorkDate], [WorkContent], [NextPlan], [LogDate]) VALUES (";
        sqlstr += useridstr + ",";
        sqlstr += departmentidstr + ",'";
        sqlstr += projectnamestr + "','";
        sqlstr += projectmanagerstr + "','";
        sqlstr += associaterstr + "','";
        sqlstr += workdatestr + "','";
        sqlstr += workcontentstr + "','";
        sqlstr += nextplanstr + "',getdate())";

        SqlDataSource1.InsertCommand = sqlstr;
        SqlDataSource1.Insert();
        Label1.Text = "工作日志已经保存！";
        Label1.Visible = true;
        BSave.Enabled = false;
    }
}