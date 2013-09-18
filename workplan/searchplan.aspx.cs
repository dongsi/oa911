using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class workplan_searchplan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bbegin_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        Session["BeginOrEnd"] = 1;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        switch (Session["BeginOrEnd"].ToString())
        {
            case "1":
                BeginDate.Text = Calendar1.SelectedDate.ToShortDateString();
                break;
            case "2":
                EndDate.Text = Calendar1.SelectedDate.ToShortDateString();
                break;
        }


        Calendar1.Visible = false;
    }
    protected void Bend_Click(object sender, EventArgs e)
    {
        Calendar1.Visible = true;
        Session["BeginOrEnd"] = 2;
    }
    protected void Bsearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("planreportview.aspx?date1=" + BeginDate.Text + " 00:00:00" + "&date2=" + EndDate.Text + " 23:59:59");
    }
}