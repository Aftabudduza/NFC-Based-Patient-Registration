using eTagService.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TagService.BO;
using TagService.DA;

namespace eTag365.UserControls
{
    public partial class Menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sessionid = System.Web.HttpContext.Current.Session.SessionID;

                if (!string.IsNullOrEmpty(sessionid))
                {
                    int userid = Utility.IntegerData("SELECT TOP 1 UserId FROM UserLog_Data Where SessionId='" + sessionid + "' Order By LogId DESC");

                    if (userid > 0)
                    {
                        UserProfile objTemp = new UserProfileDA().GetUserByUserID(userid);
                        bool bIsAdmin = false;

                        if (objTemp != null)
                        {
                            bIsAdmin = (objTemp.IsAdmin != null && Convert.ToBoolean(objTemp.IsAdmin) == true) ? true : false;

                            if(objTemp.UserTypeContact != null)
                            {
                                if (objTemp.UserTypeContact == Convert.ToInt32(EnumUserType.Admin).ToString())
                                {
                                    liHeader.InnerHtml = "Role: Admin";
                                    lihome.InnerHtml = "<a href='" + Utility.WebUrl + "/home'><i class='fa fa-circle-o'></i>Dashboard </a>";
                                    liUser.InnerHtml = "<a href='" + Utility.WebUrl + "/users'><i class='fa fa-circle-o'></i>Add/Change Profile </a>";
                                    lireset.InnerHtml = "<a href='" + Utility.WebUrl + "/reset-password'><i class='fa fa-circle-o'></i>Reset Password </a>";
                                   

                                }
                                else if(objTemp.UserTypeContact == Convert.ToInt32(EnumUserType.Dealer).ToString())
                                {
                                    liHeader.InnerHtml = "Role: Dealer";
                                    lireset.InnerHtml = "<a href='" + Utility.WebUrl + "/reset-password'><i class='fa fa-circle-o'></i>Reset Password </a>";
                                }
                                else
                                {
                                    liHeader.InnerHtml = "Role: Patient";
                                    lihome.InnerHtml = "<a href='" + Utility.WebUrl + "/home'><i class='fa fa-circle-o'></i>Dashboard </a>";
                                    liUser.InnerHtml = "<a href='" + Utility.WebUrl + "/users'><i class='fa fa-circle-o'></i>Add/Change Profile </a>";
                                    lireset.InnerHtml = "<a href='" + Utility.WebUrl + "/reset-password'><i class='fa fa-circle-o'></i>Reset Password </a>";
                                   
                                }
                            }

                            if (bIsAdmin == true)
                            {
                                liUser.InnerHtml = "<a href='" + Utility.WebUrl + "/users'><i class='fa fa-circle-o'></i>Add/Change User Profile </a>";
                                                                 
                            }
                            
                        }
                       
                    }
                   
                }                      

            }
        }
    }
}