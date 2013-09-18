using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_approvedevicerepair : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = e.Row.RowIndex + 1;
            e.Row.Cells[1].Text = indexID.ToString();
        }
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlDataSource1.UpdateCommand = "UPDATE v_devicerepair SET Approver ='"
            + e.NewValues[0].ToString() + "' WHERE (DeviceId = " + e.Keys[0].ToString() + ")";
        SqlDataSource1.Update();
        GridView1.DataBind();
    }
}