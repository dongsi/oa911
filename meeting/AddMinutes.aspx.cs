using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class meeting_AddMinutes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        string strminutesplace = TBMinutesplace.Text;
        string strattendpersonnel =TBattendPersonnel.Text;
        string strminutesType = TBminutesType.Text;
        string strminutescontent = TBMinutesContent.Text;
        string strremark = TBremark.Text;
        string struserid = Session["userid"].ToString();
        string insertsql = "INSERT INTO [ob_Minutes] ([minutesPlace],[attendPersonnel],[minutesType] ,[minutesContent],[remark],[userId], [meetingDate]) VALUES ('"
            + strminutesplace + "','" + strattendpersonnel + "','"  + strminutesType + "','" + strminutescontent + "','" + strremark + "'," + struserid + ",getdate())";
        SqlDataSource3.InsertCommand = insertsql;
        try
        {
            SqlDataSource3.Insert();
        }
        catch (System.Exception ex)
        {
            
            Label1.Text = ex.Message + "！";
            Label1.Visible = true;
        }
        finally
        {
            
            Label1.Text = "会议记录已提交成功！";
            Label1.Visible = true;
            Button2.Enabled = false;
        }

    }
}