using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class project_inputdevice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string newsql = "INSERT INTO [ob_DeviceRepair] ([DeviceName], [Brand], [UseUnit], [UseContact], [Usetel], [Repairor],"
                 + "[RepairDate], [RepairUnit], [RepairContact], [RepairTel], [RepairPrice], [ContractDate], [RepareedDate],"
                 + "[GetMoney], [invoiceState], [DeviceDate], [UserId]) VALUES ('"
                 + DeviceName.Text.Trim() + "','"
                 + Brand.Text.Trim() + "','"
                 + UseUnit.Text.Trim() + "','"
                 + UseContact.Text.Trim() + "','"
                 + Usetel.Text.Trim() + "','"
                 + Repairor.Text.Trim() + "','"
                 + RepairDate.Text.Trim() + "','"
                 + RepairUnit.Text.Trim() + "','"
                 + RepairContact.Text.Trim() + "','"
                 + RepairTel.Text.Trim() + "','"
                 + RepairPrice.Text.Trim() + "','"
                 + ContractDate.Text.Trim() + "','"
                 + RepareedDate.Text.Trim() + "','"
                 + GetMoney.Text.Trim() + "','"
                 + InvoiceState.Text.Trim() + "',getdate(),"
                 + Session["userid"] + ")";
        SqlDataSource1.InsertCommand = newsql;
        if (SqlDataSource1.Insert() == 1)
        {
            Label1.Text = "提交成功！";
            Button1.Enabled = false;
        }
        else
        {
            Label1.Text = "提交失败！";
        }


    }
}