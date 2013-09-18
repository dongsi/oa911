using System;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class attend_searchattend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string userid = DropDownList2.SelectedValue;
        string currmonth = DropDownList1.SelectedValue;
        string begintime = "";
        string endtime = "";
        string connstr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection sqlconn = new SqlConnection(connstr);
        using (sqlconn)
        {
            sqlconn.Open();
            SqlCommand timecom = new SqlCommand("select * from ob_time", sqlconn);
            SqlDataReader timereader = timecom.ExecuteReader();
            while (timereader.Read())
            {
                begintime = timereader.GetValue(1).ToString();
                endtime = timereader.GetValue(2).ToString();
            }
            timereader.Close();

            SqlCommand com = new SqlCommand("calculateattendance", sqlconn);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.Add(new SqlParameter("@curruserid", SqlDbType.Int));
            com.Parameters["@curruserid"].Value = userid;
            com.Parameters.Add(new SqlParameter("@currmonth", SqlDbType.NVarChar, 20));
            com.Parameters["@currmonth"].Value = currmonth;
            com.Parameters.Add(new SqlParameter("@begintime", SqlDbType.NVarChar, 20));
            com.Parameters["@begintime"].Value = begintime;
            com.Parameters.Add(new SqlParameter("@endtime", SqlDbType.NVarChar, 20));
            com.Parameters["@endtime"].Value = endtime;
            int lines = com.ExecuteNonQuery();

        }
        Response.Redirect("attendreport.aspx?currmonth=" + currmonth + "&curruserid=" + userid);
    }
    protected void DropDownList2_DataBound(object sender, EventArgs e)
    {
        ListItem allitem = new ListItem();
        allitem.Text = "全部";
        allitem.Value = "0";
        allitem.Selected = true;
        DropDownList2.Items.Add(allitem);
    }
}