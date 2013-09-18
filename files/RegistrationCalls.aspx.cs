using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationCalls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bsave_Click(object sender, EventArgs e)
    {
        //SELECT TOP 1000 [callsId]，[FullName],[PhoneNumber],[DuringCalls],[ActualCalls],[ExcessCharges],[userid],[Remark]
        //      FROM [u911110oa].[dbo].[ob_CallsPublicity]
        string inssqlstr = "INSERT INTO [ob_CallsPublicity]([UserId],[FullName],[PhoneNumber],[DuringCalls],"
            + " [ActualCalls],[ExcessCharges],[Remark],[submitTime]) values(";
        inssqlstr += Session["UserId"].ToString().Trim() + ",'";
        inssqlstr += FullName.Text.Trim() + "','";
        inssqlstr += PhoneNumber.Text.Trim() + "','";
        inssqlstr += DuringCalls.Text.Trim() + "','";
        inssqlstr += ActualCalls.Text.Trim() + "','";
        inssqlstr += ExcessCharges.Text.Trim() + "','";
        inssqlstr += Remark.Text.Trim() + "',GETDATE())";
        SqlDataSource1.InsertCommand = inssqlstr;
        SqlDataSource1.Insert();
        Bsave.Enabled = false;
        label2.Text = "提交成功！";
        label2.Visible = true;
    }
}