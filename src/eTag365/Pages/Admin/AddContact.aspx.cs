
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eTagService;
using eTagService.Enums;
using TagService.BO;
using TagService.DA;

namespace eTag365.Pages.Admin
{
    public partial class AddContact : System.Web.UI.Page
    {
        public String errStr = String.Empty;
        private Regex reEmail = new Regex("^(?:[0-9A-Z_-]+(?:\\.[0-9A-Z_-]+)*@[0-9A-Z-]+(?:\\.[0-9A-Z-]+)*(?:\\.[A-Z]{2,4}))$", RegexOptions.Compiled | RegexOptions.ExplicitCapture | RegexOptions.IgnoreCase);
        public string sUrl = string.Empty;

        #region Events      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["ContactId"] = null;
                Session["UserId"] = null;
                string sessionid = System.Web.HttpContext.Current.Session.SessionID;
                if (!string.IsNullOrEmpty(sessionid))
                {
                    int userid = Utility.IntegerData("SELECT TOP 1 UserId FROM UserLog_Data Where SessionId='" + sessionid + "' Order By LogId DESC");

                    if (userid > 0)
                    {
                        Session["UserId"] = userid;
                        FillDropdowns();
                        
                        int CId = 0;
                        try
                        {
                            CId = Convert.ToInt32(Request.QueryString["CId"].ToString());
                        }
                        catch(Exception ex)
                        {
                            CId = 0;
                        }
                        if (CId > 0)
                        {
                            lblHeadline.InnerText = "Edit Patient Info";
                            Session["ContactId"] = CId;
                            FillControls(CId);
                        }
                    }
                    else
                    {
                        Response.Redirect(Utility.WebUrl + "/login");
                    }
                }
                else
                {
                    Response.Redirect(Utility.WebUrl + "/login");
                }

            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            errStr = string.Empty;
            errStr = Validate_Control();
            if (errStr.Length <= 0)
            {
                try
                {
                    ContactInformation obj = new ContactInformation();
                    obj = SetData(obj);

                    if (Session["ContactId"] == null || Session["ContactId"] == "0")
                    {
                        if (new ContactInformationDA(true, false).Insert(obj))
                        {
                            Session["ContactId"] = null;
                            ClearControls();
                            Utility.DisplayMsgAndRedirect("Contact saved successfully!", this, Utility.WebUrl + "/home");
                        }
                        else
                        {
                            Utility.DisplayMsg("Contact not saved!", this);
                        }
                    }
                    else
                    {
                        if (new ContactInformationDA().Update(obj))
                        {
                            ClearControls();
                            Utility.DisplayMsgAndRedirect("Contact updated successfully!", this, Utility.WebUrl + "/home");
                        }
                        else
                        {
                            Utility.DisplayMsg("Contact not updated!", this);
                        }
                    }
                }
                catch (Exception ex1)
                {
                    Utility.DisplayMsg(ex1.Message.ToString(), this);
                }
            }
            else
            {
                Utility.DisplayMsg(errStr.ToString(), this);
            }
           
        }
        protected void btnClose_Click(object sender, EventArgs e)
        {
            ClearControls();          
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            ClearControls();
            Response.Redirect("/home");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Session["ContactId"] != null)
            {
                if (new ContactInformationDA().DeleteByID(Convert.ToInt32(Session["ContactId"])))
                {
                    ClearControls();
                    Utility.DisplayMsgAndRedirect("Contact deleted successfully!", this, Utility.WebUrl + "/home");
                }
            }
        }

        #endregion

        #region Method

        private void ClearControls()
        {

            txtContactName.Text = "";
            txtContactTitle.Text = "";
            txtEmail.Text = "";
            txtLastName.Text = "";
            txtAddress.Text = "";      
            txtWorkNumber.Text = "";         
            txtOther.Text = "";           
            btnSave.Text = "Update";
            lblHeadline.InnerText = "View / Change Information";
            
        }
        private void FillDropdowns()
        {
           
            List<Country> listCountry = null;
            listCountry = new CountryDA().GetAllRefCountries();

            try
            {
                ddlCountry.Items.Clear();
                ddlCountry.AppendDataBoundItems = true;
                ddlCountry.Items.Add(new ListItem("Select Country", "-1"));
                if (listCountry != null && listCountry.Count > 0)
                {
                    foreach (Country obj in listCountry)
                    {
                        ddlCountry.Items.Add(new ListItem(obj.nicename.ToString(), obj.iso.ToString()));
                    }

                    ddlCountry.DataBind();
                    ddlCountry.SelectedValue = "BD";
                }

            }
            catch (Exception ex)
            {

            }

            try
            {
                ddlCountryCode.Items.Clear();
                ddlCountryCode.AppendDataBoundItems = true;
                ddlCountryCode.Items.Add(new ListItem("Select Country Code", "-1"));
                if (listCountry != null && listCountry.Count > 0)
                {
                    foreach (Country obj in listCountry)
                    {
                        string name = obj.nicename + " (+" + obj.phonecode.ToString() + ")";
                        ddlCountryCode.Items.Add(new ListItem(name, obj.iso.ToString()));
                    }

                    ddlCountryCode.DataBind();
                    ddlCountryCode.SelectedValue = "BD";
                }

            }
            catch (Exception ex)
            {

            }

           
        }
        private ContactInformation SetData(ContactInformation obj)
        {
            try
            {
                obj = new ContactInformation();

                if (Session["ContactId"] != null && Convert.ToInt32(Session["ContactId"]) > 0)
                {
                    obj = new ContactInformationDA().GetbyID(Convert.ToInt32(Session["ContactId"]));
                    obj.Id = Convert.ToInt32(Session["ContactId"].ToString());
                }

                if (Session["UserId"] != null)
                {
                    obj.UserId = obj.UserId == null ? Session["UserId"].ToString() : obj.UserId;
                }

                if (!string.IsNullOrEmpty(txtContactName.Text.ToString()))
                {
                    obj.FirstName = txtContactName.Text.ToString();
                }
                else
                {
                    obj.FirstName = "";
                }

                if (!string.IsNullOrEmpty(txtLastName.Text.ToString()))
                {
                    obj.LastName = txtLastName.Text.ToString();
                }
                else
                {
                    obj.LastName = "";
                }


                if (!string.IsNullOrEmpty(txtContactTitle.Text.ToString()))
                {
                    obj.Title = txtContactTitle.Text.ToString();
                }
                else
                {
                    obj.Title = "";
                }

                if (!string.IsNullOrEmpty(ddlCompany.SelectedValue.ToString()))
                {
                    obj.CompanyName = ddlCompany.SelectedValue.ToString();
                }
                else
                {
                    obj.CompanyName = "";
                }
                string sCountryCode = "";

             

                if (ddlCountryCode.SelectedValue != "-1")
                {
                    Country objCountry = new CountryDA().GetByShortCode(ddlCountryCode.SelectedValue);
                    sCountryCode = objCountry != null ? objCountry.phonecode.ToString() : "";
                    obj.CountryCode = sCountryCode;
                    //  obj.CountryCode = ddlCountryCode.SelectedValue.Trim();
                    sCountryCode = obj.CountryCode;
                }

                if (string.IsNullOrEmpty(obj.CountryCode))
                {
                    sCountryCode = "880";
                    obj.CountryCode = "880";
                }

                if (!string.IsNullOrEmpty(txtNumber.Text.ToString()))
                {
                    string sPhone = Regex.Replace(txtNumber.Text.ToString().Trim(), @"[^0-9]", "");
                    sPhone = sCountryCode + sPhone;
                    obj.Phone = sPhone;
                }
                else
                {
                    obj.Phone = "";
                }

                if (!string.IsNullOrEmpty(txtEmail.Text.ToString()))
                {
                    obj.Email = txtEmail.Text.ToString().ToLower().Trim();
                }
                else
                {
                    obj.Email = "";
                }


                if (!string.IsNullOrEmpty(txtAddress.Text.ToString()))
                {
                    obj.Address = txtAddress.Text.ToString();
                }
                else
                {
                    obj.Address = "";
                }

               
                if (ddlCountry.SelectedValue != "-1")
                {
                    obj.Country = ddlCountry.SelectedValue.ToString();
                }
                else
                {
                    obj.Country = "BD";
                }

              

                if (!string.IsNullOrEmpty(txtWorkNumber.Text.ToString()))
                {
                    obj.WorkPhone = txtWorkNumber.Text.ToString();
                }
                else
                {
                    obj.WorkPhone = "";
                }

               

                if (!string.IsNullOrEmpty(txtOther.Text.ToString()))
                {
                    obj.Other = txtOther.Text.ToString();
                }
                else
                {
                    obj.Other = "";
                }
               
              

                if (Session["ContactId"] != null)
                {
                    obj.UpdatedDate = DateTime.Now;
                    if (Session["UserId"] != null)
                    {
                        UserProfile objTemp = new UserProfileDA().GetUserByUserID(Convert.ToInt32(Session["UserId"].ToString()));
                        if (objTemp != null)
                        {
                            obj.UpdatedBy = objTemp.Phone;
                        }
                       // obj.UpdatedBy = Session["UserId"].ToString();
                    }
                }
                else
                {
                    if (Session["UserId"] != null)
                    {
                        UserProfile objTemp = new UserProfileDA().GetUserByUserID(Convert.ToInt32(Session["UserId"].ToString()));
                        if (objTemp != null)
                        {
                            obj.CreatedBy = objTemp.Phone;
                        }
                       // obj.CreatedBy = Session["UserId"].ToString();
                    }

                    obj.CreatedDate = DateTime.Now;                  
                    obj.IsDeleted = false;
                    obj.IsActive = true;
                }

            }
            catch (Exception ex)
            {
            }           

            return obj;
        }
        private void FillControls(int nId)
        {
            try
            {
                if (nId > 0)
                {
                    ContactInformation obj = new ContactInformationDA().GetbyID(nId);
                    if (obj != null)
                    {
                        Session["ContactId"] = obj.Id;
                        if (obj.FirstName != null && obj.FirstName.ToString() != string.Empty)
                        {
                            txtContactName.Text = obj.FirstName;
                        }
                        else
                        {
                            txtContactName.Text = "";
                        }
                        if (obj.LastName != null && obj.LastName.ToString() != string.Empty)
                        {
                            txtLastName.Text = obj.LastName;
                        }
                        else
                        {
                            txtLastName.Text = "";
                        }
                        if (obj.Title != null && obj.Title.ToString() != string.Empty)
                        {
                            txtContactTitle.Text = obj.Title;
                        }
                        else
                        {
                            txtContactTitle.Text = "";
                        }
                        if (obj.CompanyName != null && obj.CompanyName.ToString() != string.Empty)
                        {
                            ddlCompany.SelectedValue = obj.CompanyName;
                        }
                        else
                        {
                            ddlCompany.SelectedValue = "";
                        }
                        if (obj.Address != null && obj.Address.ToString() != string.Empty)
                        {
                            txtAddress.Text = obj.Address;
                        }
                        else
                        {
                            txtAddress.Text = "";
                        }
                       
                        if (obj.Country != null && obj.Country.ToString() != string.Empty)
                        {
                            ddlCountry.SelectedValue = obj.Country.ToString();
                        }
                       

                        if (obj.Phone != null && obj.Phone.ToString() != string.Empty)
                        {
                            string sPhone = obj.Phone.ToString();
                            if (sPhone.Length >= 10)
                            {
                                sPhone = sPhone.Substring(sPhone.Length - 10);
                            }

                            txtNumber.Text = sPhone;
                            txtNumber.Enabled = false;
                        }
                        else
                        {
                            txtNumber.Text = "";
                        }

                        if (obj.Email != null && obj.Email.ToString() != string.Empty)
                        {
                            txtEmail.Text = obj.Email;
                            txtEmail.Enabled = false;
                        }
                        else
                        {
                            txtEmail.Text = "";
                        }


                        if (obj.WorkPhone != null && obj.WorkPhone.ToString() != string.Empty)
                        {
                            txtWorkNumber.Text = obj.WorkPhone;
                        }
                        else
                        {
                            txtWorkNumber.Text = "";
                        }
                       
                        if (obj.Other != null && obj.Other.ToString() != string.Empty)
                        {
                            txtOther.Text = obj.Other;
                        }
                        else
                        {
                            txtOther.Text = "";
                        }

                     

                        if (obj.Country != null && obj.Country.ToString() != string.Empty)
                        {
                            ddlCountryCode.SelectedValue = obj.Country;
                        }

                       

                        btnSave.Text = "Update";

                       
                    }
                }
            }
            catch(Exception ex)
            {

            }
        }

        public string Validate_Control()
        {
            try
            {
                if (txtContactName.Text.ToString().Length <= 0)
                {
                    errStr += "Please enter First Name" + Environment.NewLine;
                }
                if (txtLastName.Text.ToString().Length <= 0)
                {
                    errStr += "Please enter Last Name" + Environment.NewLine;
                }
               

                if (txtEmail.Text.ToString().Length <= 0)
                {
                    errStr += "Please enter email address" + Environment.NewLine;
                }
                else
                {
                    if (!ValidEmail(txtEmail.Text.ToString().Trim()))
                    {
                        errStr += "Invalid email address" + Environment.NewLine;
                    }
                }
                if (ddlCountryCode.SelectedValue == "-1")
                {
                    errStr += "Please select Country Code" + Environment.NewLine;
                }
                if (txtNumber.Text.ToString().Length <= 0)
                {
                    errStr += "Please enter Mobile Number" + Environment.NewLine;
                }
                else
                {
                    if (txtNumber.Text.ToString().Trim().Length < 10)
                    {
                        errStr += "Invalid Mobile Number" + Environment.NewLine;
                    }
                }

                if (Session["UserId"] != null)
                {
                    string sCountryCode = "";
                    string sPhone = "";
                    int nId = 0;

                    if (Session["ContactId"] != null)
                    {
                        nId = Convert.ToInt32(Session["ContactId"].ToString());
                    }

                 
                    if (ddlCountryCode.SelectedValue != "-1")
                    {
                        Country objCountry = new CountryDA().GetByShortCode(ddlCountryCode.SelectedValue);
                        sCountryCode = objCountry != null ? objCountry.phonecode.ToString() : "";
                    }

                    if (string.IsNullOrEmpty(sCountryCode))
                    {
                        sCountryCode = "1";
                    }

                    if (!string.IsNullOrEmpty(txtNumber.Text.ToString()))
                    {
                        sPhone = Regex.Replace(txtNumber.Text.ToString().Trim(), @"[^0-9]", "");
                        sPhone = sCountryCode + sPhone;                       
                    }
                   
                    string sSQLContact = "Select Id from ContactInformation where UserId = " + Session["UserId"].ToString() + "  and Phone = '" + sPhone + "' and Id <> " + nId;

                    DataTable dtResultContact = SqlToTbl(sSQLContact);

                    if (dtResultContact != null && dtResultContact.Rows.Count > 0)
                    {
                        errStr += "Mobile Number Already Exist for this user. Please enter another Mobile Number. " + Environment.NewLine;
                    }
                }
                

            }
            catch (Exception ex)
            {
            }

            return errStr;
        }
        public bool ValidEmail(string value)
        {
            if ((value == null))
                return false;
            return reEmail.IsMatch(value);
        }

        public static DataTable SqlToTbl(string strSqlRec)
        {
            using (SqlDataAdapter Adp = new SqlDataAdapter())
            {
                using (SqlCommand selectCMD = new SqlCommand(strSqlRec, new SqlConnection(ConfigurationManager.ConnectionStrings["NFCDB"].ConnectionString)))
                {
                    selectCMD.CommandTimeout = 3600;
                    Adp.SelectCommand = selectCMD;
                    using (DataTable Tbl = new DataTable())
                    {
                        Adp.Fill(Tbl);
                        return Tbl;
                    }
                }
            }
        }

        #endregion
    }
}