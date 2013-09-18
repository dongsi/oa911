using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class worklog_managerworklog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        
        SqlDataSource1.DeleteCommand = "DELETE [ob_WorkLog] WHERE [WorkLogId]=" + GridView1.DataKeys[e.RowIndex].Value.ToString();
        try
        {
            SqlDataSource1.Delete();
        }
        catch (System.Exception ex)
        {
            Response.Write("<script>alert('不能删除！" + ex.Message + "');history.back();</script>");
            e.Cancel = true;
        }
        GridView1.DataBind();
    }
   
   
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[2].Text = indexID.ToString();
        }
    }
}