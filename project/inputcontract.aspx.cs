using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class project_inputcontract : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string contractnotesstr;
        if (ContractNotes.Text.Trim().Length == 0)
        {
            contractnotesstr = " ";
        }
        else
        {
            contractnotesstr = ContractNotes.Text.Trim();
        }
        string inssql = "INSERT INTO [ob_ContractManager] ([UserId], [BuilderName], [ProjectName], [SignDate], [CheckDate], [LifeOfQuality], [DateOfQuality], [ContractPrice], [InvoicePrice], [InvoiceCom], [QualityPrice], [ContractNotes], [ContractDate]) VALUES ("
             + Session["userid"].ToString() + ",'"
             + BuilderName.Text.Trim() + "','"
             + ProjectName.Text.Trim() + "','"
             + SignDate.Text.Trim() + "','"
             + CheckDate.Text.Trim() + "','"
             + LifeOfQuality.Text.Trim() + "','"
             + DateOfQuality.Text.Trim() + "','"
             + ContractPrice.Text.Trim() + "','"
             + InvoicePrice.Text.Trim() + "','"
             + InvoiceCom.Text.Trim() + "','"
             + QualityPrice.Text.Trim() + "','"
             + contractnotesstr + "',getdate())";
        SqlDataSource1.InsertCommand = inssql;
        SqlDataSource1.Insert();
        Button1.Enabled = false;
        Label1.Text = "提交成功";
    }
}