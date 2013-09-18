using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_approveleave : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string approvestr = e.NewValues[0].ToString();
        string leaveidstr = e.Keys[0].ToString();
        SqlDataSource1.UpdateCommand = "UPDATE v_userleave SET ApprovePeople ='"
            + approvestr + "' WHERE LeaveId = " + leaveidstr;
        SqlDataSource1.Update();
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }
    }
}