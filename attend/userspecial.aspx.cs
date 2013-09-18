using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class attend_userspecial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bsave_Click(object sender, EventArgs e)
    {
        string specialcontentstr = SpecialContent.Text.Trim();
        string specialdurationstr = SpecialDuration.Text.Trim();

        string sqlstr = "INSERT INTO ob_SpecialAtt(UserId,SpecialContent,SpecialDuration,SpecialDate) VALUES(";
        sqlstr += Session["userid"].ToString().Trim() + ",'";
        sqlstr += specialcontentstr + "','";
        sqlstr += specialdurationstr + "',getdate())";

        SqlDataSource1.InsertCommand = sqlstr;
        SqlDataSource1.Insert();
        GridView1.DataBind();
        Bsave.Enabled = false;
    }
}