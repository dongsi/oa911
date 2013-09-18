using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_approvcheque : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView6_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string updatesql = "UPDATE [ob_ChequeManager] SET [Approver] = '"
            + e.NewValues[0].ToString() + "',[ChequeNotes]='"
        + e.NewValues[1].ToString() + "' WHERE [ChequeId] = " + e.Keys[0].ToString();
        SqlDataSource6.UpdateCommand = updatesql;
        SqlDataSource6.Update();
        GridView6.DataBind();
    }
    protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }

    }
}