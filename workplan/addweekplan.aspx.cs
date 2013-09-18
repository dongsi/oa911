using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class workplan_addweekplan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BSave_Click1(object sender, EventArgs e)
    {
        string useridstr = Session["UserId"].ToString();
        String departmentidstr = Session["DepartmentId"].ToString();
        string plandurationstr = PlanDuration.Text.Trim();
        string subitemheaderstr = Subitemheader.Text.Trim();
        string plancontentstr = PlanContent.Text.Trim();
        string notesstr = " ";
        if (Notes.Text.Trim().Length > 0)
        {
            notesstr = Notes.Text.Trim();
        }
        string sqlstr = "INSERT INTO [ob_WeekPlan] ([PlanDuration], [PlanContent], [Subitemheader], [DepartmentId], [UserId], [Notes], [Plandate]) VALUES ('"
            + plandurationstr + "','"
            + plancontentstr + "','"
            + subitemheaderstr + "',"
            + departmentidstr + ","
            + useridstr + ",'"
            + notesstr + "',getdate())";
        SqlDataSource1.InsertCommand = sqlstr;
        SqlDataSource1.Insert();

        BSave.Enabled = false;

    }
}