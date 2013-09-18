using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registrationExpress : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Bsave_Click(object sender, EventArgs e)
    {
        //SELECT * [courierTransceiverid] ,[Content],[Mailunit] ,[receiver],
        //[sender],[sendReceiveTime],[transceiverType],[userid],[submitTime],[note],[departmentId] 
        //FROM [u911110oa].[dbo].[ob_CourierTransceiver]
        string inssqlstr = "INSERT INTO [ob_CourierTransceiver]([UserId],[Content],[Mailunit],[receiver],"
            + " [sender],[sendReceiveTime],[transceiverType],[note],[departmentId] ,[submitTime]) values(";
        inssqlstr += Session["UserId"].ToString().Trim() + ",'";
        inssqlstr += Content.Text.Trim() + "','";
        inssqlstr += Mailunit.Text.Trim() + "','";
        inssqlstr += receiver.Text.Trim() + "','";
        inssqlstr += senders.Text.Trim() + "','";
        inssqlstr += sendReceiveTime.Text.Trim() + "','";
        inssqlstr += transceiverType.Text.Trim() + "','";
        inssqlstr += note.Text.Trim() + "','";
        inssqlstr += Session["departmentId"].ToString().Trim() + "',GETDATE())";
        SqlDataSource1.InsertCommand = inssqlstr;
        SqlDataSource1.Insert();
        Bsave.Enabled = false;
        label2.Text = "提交成功！";
        label2.Visible = true;
    }
}