using System;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class attend_managerattendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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

                SqlCommand com = new SqlCommand("allcalculateattendance", sqlconn);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.Add(new SqlParameter("@begintime", SqlDbType.NVarChar, 20));
                com.Parameters["@begintime"].Value = begintime;
                com.Parameters.Add(new SqlParameter("@endtime", SqlDbType.NVarChar, 20));
                com.Parameters["@endtime"].Value = endtime;
                int lines = com.ExecuteNonQuery();

            }

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView1.PageIndex * this.GridView1.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
        }
    }
}