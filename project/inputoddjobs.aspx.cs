using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class project_inputoddjobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string sqlstr = "INSERT INTO [ob_OddJobs] ([UnitName], [UseContact], [UseTel], [JobsContent], [Sender], [GoDate], [Worker], [RealContent], [EndDate], [GetMoney], [InvoiceState], [OddJobsDate], [UserId]) VALUES ('"
            + UnitName.Text.Trim() + "','"
            + UseContact.Text.Trim() + "','"
            + UseTel.Text.Trim() + "','"
            + JobsContent.Text.Trim() + "','"
            + Sender.Text.Trim() + "','"
            + GoDate.Text.Trim() + "','"
            + Worker.Text.Trim() + "','"
            + RealContent.Text.Trim() + "','"
            + EndDate.Text.Trim() + "','"
            + GetMoney.Text.Trim() + "','"
            + InvoiceState.Text.Trim() + "',getdate(),"
            + Session["userid"].ToString() + ")";
        SqlDataSource1.InsertCommand = sqlstr;
        if (SqlDataSource1.Insert() == 1)
        {
            Label1.Text = "提交成功！";
            Button1.Enabled = false;
        }
        else
        {
            Label1.Text = "提交失败！";
        }
    }
}