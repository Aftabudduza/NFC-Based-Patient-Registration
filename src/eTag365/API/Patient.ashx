<%@ WebHandler Language="C#" Class="eTag365.API.Contact" %>

using System.Web;
using System.Data;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using System.Net;
using eTagService.Enums;

namespace eTag365.API
{
    /// <summary>
    /// Summary description for contact
    /// </summary>
    public class Contact : IHttpHandler
    {
        private HttpContext context;
        private string JSN = "{\"status\": false, \"message\": \"Unknown Command\", \"Data\": [{}] }";
        private string strPref = "{\"status\": true, \"message\": \"Data retrieved successfully\", \"Data\":";
        private string strPosf = " }";
        private string json = "";

        public string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["NFCDB"].ConnectionString;

        private string jsonString = "";

        private System.Net.Mail.SmtpClient objSmtpClient;
        private System.Net.Mail.MailMessage objMailMessage;

        string strLoginID = System.Configuration.ConfigurationManager.AppSettings.Get("TLoginID");
        string strSecureKey = System.Configuration.ConfigurationManager.AppSettings.Get("TProcessingKey");
        string strFromKey = System.Configuration.ConfigurationManager.AppSettings.Get("TFromKey");



        public void ProcessRequest(HttpContext context)
        {
            context.Response.AppendHeader("Access-Control-Allow-Credentials", "true");
            context.Response.AppendHeader("Access-Control-Allow-Origin", "*");

            string sHashKey = Utility.md5Encode("SCS@2k22#");


            // Api for DB Query
            // https://etag365.net/API/Patient.ashx?datatype=get_user&p=8801817708660
            if (context.Request.Params["datatype"] == "get_user")
            {
                if (context.Request.Params["p"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string Phone = context.Request.Params["p"].ToString();
                    Phone = Regex.Replace(Phone, @"[^0-9]", "");

                    string sCountryCode = "";
                    string sCellNumber = "";

                    if (Phone.Length > 10)
                    {
                        sCellNumber = Phone.Substring(Phone.Length - 10);
                        sCountryCode = Phone.Substring(0, Phone.Length - 10);
                    }
                    else
                    {
                        sCellNumber = Phone;
                        sCountryCode = "1";
                    }

                    Phone = sCountryCode + sCellNumber;

                    string sSQL = "Select top 1 isnull(Id,0) Id,isnull(Email,'') Email,isnull(Phone,'') Phone,isnull(FirstName,'') FirstName,isnull(LastName,'') LastName,isnull(Title,'') Title,isnull(CompanyName,'') CompanyName,isnull(WorkPhone,'') WorkPhone,isnull(WorkPhoneExt,'') WorkPhoneExt,isnull(Address,'') Address,isnull(Address1,'') Address1,isnull(State,'') State,isnull(City,'') City,isnull(Region,'') Region,isnull(Zip,'') Zip,isnull(Other,'') Other,isnull(Website,'') Website,isnull(Category,'') Category,isnull(TypeOfContact,'') TypeOfContact, isnull(RefPhone,'') RefPhone, isnull(Fax,'') Fax, isnull(IsEmailFlow,0) IsEmailFlow from UserProfile where Phone =  '" + Phone + "'";
                    DataTable dtResult = SqlToTbl(sSQL);
                    if (dtResult != null && dtResult.Rows.Count > 0)
                    {
                        JSN = strPref + GetJson(dtResult) + strPosf;
                    }

                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"Oops - no information for this number at this time. If you know any information,  please enter it to help the next person who enters this number.\", \"Data\": [{}] }";
                    }

                }

                // end Api
            }


            //https://etag365.net/API/Patient.ashx?datatype=add_user_write&p=8801817708660&e=aftabudduza@gmail.com&Data=firstname:Aftab|Lastname:Udduza|Companyname:2RSolution|phone:8801817708660|email:aftabudduza@gmail.com

            else if (context.Request.Params["datatype"] == "add_user_write")
            {
                if (context.Request.Params["p"] == null || context.Request.Params["e"] == null || context.Request.Params["Data"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string sPhone = context.Request.Params["p"].ToString();
                    string sEmail = context.Request.Params["e"].ToString();

                    string sData = "";

                    if (context.Request.Params["Data"] != null)
                    {
                        sData = context.Request.Params["Data"].ToString();
                    }

                    sPhone = Regex.Replace(sPhone, @"[^0-9]", "");

                    string sCountryCode = "";
                    string sCellNumber = "";
                    if (sPhone.Length > 10)
                    {
                        sCellNumber = sPhone.Substring(sPhone.Length - 10);
                        sCountryCode = sPhone.Substring(0, sPhone.Length - 10);
                    }
                    else
                    {
                        sCellNumber = sPhone;
                        sCountryCode = "880";
                    }

                    sPhone = sCountryCode + sCellNumber;

                    string sSQL = "Select Id, isnull(IsSentMail,'0') IsSentMail, isnull(IsBillingComplete,'0') IsBillingComplete from UserProfile where Phone = '" + sPhone + "'";
                    DataTable dtResult = SqlToTbl(sSQL);
                    int nUserId = 0;
                    bool bSentMail = false;
                    bool bSentCode = false;
                    bool bSentMailToAdmin = false;

                    if (dtResult != null && dtResult.Rows.Count > 0)
                    {
                        nUserId = (dtResult.Rows[0]["Id"] != null && dtResult.Rows[0]["Id"] != DBNull.Value) ? Convert.ToInt32(dtResult.Rows[0]["Id"].ToString()) : 0;
                        bool bIsUpdate = UpdateUserWrite(nUserId.ToString(), sData);

                        bSentMailToAdmin = (dtResult.Rows[0]["IsBillingComplete"] != null && dtResult.Rows[0]["IsBillingComplete"] != DBNull.Value) ? Convert.ToBoolean(dtResult.Rows[0]["IsBillingComplete"].ToString()) : false;

                        if (bSentMailToAdmin == false)
                        {
                            if (SendEmail(sEmail, nUserId))
                            {
                                bSentMail = true;
                                if (SendEmailToAdmin(nUserId))
                                {
                                    string SQLMail = " update UserProfile set IsSentMail = '1'  where Id = " + nUserId;
                                    Utility.RunCMDMain(SQLMail);
                                }
                            }
                        }
                    }
                    else
                    {
                        if (sPhone.Length > 0)
                        {
                            nUserId = InsertUserWrite(sPhone, sData);
                        }

                        if (nUserId > 0)
                        {
                            string sMessage = "ePatient has created your very secure account. Enter this mobile number for Username and Password you want and fill out the rest of the form. Thank you.";
                            if (sendSMS(sPhone, sMessage))
                            {
                                bSentCode = true;
                            }

                            if (SendEmail(sEmail, nUserId))
                            {
                                bSentMail = true;

                                if (SendEmailToAdmin(nUserId))
                                {
                                    string SQLMail = " update UserProfile set IsSentMail = '1'  where Id = " + nUserId;
                                    Utility.RunCMDMain(SQLMail);
                                }
                            }
                        }

                    }

                    if (nUserId > 0)
                    {
                        jsonString = "[{\"UserId\":\"" + nUserId.ToString() + "\",";

                        if (bSentMail)
                        {
                            jsonString += "\"Email\":\"Sent\",";
                        }
                        if (bSentCode)
                        {
                            jsonString += "\"Code\":\"Sent\",";
                        }
                        jsonString += "\"Phone\":\"" + sPhone.ToString() + "\"";
                        jsonString += "}]";
                        JSN = strPref + jsonString + strPosf;
                    }
                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"User not Created\", \"Data\": [{}] }";
                    }

                }
            }
            // https://etag365.net/API/Patient.ashx?datatype=get_contact&fp=8801817708660&tp=8801817708661
            else if (context.Request.Params["datatype"] == "get_contact")
            {
                if (context.Request.Params["fp"] == null || context.Request.Params["tp"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string sFrom = context.Request.Params["fp"].ToString();
                    string sTo = context.Request.Params["tp"].ToString();

                    sFrom = Regex.Replace(sFrom, @"[^0-9]", "");
                    sTo = Regex.Replace(sTo, @"[^0-9]", "");

                    int nUserId = 0;

                    string sSQLN = "Select top 1 Id from UserProfile where Phone = '" + sFrom + "'";
                    DataTable dtResultN = SqlToTbl(sSQLN);

                    if (dtResultN != null && dtResultN.Rows.Count > 0)
                    {
                        nUserId = (dtResultN.Rows[0]["Id"] != null && dtResultN.Rows[0]["Id"] != DBNull.Value) ? Convert.ToInt32(dtResultN.Rows[0]["Id"].ToString()) : 0;
                    }

                    string sSQL = "Select isnull(Id,0) Id,isnull(Email,'') Email,isnull(Phone,'') Phone,isnull(FirstName,'') FirstName,isnull(LastName,'') LastName,isnull(Title,'') Title,isnull(CompanyName,'') CompanyName,isnull(WorkPhone,'') WorkPhone,isnull(WorkPhoneExt,'') WorkPhoneExt,isnull(Address,'') Address,isnull(Address1,'') Address1,isnull(State,'') State,isnull(City,'') City,isnull(Region,'') Region,isnull(Zip,'') Zip,isnull(Other,'') Other,isnull(Website,'') Website,isnull(Category,'') Category,isnull(TypeOfContact,'') TypeOfContact, isnull(RefPhone,'') RefPhone, isnull(Fax,'') Fax, isnull(Memo,'') Memo from ContactInformation where UserId = " + nUserId + "  and  Phone = '" + sTo + "'";
                    DataTable dtResult = SqlToTbl(sSQL);
                    if (dtResult != null && dtResult.Rows.Count > 0)
                    {
                        JSN = strPref + GetJson(dtResult) + strPosf;
                    }
                    // JSN = strPref + GetJson(sql) + strPosf;
                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"No ContactData\", \"Data\": [{}] }";
                    }

                }
            }
            //// https://etag365.net/API/Patient.ashx?datatype=get_contact_Id&id=1
            //else if (context.Request.Params["datatype"] == "get_contact_Id")
            //{
            //    if (context.Request.Params["id"] == null)
            //    {
            //        JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
            //    }

            //    else
            //    {
            //        string sSQL = "Select isnull(Id,0) Id,isnull(Email,'') Email,isnull(Phone,'') Phone,isnull(FirstName,'') FirstName,isnull(LastName,'') LastName,isnull(Title,'') Title,isnull(CompanyName,'') CompanyName,isnull(WorkPhone,'') WorkPhone,isnull(WorkPhoneExt,'') WorkPhoneExt,isnull(Address,'') Address,isnull(Address1,'') Address1,isnull(State,'') State,isnull(City,'') City,isnull(Region,'') Region,isnull(Zip,'') Zip,isnull(Other,'') Other,isnull(Website,'') Website,isnull(Category,'') Category,isnull(TypeOfContact,'') TypeOfContact, isnull(RefPhone,'') RefPhone, isnull(Fax,'') Fax from ContactInformation where Id = " + context.Request.Params["id"].ToString();
            //        DataTable dtResult = SqlToTbl(sSQL);
            //        if (dtResult != null && dtResult.Rows.Count > 0)
            //        {
            //            JSN = strPref + GetJson(dtResult) + strPosf;
            //        }

            //        else
            //        {
            //            JSN = "{\"status\": false, \"message\": \"No UserData\", \"Data\": [{}] }";
            //        }

            //    }
            //}
            //// https://etag365.net/API/Patient.ashx?datatype=get_contact_Phone&fp=8801817708660
            else if (context.Request.Params["datatype"] == "get_contact_Phone")
            {
                if (context.Request.Params["fp"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string sFrom = context.Request.Params["fp"].ToString();
                    sFrom = Regex.Replace(sFrom, @"[^0-9]", "");

                    string sCountryCode = "";
                    string sCellNumber = "";

                    if (sFrom.Length > 10)
                    {
                        sCellNumber = sFrom.Substring(sFrom.Length - 10);
                        sCountryCode = sFrom.Substring(0, sFrom.Length - 10);
                    }
                    else
                    {
                        sCellNumber = sFrom;
                        sCountryCode = "1";
                    }

                    sFrom = sCountryCode + sCellNumber;

                    int nUserId = 0;

                    string sSQLN = "Select top 1 Id from UserProfile where Phone = '" + sFrom + "'";

                    DataTable dtResultN = SqlToTbl(sSQLN);

                    if (dtResultN != null && dtResultN.Rows.Count > 0)
                    {
                        nUserId = (dtResultN.Rows[0]["Id"] != null && dtResultN.Rows[0]["Id"] != DBNull.Value) ? Convert.ToInt32(dtResultN.Rows[0]["Id"].ToString()) : 0;
                    }

                    string sSQL = "Select isnull(Id,0) Id,isnull(Email,'') Email,isnull(Phone,'') Phone,isnull(FirstName,'') FirstName,isnull(LastName,'') LastName,isnull(Title,'') Title,isnull(CompanyName,'') CompanyName,isnull(WorkPhone,'') WorkPhone,isnull(WorkPhoneExt,'') WorkPhoneExt,isnull(Address,'') Address,isnull(Address1,'') Address1,isnull(State,'') State,isnull(City,'') City,isnull(Region,'') Region,isnull(Zip,'') Zip,isnull(Other,'') Other,isnull(Website,'') Website,isnull(Category,'') Category,isnull(TypeOfContact,'') TypeOfContact, isnull(RefPhone,'') RefPhone, isnull(Fax,'') Fax from ContactInformation where UserId = " + nUserId;

                    DataTable dtResult = SqlToTbl(sSQL);
                    if (dtResult != null && dtResult.Rows.Count > 0)
                    {
                        JSN = strPref + GetJson(dtResult) + strPosf;
                    }

                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"No ContactData\", \"Data\": [{}] }";
                    }

                }
            }

            //// https://etag365.net/API/Patient.ashx?datatype=get_states
            else if (context.Request.Params["datatype"] == "get_states")
            {
                string sSQL = "select isnull(state,'') state, isnull(STATENAME,'') STATENAME from States order by STATENAME ";
                DataTable dtResult = SqlToTbl(sSQL);
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    JSN = strPref + GetJson(dtResult) + strPosf;
                }

                else
                {
                    JSN = "{\"status\": false, \"message\": \"No stateData\", \"Data\": [{}] }";
                }
            }
            //// https://etag365.net/API/Patient.ashx?datatype=get_categories
            else if (context.Request.Params["datatype"] == "get_categories")
            {

                string sSQL = "select  isnull(Description,'') Description from Child  where (Description is not null and Description <> '') and  UserDefinedId = '" + ((Int32)EnumBasicData.Category).ToString() + "' and (CreatedBy in (select Id from userprofile where isadmin = 1) or CreatedBy is null)  order by Description ";

                DataTable dtResult = SqlToTbl(sSQL);
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    JSN = strPref + GetJson(dtResult) + strPosf;
                }
                else
                {
                    JSN = "{\"status\": false, \"message\": \"No stateData\", \"Data\": [{}] }";
                }
            }
            //// https://etag365.net/API/Patient.ashx?datatype=get_contactTypes
            else if (context.Request.Params["datatype"] == "get_contactTypes")
            {
                string sSQL = "select  isnull(Description,'') Description from Child  where (Description is not null and Description <> '') and  UserDefinedId = '" + ((Int32)EnumBasicData.ContactType).ToString() + "' and (CreatedBy in (select Id from userprofile where isadmin = 1) or CreatedBy is null)  order by Description ";

                DataTable dtResult = SqlToTbl(sSQL);
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    JSN = strPref + GetJson(dtResult) + strPosf;
                }
                else
                {
                    JSN = "{\"status\": false, \"message\": \"No stateData\", \"Data\": [{}] }";
                }
            }
            // https://etag365.net/API/Patient.ashx?datatype=add_contact_read&shared=1&name=Aftab&fp=8801817708660&tp=8801817708661&Data=firstname:Aftab|Lastname:Udduza|Companyname:2RSolution|phone:8801817708661|email:aftab@2rsolution.com
            else if (context.Request.Params["datatype"] == "add_contact_read")
            {
                if (context.Request.Params["fp"] == null || context.Request.Params["tp"] == null || context.Request.Params["Data"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string sFrom = context.Request.Params["fp"].ToString();
                    string sTo = context.Request.Params["tp"].ToString();
                    string sData = context.Request.Params["Data"].ToString();


                    string sShare = "0";
                    string sFullName = "";

                    if (context.Request.Params["shared"] != null)
                    {
                        sShare = context.Request.Params["shared"].ToString();
                    }

                    if (context.Request.Params["name"] != null)
                    {
                        sFullName = context.Request.Params["name"].ToString();
                    }

                    sFrom = Regex.Replace(sFrom, @"[^0-9]", "");
                    sTo = Regex.Replace(sTo, @"[^0-9]", "");

                    string sCountryCode = "";
                    string sCellNumber = "";
                    if (sFrom.Length > 10)
                    {
                        sCellNumber = sFrom.Substring(sFrom.Length - 10);
                        sCountryCode = sFrom.Substring(0, sFrom.Length - 10);
                    }
                    else
                    {
                        sCellNumber = sFrom;
                        sCountryCode = "1";
                    }

                    sFrom = sCountryCode + sCellNumber;

                    string sSQL = "Select Id from UserProfile where Phone = '" + sFrom + "'";
                    DataTable dtResult = SqlToTbl(sSQL);
                    int nUserId = 0;
                    //  int nReferralAccountId = 0;
                    int nContactId = 0;

                    string sCountryCodeNew = "";
                    string sCellNumberNew = "";
                    if (sTo.Length > 10)
                    {
                        sCellNumberNew = sTo.Substring(sTo.Length - 10);
                        sCountryCodeNew = sTo.Substring(0, sTo.Length - 10);
                    }
                    else
                    {
                        sCellNumberNew = sTo;
                        sCountryCodeNew = "1";
                    }

                    sTo = sCountryCodeNew + sCellNumberNew;

                    //string sSQLN = "Select Id from UserProfile where Phone = '" + sTo + "'";
                    //DataTable dtResultN = SqlToTbl(sSQLN);
                    //int nToUserId = 0;

                    //if (dtResultN != null && dtResultN.Rows.Count > 0)
                    //{
                    //    nToUserId = (dtResultN.Rows[0]["Id"] != null && dtResultN.Rows[0]["Id"] != DBNull.Value) ? Convert.ToInt32(dtResultN.Rows[0]["Id"].ToString()) : 0;
                    //}

                    //string sSQLRef = "Select Id from ReferralAccount where GiverPhone = '" + sFrom + "' and GetterPhone = '" + sTo + "'";
                    //DataTable dtResultRef = SqlToTbl(sSQLRef);
                    //int nRefUserId = 0;

                    //if (dtResultRef != null && dtResultRef.Rows.Count > 0)
                    //{
                    //    nRefUserId = (dtResultRef.Rows[0]["Id"] != null && dtResultRef.Rows[0]["Id"] != DBNull.Value) ? Convert.ToInt32(dtResultRef.Rows[0]["Id"].ToString()) : 0;
                    //}

                    if (dtResult != null && dtResult.Rows.Count > 0)
                    {
                        nUserId = (dtResult.Rows[0]["Id"] != null && dtResult.Rows[0]["Id"] != DBNull.Value) ? Convert.ToInt32(dtResult.Rows[0]["Id"].ToString()) : 0;
                    }
                    else
                    {
                        if (sFrom.Length > 0 && sFullName.Length > 0)
                        {
                            nUserId = InsertUserWithPhoneAndName(sFrom, sFullName);
                        }


                        //if (sFrom.Length > 0 && nToUserId > 0 && nRefUserId <= 0)
                        //{
                        //    nReferralAccountId = InsertReferralUser(sFrom, sTo);
                        //}

                        if (nUserId > 0)
                        {
                            string sMessage = "NFC has created your very secure contact information manager account. Please complete your profile. Enter this mobile number for Username and Password you want and fill out the rest of the form. Thank you.";
                            if (sendSMS(sFrom, sMessage))
                            {

                            }

                            if (SendEmailToAdminOnly(nUserId))
                            {

                            }
                        }
                    }

                    if (nUserId > 0)
                    {
                        nContactId = InsertContact(nUserId.ToString(), sFrom, sTo, sData);
                    }

                    //if (sShare == "1")
                    //{
                    //    if (nToUserId > 0 && sFrom.Length > 0 && sFullName.Length > 0)
                    //    {
                    //        string sSQLContact = "Select Id from ContactInformation where UserId = '" + nToUserId + "' and Phone = '" + sFrom + "'";
                    //        DataTable dtResultContact = SqlToTbl(sSQLContact);
                    //        if (dtResultContact != null && dtResultContact.Rows.Count > 0)
                    //        {
                    //        }
                    //        else
                    //        {
                    //            sFullName = "firstname:" + sFullName;
                    //            int nShareContactId = InsertShareContact(nToUserId.ToString(), sTo, sFrom, sFullName);
                    //        }
                    //    }
                    //}

                    if (nContactId > 0)
                    {
                        jsonString = "[{\"ContactId\":\"" + nContactId.ToString() + "\",";
                        jsonString += "\"Phone\":\"" + sTo.ToString() + "\"";
                        jsonString += "}]";
                        JSN = strPref + jsonString + strPosf;
                    }
                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"Contact not Created\", \"Data\": [{}] }";
                    }

                }
            }
            // https://etag365.net/API/Patient.ashx?datatype=get_user_password&p=8801817708660
            else if (context.Request.Params["datatype"] == "get_user_password")
            {
                if (context.Request.Params["p"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string Phone = context.Request.Params["p"].ToString();
                    Phone = Regex.Replace(Phone, @"[^0-9]", "");

                    string sCountryCode = "";
                    string sCellNumber = "";

                    if (Phone.Length > 10)
                    {
                        sCellNumber = Phone.Substring(Phone.Length - 10);
                        sCountryCode = Phone.Substring(0, Phone.Length - 10);
                    }
                    else
                    {
                        sCellNumber = Phone;
                        sCountryCode = "1";
                    }

                    Phone = sCountryCode + sCellNumber;

                    string sSQL = "Select isnull(Password,'') Password from UserProfile where Phone =  '" + Phone + "'";
                    DataTable dtResult = SqlToTbl(sSQL);
                    if (dtResult != null && dtResult.Rows.Count > 0)
                    {
                        string sPassword = (dtResult.Rows[0]["Password"] != null && dtResult.Rows[0]["Password"] != DBNull.Value) ? Utility.base64Decode(dtResult.Rows[0]["Password"].ToString()) : "";

                        jsonString = "[{\"Password\":\"" + sPassword.ToString() + "\"}]";
                        JSN = strPref + jsonString + strPosf;
                    }

                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"No User Password\", \"Data\": [{}] }";
                    }

                }

                // end Api
            }
            //// https://etag365.net/API/Patient.ashx?datatype=get_version
            else if (context.Request.Params["datatype"] == "get_version")
            {
                string sSQL = " SELECT top 1  isnull(andVerCode,'') andVerCode,isnull(andVerLabel,'') andVerLabel,isnull(andMustUpdate, 'false') andMustUpdate,isnull(andVerNote,'') andVerNote,isnull(andLink,'') andLink,isnull(iOsVerCode,'') iOsVerCode,isnull(iOsVerLabel,'') iOsVerLabel,isnull(iOsMustUpdate,'') iOsMustUpdate,isnull(iOsLink,'') iOsLink,isnull(iOsVerNote,'') iOsVerNote FROM Version order by CreatedDate desc ";
                DataTable dtResult = SqlToTbl(sSQL);
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    JSN = "{\"version\": " + GetJson(dtResult) + " }";
                }

                else
                {
                    JSN = "{\"status\": false, \"message\": \"No versionData\", \"Data\": [{}] }";
                }
            }
            //// https://etag365.net/API/Patient.ashx?datatype=get_all_versions
            else if (context.Request.Params["datatype"] == "get_all_versions")
            {
                string sSQL = " SELECT isnull(andVerCode,'') andVerCode,isnull(andVerLabel,'') andVerLabel,isnull(andMustUpdate, 'false') andMustUpdate,isnull(andVerNote,'') andVerNote,isnull(andLink,'') andLink,isnull(iOsVerCode,'') iOsVerCode,isnull(iOsVerLabel,'') iOsVerLabel,isnull(iOsMustUpdate,'') iOsMustUpdate,isnull(iOsLink,'') iOsLink,isnull(iOsVerNote,'') iOsVerNote FROM Version order by CreatedDate desc ";
                DataTable dtResult = SqlToTbl(sSQL);
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    JSN = "{\"version\": " + GetJson(dtResult) + " }";
                }
                else
                {
                    JSN = "{\"status\": false, \"message\": \"No versionData\", \"Data\": [{}] }";
                }
            }
            // https://etag365.net/API/Patient.ashx?datatype=add_version&ios=0&Data=andVerCode:01|andVerLabel:1.0.1|andMustUpdate:1|andVerNote:Critical Bug Fixed. New Features Added.\n\nNote: Please Reinstall the App, if Update button doesn’t work properly.|andLink:https://etag365.net/|iOsVerCode:01|iOsVerLabel:1.0.1|iOsMustUpdate:1|iOsLink:https://etag365.net/|iOsVerNote:Brand New Version
            else if (context.Request.Params["datatype"] == "add_version")
            {
                if (context.Request.Params["Data"] == null || context.Request.Params["ios"] == null)
                {
                    JSN = "{\"status\": false, \"message\":  \"Please enter all mandatory parameters\",  \"Data\": [{}] }";
                }

                else
                {
                    string ios = context.Request.Params["ios"].ToString();
                    string sData = context.Request.Params["Data"].ToString();

                    int nId = 0;

                    nId = InsertVersionHistory(sData, ios);

                    if (nId > 0)
                    {
                        jsonString = "[{\"VersionId\":\"" + nId.ToString() + "\"";
                        jsonString += "}]";
                        JSN = strPref + jsonString + strPosf;
                    }
                    else
                    {
                        JSN = "{\"status\": false, \"message\": \"Version not Created\", \"Data\": [{}] }";
                    }

                }
            }

            //// https://etag365.net/API/Patient.ashx?datatype=get_countries
            else if (context.Request.Params["datatype"] == "get_countries")
            {
                string sSQL = "SELECT iso,nicename,iso3,phonecode FROM Country order by nicename ";
                DataTable dtResult = SqlToTbl(sSQL);
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    JSN = strPref + GetJson(dtResult) + strPosf;
                }

                else
                {
                    JSN = "{\"status\": false, \"message\": \"No countryData\", \"Data\": [{}] }";
                }
            }
            else
            {
                JSN = "{\"status\": false, \"message\": \"Unknown Command\", \"Data\": [{}] }";
                context.Response.ContentType = "text/json";
            }

            context.Response.ContentType = "text/json";
            context.Response.Write(JSN);
        }

        public string GetJson(DataTable dt)
        {
            // This Function will make json from Sql Query
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                    row.Add(col.ColumnName, dr[col]);
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        public DataTable SqlToTbl(string strSqlRec)
        {
            using (SqlDataAdapter Adp = new SqlDataAdapter())
            {
                using (SqlCommand selectCMD = new SqlCommand(strSqlRec, new SqlConnection(conStr)))
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



        public int InsertUserWithPhoneAndName(string phone, string name)
        {
            int M = 0;
            string sSerial = "";
            sSerial = GenerateSerialForUser("User", "Id");
            string sCountryCode = "";
            string sCellNumber = "";
            if (phone.Length > 10)
            {
                sCellNumber = phone.Substring(phone.Length - 10);
                sCountryCode = phone.Substring(0, phone.Length - 10);
            }
            else
            {
                sCellNumber = phone;
                sCountryCode = "1";
            }

            phone = sCountryCode + sCellNumber;

            string sPassword = Utility.base64Encode(phone);

            SqlConnection conn = new SqlConnection(conStr);
            conn.Open();

            try
            {
                var selectString = "INSERT INTO [UserProfile] (Phone,Username,Serial,IsAdmin,CanLogin,IsDeleted,IsActive,IsBillingComplete,IsNewUser,IsPhoneVerified,UserTypeContact,CreatedBy,CreatedDate, Password, FirstName, Country, CountryCode) VALUES (@Phone,@Username,@Serial,0,0,0,1,0,1,0,2,@CreatedBy,getdate(), @Password, @FirstName,'US', @CountryCode)";
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(selectString, conn);
                cmd.Parameters.Add("Phone", System.Data.SqlDbType.NVarChar).Value = phone;
                cmd.Parameters.Add("Username", System.Data.SqlDbType.NVarChar).Value = phone;
                cmd.Parameters.Add("CreatedBy", System.Data.SqlDbType.NVarChar).Value = phone;
                cmd.Parameters.Add("Serial", System.Data.SqlDbType.NVarChar).Value = sSerial;
                cmd.Parameters.Add("Password", System.Data.SqlDbType.NVarChar).Value = sPassword;
                cmd.Parameters.Add("FirstName", System.Data.SqlDbType.NVarChar).Value = name;
                cmd.Parameters.Add("CountryCode", System.Data.SqlDbType.NVarChar).Value = sCountryCode;
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                cmd.CommandText = "Select @@Identity";
                M = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                cmd.Dispose();

            }
            catch (Exception ex)
            {

            }

            conn.Close();

            return M;
        }

        public string GenerateSerialForUser(string ObjectID, string ItemID)
        {
            string sSerial = "";
            string sNumber = "";
            int nID = 0;
            SqlConnection conn = new SqlConnection(conStr);
            conn.Open();

            try
            {
                SqlCommand cmd = new SqlCommand("SP_GetID", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ObjectID", ObjectID);
                cmd.Parameters.AddWithValue("@ItemID", ItemID);
                cmd.Parameters.AddWithValue("@IDForYear", DateTime.Now.Year);
                cmd.Parameters.AddWithValue("@IDForMonth", null);
                cmd.Parameters.AddWithValue("@IDForDate", null);
                cmd.Parameters.Add("@NewID", SqlDbType.Int);
                cmd.Parameters["@NewID"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                nID = Convert.ToInt32(cmd.Parameters["@NewID"].Value);
                cmd.Dispose();
            }
            catch (Exception ex)
            {

            }

            if (nID <= 0)
            {
                nID = 1;
            }

            sNumber = nID.ToString().PadLeft(11, '0');
            sSerial = string.Concat("U", sNumber);


            conn.Close();

            return sSerial;

        }


        public int InsertReferralUser(string GiverPhone, string GetterPhone)
        {
            int M = 0;

            SqlConnection conn = new SqlConnection(conStr);
            conn.Open();

            try
            {
                var selectString = "INSERT INTO [ReferralAccount] (GiverPhone,GetterPhone,CreatedDate) VALUES (@GiverPhone,@GetterPhone,getdate())";
                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(selectString, conn);
                cmd.Parameters.Add("GiverPhone", System.Data.SqlDbType.NVarChar).Value = GiverPhone;
                cmd.Parameters.Add("GetterPhone", System.Data.SqlDbType.NVarChar).Value = GetterPhone;
                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
                cmd.CommandText = "Select @@Identity";
                M = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                cmd.Dispose();
            }
            catch (Exception ex)
            {

            }

            conn.Close();

            return M;
        }

        public int InsertUserWrite(string phone, string sData)
        {
            int M = 0;
            string sSerial = "";
            sSerial = GenerateSerialForUser("User", "Id");
            string sCountryCode = "";
            string sCellNumber = "";
            if (phone.Length > 10)
            {
                sCellNumber = phone.Substring(phone.Length - 10);
                sCountryCode = phone.Substring(0, phone.Length - 10);
            }
            else
            {
                sCellNumber = phone;
                sCountryCode = "880";
            }

            phone = sCountryCode + sCellNumber;

            // string sPassword = Utility.base64Encode(sCellNumber);

            string sPassword = Utility.base64Encode(phone);


            string sInit = "INSERT INTO UserProfile";
            string sParam = "Username,Phone,Serial,IsAdmin,CanLogin,IsDeleted,IsActive,IsBillingComplete,IsNewUser,IsPhoneVerified,UserTypeContact,CreatedBy,CreatedDate, Password, Country,CountryCode,";
            string sValue = "'" + phone + "','" + phone + "','" + sSerial + "',0,0,0,1,0,1,0,2,'" + phone + "',getdate(), '" + sPassword + "','BD', '" + sCountryCode + "',";
            string[] sDataArray = null;
            string sInsertSQL = "";

            if (sData.Length > 0)
            {
                sDataArray = sData.Split('|');
                foreach (string sCol in sDataArray)
                {
                    if (string.IsNullOrEmpty(sCol))
                    {
                        continue;
                    }
                    else
                    {
                        string tempEmail = sCol;
                        char ch = ':';
                        int idx = tempEmail.IndexOf(ch);
                        string paramname = tempEmail.Substring(0, idx);
                        string paramvalue = tempEmail.Substring(idx + 1);

                        if (paramname.ToUpper().ToString().Trim() != "PHONE")
                        {
                            if (paramname.ToUpper().ToString().Trim() == "ISEMAILFLOW")
                            {
                                sParam += "IsEmailFlow,";
                                sValue +=  paramvalue.ToString().Trim() + ",";

                                if (paramvalue.ToString().Trim() == "1")
                                {
                                    sParam += "EmailFlowCreatedOn,";
                                    sValue +=  "getdate(),";
                                }

                            }
                            else
                            {
                                sParam += paramname.ToString().Trim() + ",";
                                sValue += "'" + paramvalue.ToString().Trim() + "',";
                            }

                        }

                    }
                }

                sParam = sParam.Substring(0, sParam.Length - 1);

                sValue = sValue.Substring(0, sValue.Length - 1);

                sInsertSQL = sInit + "( " + sParam + " ) values ( " + sValue + " ) ";
            }

            if (sInsertSQL.Length > 0)
            {

                SqlConnection conn = new SqlConnection(conStr);
                conn.Open();

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sInsertSQL, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    cmd.CommandText = "Select @@Identity";
                    M = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    cmd.Dispose();
                    //  conn.Close();
                }
                catch (Exception ex)
                {
                    //  conn.Close();
                }

                conn.Close();
            }


            return M;
        }

        public bool UpdateUserWrite(string userId, string sData)
        {
            bool M = false;

            string sInit = "Update UserProfile Set IsOverwrite = 1, ";
            string sEnd = " where Id= '" + userId + "'";
            //string sParam = "";
            string sValue = "";
            string[] sDataArray = null;
            string sSQL = "";

            if (sData.Length > 0)
            {
                sDataArray = sData.Split('|');
                foreach (string sCol in sDataArray)
                {
                    if (string.IsNullOrEmpty(sCol))
                    {
                        continue;
                    }
                    else
                    {
                        string tempEmail = sCol;
                        char ch = ':';
                        int idx = tempEmail.IndexOf(ch);
                        string paramname = tempEmail.Substring(0, idx);
                        string paramvalue = tempEmail.Substring(idx + 1);

                        if (paramname.ToUpper().ToString().Trim() != "PHONE")
                        {
                            if (paramname.ToUpper().ToString().Trim() == "ISEMAILFLOW")
                            {
                                string sTempValue = " IsEmailFlow = " + paramvalue.ToString().Trim() + ",";
                                sValue += sTempValue;

                                if (paramvalue.ToString().Trim() == "1")
                                {
                                    string sTempValueDate = " EmailFlowCreatedOn = getdate(),";
                                    sValue += sTempValueDate;
                                }
                            }
                            else
                            {
                                string sTempValue = paramname.ToString().Trim() + " = '" + paramvalue.ToString().Trim() + "',";
                                sValue += sTempValue;
                            }

                        }

                        //   sParam += paramname + ",";
                        //  sValue += "'" + paramvalue + "',";
                    }
                }

                //    sParam = sParam.Substring(0, sParam.Length - 1);

                sValue = sValue.Substring(0, sValue.Length - 1);

                sSQL = sInit + sValue + sEnd;
            }

            if (sSQL.Length > 0)
            {

                SqlConnection conn = new SqlConnection(conStr);
                conn.Open();

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sSQL, conn);
                    cmd.ExecuteScalar();
                    cmd.Dispose();
                    M = true;
                    //  conn.Close();
                }
                catch (Exception ex)
                {
                    M = false;
                    //  conn.Close();
                }

            }


            return M;
        }

        public int InsertContact(string userId, string createdBy, string phone, string sData)
        {
            int M = 0;
            string sCountryCode = "";
            string sCellNumber = "";
            if (phone.Length > 10)
            {
                sCellNumber = phone.Substring(phone.Length - 10);
                sCountryCode = phone.Substring(0, phone.Length - 10);
            }
            else
            {
                sCellNumber = phone;
                sCountryCode = "1";
            }

            phone = sCountryCode + sCellNumber;

            string sInit = "INSERT INTO ContactInformation";
            string sParam = "UserId,IsDeleted,IsActive,CreatedBy,CreatedDate,Country,CountryCode,Phone,";
            string sValue = "'" + userId + "','0','1','" + createdBy + "',getdate(),'US', '" + sCountryCode + "', '" + phone + "',";
            string[] sDataArray = null;
            string sInsertSQL = "";
            string delSQL = " delete from ContactInformation  where UserId = '" + userId + "' and Phone = '" + phone + "'";
            string updateSQL = "";

            if (sData.Length > 0)
            {
                sDataArray = sData.Split('|');
                foreach (string sCol in sDataArray)
                {
                    if (string.IsNullOrEmpty(sCol))
                    {
                        continue;
                    }
                    else
                    {
                        string tempEmail = sCol;
                        char ch = ':';
                        int idx = tempEmail.IndexOf(ch);
                        string paramname = tempEmail.Substring(0, idx);
                        string paramvalue = tempEmail.Substring(idx + 1);

                        if (paramname.ToUpper().ToString().Trim() != "PHONE")
                        {
                            sParam += paramname.ToString().Trim() + ",";
                            sValue += "'" + paramvalue.ToString().Trim() + "',";
                        }


                        //if (paramname.ToUpper().ToString().Trim() != "PHONE" && paramname.ToUpper().ToString().Trim() != "ISEMAILFLOW")
                        //{
                        //    sParam += paramname.ToString().Trim() + ",";
                        //    sValue += "'" + paramvalue.ToString().Trim() + "',";
                        //}
                        //else if (paramname.ToUpper().ToString().Trim() == "ISEMAILFLOW")
                        //{
                        //    if (paramvalue.ToString().Trim() == "1")
                        //    {
                        //        updateSQL = " update  UserProfile set IsEmailFlow = 1, EmailFlowCreatedOn = getdate()  where Id = " + userId + " and (Email is not null and Email <> '')  and (IsEmailFlow is null or IsEmailFlow = 0) ";

                        //    }

                        //}

                        //sParam += paramname + ",";
                        //sValue += "'" + paramvalue + "',";
                    }
                }

                sParam = sParam.Substring(0, sParam.Length - 1);

                sValue = sValue.Substring(0, sValue.Length - 1);

                sInsertSQL = sInit + "( " + sParam + " ) values ( " + sValue + " ) ";
            }

            if (sInsertSQL.Length > 0)
            {

                SqlConnection conn = new SqlConnection(conStr);
                conn.Open();

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(delSQL, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                catch (Exception ex)
                {
                }

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(updateSQL, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                }
                catch (Exception ex)
                {
                }

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sInsertSQL, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    cmd.CommandText = "Select @@Identity";
                    M = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    cmd.Dispose();
                }
                catch (Exception ex)
                {

                }

                conn.Close();
            }


            return M;
        }

        public int InsertShareContact(string userId, string createdBy, string phone, string sData)
        {
            int M = 0;
            string sCountryCode = "";
            string sCellNumber = "";
            if (phone.Length > 10)
            {
                sCellNumber = phone.Substring(phone.Length - 10);
                sCountryCode = phone.Substring(0, phone.Length - 10);
            }
            else
            {
                sCellNumber = phone;
                sCountryCode = "1";
            }

            phone = sCountryCode + sCellNumber;

            string sInit = "INSERT INTO ContactInformation";
            string sParam = "UserId,IsDeleted,IsActive,CreatedBy,CreatedDate,Phone,TypeOfContact,Country,CountryCode,";
            string sValue = "'" + userId + "','0','1','" + createdBy + "',getdate(),'" + phone + "','Phone','US', '" + sCountryCode + "',";
            string[] sDataArray = null;
            string sInsertSQL = "";


            if (sData.Length > 0)
            {
                sDataArray = sData.Split('|');
                foreach (string sCol in sDataArray)
                {
                    if (string.IsNullOrEmpty(sCol))
                    {
                        continue;
                    }
                    else
                    {
                        string tempEmail = sCol;
                        char ch = ':';
                        int idx = tempEmail.IndexOf(ch);
                        string paramname = tempEmail.Substring(0, idx);
                        string paramvalue = tempEmail.Substring(idx + 1);

                        if (paramname.ToUpper().ToString().Trim() != "PHONE")
                        {
                            sParam += paramname.ToString().Trim() + ",";
                            sValue += "'" + paramvalue.ToString().Trim() + "',";
                        }
                    }
                }

                sParam = sParam.Substring(0, sParam.Length - 1);

                sValue = sValue.Substring(0, sValue.Length - 1);

                sInsertSQL = sInit + "( " + sParam + " ) values ( " + sValue + " ) ";
            }

            if (sInsertSQL.Length > 0)
            {

                SqlConnection conn = new SqlConnection(conStr);
                conn.Open();

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sInsertSQL, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    cmd.CommandText = "Select @@Identity";
                    M = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    cmd.Dispose();
                    //  conn.Close();
                }
                catch (Exception ex)
                {
                    //  conn.Close();
                }

                conn.Close();
            }


            return M;
        }

        public int InsertVersionHistory(string sData, string ios)
        {
            int M = 0;

            string sInit = "INSERT INTO Version";
            string sParam = "CreatedDate,";
            string sValue = "getdate(),";
            string[] sDataArray = null;
            string sInsertSQL = "";

            if (sData.Length > 0)
            {
                sDataArray = sData.Split('|');
                foreach (string sCol in sDataArray)
                {
                    if (string.IsNullOrEmpty(sCol))
                    {
                        continue;
                    }
                    else
                    {
                        string tempEmail = sCol;
                        char ch = ':';
                        int idx = tempEmail.IndexOf(ch);
                        string paramname = tempEmail.Substring(0, idx);
                        string paramvalue = tempEmail.Substring(idx + 1);

                        sParam += paramname.ToString().Trim() + ",";
                        sValue += "'" + paramvalue.ToString().Trim() + "',";
                    }
                }

                sParam = sParam.Substring(0, sParam.Length - 1);

                sValue = sValue.Substring(0, sValue.Length - 1);

                sInsertSQL = sInit + "( " + sParam + " ) values ( " + sValue + " ) ";
            }

            if (sInsertSQL.Length > 0)
            {

                SqlConnection conn = new SqlConnection(conStr);
                conn.Open();

                try
                {
                    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sInsertSQL, conn);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                    cmd.CommandText = "Select @@Identity";
                    M = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    cmd.Dispose();
                }
                catch (Exception ex)
                {
                }

                conn.Close();
            }


            return M;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public bool SendEmail(string sEmail, int nUserId)
        {
            bool IsSentSuccessful = false;
            try
            {
                string strMailServer = string.Empty;
                string strMailUser = string.Empty;
                string strMailPassword = string.Empty;
                string strMailPort = System.Configuration.ConfigurationManager.AppSettings.Get("strMailPort");
                string isMailLive = System.Configuration.ConfigurationManager.AppSettings.Get("isMailLive");

                strMailUser = System.Configuration.ConfigurationManager.AppSettings.Get("strMailUser");
                strMailPassword = System.Configuration.ConfigurationManager.AppSettings.Get("strMailPassword");
                strMailServer = System.Configuration.ConfigurationManager.AppSettings.Get("strMailServer");

                if (isMailLive == "true")
                {
                    objSmtpClient = new System.Net.Mail.SmtpClient(strMailServer, Convert.ToInt32(strMailPort));
                    objSmtpClient.UseDefaultCredentials = false;
                    objSmtpClient.Credentials = new System.Net.NetworkCredential(strMailUser, strMailPassword);
                }
                else
                {
                    objSmtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                    objSmtpClient.UseDefaultCredentials = false;
                    objSmtpClient.EnableSsl = true;
                    objSmtpClient.Credentials = new System.Net.NetworkCredential("adi.email.test@gmail.com", "adiadmin123");
                   
                }

                string from_address = "";
                string to_address = "";

                from_address = System.Configuration.ConfigurationManager.AppSettings.Get("fromAddress");

                try
                {
                    to_address = sEmail;
                }
                catch (Exception e)
                {
                    to_address = System.Configuration.ConfigurationManager.AppSettings.Get("toAddress");
                }


                objMailMessage = new System.Net.Mail.MailMessage();
                objMailMessage.From = new System.Net.Mail.MailAddress(from_address, "ePatient Support");
                objMailMessage.To.Add(new System.Net.Mail.MailAddress(to_address));
                objMailMessage.Subject = "New user Registration request from ePatient";
                objMailMessage.IsBodyHtml = true;
                objMailMessage.Body = this.EmailHtml(nUserId).ToString();
                objSmtpClient.Send(objMailMessage);

                IsSentSuccessful = true;

            }
            catch (Exception ex)
            {

            }

            finally
            {
                if ((objSmtpClient == null) == false)
                {
                    objSmtpClient = null;
                }

                if ((objMailMessage == null) == false)
                {
                    objMailMessage.Dispose();
                    objMailMessage = null;
                }
            }

            return IsSentSuccessful;
        }

        public System.Text.StringBuilder EmailHtml(int nUserId)
        {
            System.Text.StringBuilder emailbody = new System.Text.StringBuilder();
            string sWeb = System.Configuration.ConfigurationManager.AppSettings.Get("WebUrl");
            string sUrl = sWeb + "/login";
            string sSQL = " Select isnull(Email,'') Email,isnull(Phone,'') Phone,isnull(FirstName,'') FirstName,isnull(LastName,'') LastName,isnull(Password,'') Password,isnull(Title,'') Title,isnull(CompanyName,'') CompanyName,isnull(WorkPhone,'') WorkPhone,isnull(Address,'') Address,isnull(Address1,'') Address1,isnull(State,'') State,isnull(City,'') City,isnull(Region,'') Region,isnull(Zip,'') Zip, isnull(Fax,'') Fax, isnull(WorkPhoneExt,'') WorkPhoneExt  from UserProfile where Id = '" + nUserId.ToString() + "' ";
            string sPassword = "";
            DataTable dtResult = SqlToTbl(sSQL);
            try
            {
                emailbody.Append("<table>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><img  alt='' width='120' src='" + sWeb + "/Images/logo.jpg'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2' style='text-align:Left;font-size:14px;font-weight:bold;color:0000cc;'>Dear User</td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>ePatient has created your very secure contact information manager account. </p> </td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");

                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    sPassword = (dtResult.Rows[0]["Password"] != null && dtResult.Rows[0]["Password"] != DBNull.Value) ? dtResult.Rows[0]["Password"].ToString() : "";
                    sPassword = sPassword.Length > 0 ? Utility.base64Decode(sPassword) : "";

                    emailbody.Append("<tr><td>First Name: </td><td> " + ((dtResult.Rows[0]["FirstName"] != null && dtResult.Rows[0]["FirstName"] != DBNull.Value) ? dtResult.Rows[0]["FirstName"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Last Name: </td><td> " + ((dtResult.Rows[0]["LastName"] != null && dtResult.Rows[0]["LastName"] != DBNull.Value) ? dtResult.Rows[0]["LastName"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Email: </td><td> " + ((dtResult.Rows[0]["Email"] != null && dtResult.Rows[0]["Email"] != DBNull.Value) ? dtResult.Rows[0]["Email"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Mobile Number: </td><td> +" + ((dtResult.Rows[0]["Phone"] != null && dtResult.Rows[0]["Phone"] != DBNull.Value) ? dtResult.Rows[0]["Phone"].ToString() : "") + " </td></tr>");

                }

                emailbody.Append("<tr><td>Password: </td><td> " + sPassword + " </td></tr>");

                emailbody.Append("<tr><td>Date: </td><td> " + Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy hh:mm:ss tt") + " </td></tr>");

                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>Enter your mobile number for both the User name and Password. You will be prompted to change your password when you login. You can not change your User name.</p></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'>Best Regards</td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>ePatient Team</p> </td></tr>");
                emailbody.Append("</table>");
            }
            catch (Exception ex)
            {
            }


            return emailbody;
        }

        public bool SendEmailToAdmin(int nUserId)
        {
            bool IsSentSuccessful = false;
            try
            {
                string strMailServer = string.Empty;
                string strMailUser = string.Empty;
                string strMailPassword = string.Empty;
                string strMailPort = System.Configuration.ConfigurationManager.AppSettings.Get("strMailPort");
                string isMailLive = System.Configuration.ConfigurationManager.AppSettings.Get("isMailLive");

                strMailUser = System.Configuration.ConfigurationManager.AppSettings.Get("strMailUser");
                strMailPassword = System.Configuration.ConfigurationManager.AppSettings.Get("strMailPassword");
                strMailServer = System.Configuration.ConfigurationManager.AppSettings.Get("strMailServer");

                if (isMailLive == "true")
                {
                    objSmtpClient = new System.Net.Mail.SmtpClient(strMailServer, Convert.ToInt32(strMailPort));
                    objSmtpClient.UseDefaultCredentials = false;
                    objSmtpClient.Credentials = new System.Net.NetworkCredential(strMailUser, strMailPassword);
                }
                else
                {
                    objSmtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                    objSmtpClient.UseDefaultCredentials = false;
                    objSmtpClient.EnableSsl = true;
                    objSmtpClient.Credentials = new System.Net.NetworkCredential("info.visaformalaysia@gmail.com", "admin_321");
                }

                string from_address = "";
                string to_address = "";

                from_address = System.Configuration.ConfigurationManager.AppSettings.Get("fromAddress");


                try
                {
                    to_address = System.Configuration.ConfigurationManager.AppSettings.Get("toAddress");
                }
                catch (Exception e)
                {
                    to_address = "";
                }

                objMailMessage = new System.Net.Mail.MailMessage();
                objMailMessage.From = new System.Net.Mail.MailAddress(from_address, "ePatient Support");
                objMailMessage.To.Add(new System.Net.Mail.MailAddress(to_address));
                objMailMessage.Subject = "New user Registration request from ePatient";
                objMailMessage.IsBodyHtml = true;
                objMailMessage.Body = this.EmailHtmlToAdmin(nUserId).ToString();
                objSmtpClient.Send(objMailMessage);

                IsSentSuccessful = true;

            }
            catch (Exception ex)
            {

            }

            finally
            {
                if ((objSmtpClient == null) == false)
                {
                    objSmtpClient = null;
                }

                if ((objMailMessage == null) == false)
                {
                    objMailMessage.Dispose();
                    objMailMessage = null;
                }
            }

            return IsSentSuccessful;
        }

        public System.Text.StringBuilder EmailHtmlToAdmin(int nUserId)
        {
            System.Text.StringBuilder emailbody = new System.Text.StringBuilder();
            string sWeb = System.Configuration.ConfigurationManager.AppSettings.Get("WebUrl");
            string sUrl = sWeb + "/login";
            string sSQL = " Select isnull(Password,'') Password,isnull(Email,'') Email,isnull(Phone,'') Phone,isnull(FirstName,'') FirstName,isnull(LastName,'') LastName,isnull(Title,'') Title,isnull(CompanyName,'') CompanyName,isnull(WorkPhone,'') WorkPhone,isnull(Address,'') Address,isnull(Address1,'') Address1,isnull(State,'') State,isnull(City,'') City,isnull(Region,'') Region,isnull(Zip,'') Zip, isnull(Fax,'') Fax from UserProfile where Id = " + nUserId.ToString();

            DataTable dtResult = SqlToTbl(sSQL);
            try
            {
                emailbody.Append("<table>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><img  alt='' width='120' src='" + sWeb + "/Images/logo.jpg'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2' style='text-align:Left;font-size:14px;font-weight:bold;color:0000cc;'>Dear Admin</td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>ePatient has created a new user. </p> </td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");

                string sPassword = "";
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    sPassword = (dtResult.Rows[0]["Password"] != null && dtResult.Rows[0]["Password"] != DBNull.Value) ? dtResult.Rows[0]["Password"].ToString() : "";
                    sPassword = sPassword.Length > 0 ? Utility.base64Decode(sPassword) : "";

                    emailbody.Append("<tr><td>First Name: </td><td> " + ((dtResult.Rows[0]["FirstName"] != null && dtResult.Rows[0]["FirstName"] != DBNull.Value) ? dtResult.Rows[0]["FirstName"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Last Name: </td><td> " + ((dtResult.Rows[0]["LastName"] != null && dtResult.Rows[0]["LastName"] != DBNull.Value) ? dtResult.Rows[0]["LastName"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Email: </td><td> " + ((dtResult.Rows[0]["Email"] != null && dtResult.Rows[0]["Email"] != DBNull.Value) ? dtResult.Rows[0]["Email"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Mobile Number: </td><td> +" + ((dtResult.Rows[0]["Phone"] != null && dtResult.Rows[0]["Phone"] != DBNull.Value) ? dtResult.Rows[0]["Phone"].ToString() : "") + " </td></tr>");
                    emailbody.Append("<tr><td>Address: </td><td> " + ((dtResult.Rows[0]["Address"] != null && dtResult.Rows[0]["Address"] != DBNull.Value) ? dtResult.Rows[0]["Address"].ToString() : "") + " </td></tr>");

                }


              //  emailbody.Append("<tr><td>Password: </td><td> " + sPassword + " </td></tr>");
                emailbody.Append("<tr><td>Date: </td><td> " + Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy hh:mm:ss tt") + " </td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'>Best Regards</td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>ePatient Team</p> </td></tr>");
                emailbody.Append("</table>");
            }
            catch (Exception ex)
            {
            }
            return emailbody;
        }

        public bool SendEmailToAdminOnly(int nUserId)
        {
            bool IsSentSuccessful = false;
            try
            {
                string strMailServer = string.Empty;
                string strMailUser = string.Empty;
                string strMailPassword = string.Empty;
                string strMailPort = System.Configuration.ConfigurationManager.AppSettings.Get("strMailPort");
                string isMailLive = System.Configuration.ConfigurationManager.AppSettings.Get("isMailLive");

                strMailUser = System.Configuration.ConfigurationManager.AppSettings.Get("strMailUser");
                strMailPassword = System.Configuration.ConfigurationManager.AppSettings.Get("strMailPassword");
                strMailServer = System.Configuration.ConfigurationManager.AppSettings.Get("strMailServer");

                if (isMailLive == "true")
                {
                    objSmtpClient = new System.Net.Mail.SmtpClient(strMailServer, Convert.ToInt32(strMailPort));
                    objSmtpClient.UseDefaultCredentials = false;
                    objSmtpClient.Credentials = new System.Net.NetworkCredential(strMailUser, strMailPassword);
                }
                else
                {
                    objSmtpClient = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
                    objSmtpClient.UseDefaultCredentials = false;
                    objSmtpClient.EnableSsl = true;
                    objSmtpClient.Credentials = new System.Net.NetworkCredential("info.visaformalaysia@gmail.com", "admin_321");
                }

                string from_address = "";
                string to_address = "";

                from_address = System.Configuration.ConfigurationManager.AppSettings.Get("fromAddress");


                try
                {
                    to_address = System.Configuration.ConfigurationManager.AppSettings.Get("toAddress");
                }
                catch (Exception e)
                {
                    to_address = "";
                }

                objMailMessage = new System.Net.Mail.MailMessage();
                objMailMessage.From = new System.Net.Mail.MailAddress(from_address, "ePatient Support");
                objMailMessage.To.Add(new System.Net.Mail.MailAddress(to_address));
                objMailMessage.Subject = "New user Registration request from ePatient";
                objMailMessage.IsBodyHtml = true;
                objMailMessage.Body = this.EmailHtmlToAdminOnly(nUserId).ToString();
                objSmtpClient.Send(objMailMessage);

                IsSentSuccessful = true;

            }
            catch (Exception ex)
            {

            }

            finally
            {
                if ((objSmtpClient == null) == false)
                {
                    objSmtpClient = null;
                }

                if ((objMailMessage == null) == false)
                {
                    objMailMessage.Dispose();
                    objMailMessage = null;
                }
            }
            return IsSentSuccessful;

        }

        public System.Text.StringBuilder EmailHtmlToAdminOnly(int nUserId)
        {
            System.Text.StringBuilder emailbody = new System.Text.StringBuilder();
            string sWeb = System.Configuration.ConfigurationManager.AppSettings.Get("WebUrl");
            string sUrl = sWeb + "/login";
            string sSQL = " Select isnull(Password,'') Password,isnull(Phone,'') Phone  from UserProfile where Id = " + nUserId.ToString();
            DataTable dtResult = SqlToTbl(sSQL);
            try
            {
                emailbody.Append("<table>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><img  alt='' width='120' src='" + sWeb + "/Images/logo.jpg'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2' style='text-align:Left;font-size:14px;font-weight:bold;color:0000cc;'>Dear Admin</td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>ePatient has created a new user. </p> </td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                string sCell = "";
                string sPassword = "";
                if (dtResult != null && dtResult.Rows.Count > 0)
                {
                    sCell = (dtResult.Rows[0]["Phone"] != null && dtResult.Rows[0]["Phone"] != DBNull.Value) ? dtResult.Rows[0]["Phone"].ToString() : "";
                    sPassword = (dtResult.Rows[0]["Password"] != null && dtResult.Rows[0]["Password"] != DBNull.Value) ? dtResult.Rows[0]["Password"].ToString() : "";
                    sPassword = sPassword.Length > 0 ? Utility.base64Decode(sPassword) : "";
                }

                emailbody.Append("<tr><td>Mobile Number: </td><td> +" + sCell + " </td></tr>");

                emailbody.Append("<tr><td>Password: </td><td> " + sPassword + " </td></tr>");

                emailbody.Append("<tr><td>Transaction Date: </td><td> " + Convert.ToDateTime(DateTime.Now).ToString("MM/dd/yyyy hh:mm:ss tt") + " </td></tr>");

                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'>Best Regards</td></tr>");
                emailbody.Append("<tr><td colspan='2'></td></tr>");
                emailbody.Append("<tr><td colspan='2'><p>ePatient Team</p> </td></tr>");
                emailbody.Append("</table>");
            }
            catch (Exception ex)
            {
            }
            return emailbody;
        }




        public bool sendSMS(string strPhone, string strMessage)
        {
            string sWeb = System.Configuration.ConfigurationManager.AppSettings.Get("WebUrl");
            string sUrl = sWeb + "/login";

            bool bIsSend = false;
            try
            {
                //fields are required to be filled in:
                if (strPhone != "")
                {
                    strPhone = Regex.Replace(strPhone, @"[^0-9]", "");

                    if (strPhone.Length == 10)
                    {
                        strPhone = "+880" + strPhone;
                    }
                    else
                    {
                        strPhone = "+" + strPhone;
                    }

                    try
                    {
                        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                                                 | SecurityProtocolType.Tls11
                                                 | SecurityProtocolType.Tls12
                                                 | SecurityProtocolType.Ssl3;



                        var accountSid = strLoginID;
                        var authToken = strSecureKey;

                        TwilioClient.Init(accountSid, authToken);

                        var messageOptions = new CreateMessageOptions(
                            new PhoneNumber(strPhone));
                        messageOptions.From = new PhoneNumber(strFromKey);
                        //messageOptions.Body = "Registration successful.To login please go to " + sUrl;
                        messageOptions.Body = strMessage;
                        var message = MessageResource.Create(messageOptions);

                        bIsSend = true;


                    }
                    catch (Exception ex)
                    {
                        bIsSend = false;

                    }
                }

            }
            catch (Exception ex)
            {
                bIsSend = false;
            }

            return bIsSend;
        }


    }
}

