using System;
using System.Collections.Generic;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Extensions;


public partial class home_AdminDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

      
        //读取未审核的各项数据并显示在首页
        if (!IsPostBack)
        {
            string fname;
            string connstr = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(connstr);
            using (sqlconn)
            {
                SqlCommand com = new SqlCommand("selectnull", sqlconn);
                com.CommandType = CommandType.StoredProcedure;
                sqlconn.Open();
                SqlDataReader sreader = com.ExecuteReader();
                do
                {
                    while (sreader.Read())
                    {
                        for (int i = 0; i < sreader.FieldCount; i++)
                        {
                            fname = sreader.GetName(i);
                            switch (fname)
                            {
                                case "stamp":
                                    Lstamp.Text = sreader.GetValue(i).ToString();
                                    break;
                                case "cheque":
                                    Lcheque.Text = sreader.GetValue(i).ToString();
                                    break;
                                case "special":
                                    Lspecial.Text = sreader.GetValue(i).ToString();
                                    break;
                                case "leave":
                                    Lleave.Text = sreader.GetValue(i).ToString();
                                    break;
                                case "oddjobs":
                                    Loddjobs.Text = sreader.GetValue(i).ToString();
                                    break;
                                case "devicerepair":
                                    Ldevicerepair.Text = sreader.GetValue(i).ToString();
                                    break;
                                case "qualification":
                                    Lqualification.Text = sreader.GetValue(i).ToString();
                                    break;
                            }

                        }
                    }

                } while (sreader.NextResult());
                sreader.Close();
              }

        }
    }

    protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int indexID = this.GridView3.PageIndex * this.GridView3.PageSize + e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = indexID.ToString();
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