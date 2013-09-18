using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_approveoddjobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string approvestr = e.NewValues[0].ToString();
        string invoicestr = e.NewValues[1].ToString();
        string oddjobsidstr = e.Keys[0].ToString();

        SqlDataSource1.UpdateCommand = "UPDATE v_oddjobs SET Approver = '" + approvestr
            + "', InvoiceState = '" + invoicestr + "' WHERE (OddJobsId = " + oddjobsidstr + ")";
        SqlDataSource1.Update();
        GridView1.DataBind();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = e.Row.RowIndex + 1;
            e.Row.Cells[1].Text = indexID.ToString();
        }
    }
}