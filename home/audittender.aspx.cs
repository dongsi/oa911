using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_audittender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        SqlDataSource2.FilterExpression = "QualificationId=" + GridView1.SelectedDataKey.Value.ToString();
        DetailsView1.DataBind();
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        string updatestr = "UPDATE [ob_Qualification] SET [Operator] ='" + e.NewValues["Operator"].ToString() + "',";
        updatestr += "[Approver] ='" + e.NewValues["Approver"].ToString() + "',";
        updatestr += "[ChargeCase] ='" + e.NewValues["ChargeCase"].ToString() + "',";
        updatestr += "[ChargeLine] ='" + e.NewValues["ChargeLine"].ToString() + "',";
        updatestr += "[ChargeDate] ='" + e.NewValues["ChargeDate"].ToString() + "',";
        string notes;
        if (e.NewValues["QualificationNotes"] != null)
        {
            notes = e.NewValues["QualificationNotes"].ToString();
        }
        else
        {
            notes = " ";
        }
        updatestr += "[QualificationNotes] ='" + notes + "'";
        updatestr += "WHERE [QualificationId] =" + DetailsView1.SelectedValue.ToString();
        SqlDataSource2.UpdateCommand = updatestr;
        SqlDataSource2.Update();
        DetailsView1.DataBind();
    }
    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        string selectqualificationid;
        if (GridView1.SelectedDataKey != null)
        {
            selectqualificationid = GridView1.SelectedDataKey.Value.ToString();
        }
        else
        {
            selectqualificationid = DetailsView1.SelectedValue.ToString();
        }
        SqlDataSource2.FilterExpression = "QualificationId=" + selectqualificationid;
        DetailsView1.DataBind();
    }
    protected void DetailsView1_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        SqlDataSource2.DeleteCommand = "DELETE FROM [ob_Qualification] WHERE [QualificationId] = " + DetailsView1.SelectedValue.ToString();
        SqlDataSource2.Delete();
        DetailsView1.DataBind();
        GridView1.DataBind();
        Panel1.Visible = false;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[1].Text = indexID.ToString();
        }
    }
}