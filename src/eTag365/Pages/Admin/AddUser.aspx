<%@ Page Title=" Create/Change Patient Profile" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddUser.aspx.cs" Inherits="eTag365.Pages.Admin.AddUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server" class="form-horizontal">
        <asp:ScriptManager runat="server" ID="sc2">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="upnlImageVideoUpld" runat="server">
            <ContentTemplate>
                <div class="box">
                    <div class="col-md-12">
                        <div class="box box-primary">
                            <div class="box-header with-border CommonHeader col-md-12">
                                <h3 class="box-title" id="lblHeadline" runat="server">Create/Change Patient Profile</h3>
                            </div>
                            <div>
                                <div class="box-body" style="display: none;">
                                    <div class="col-md-3" style="min-height: 150px; float: left;">
                                        <div class="col-sm-12" id="imgProfile">
                                            <asp:Image ID="imgProfileLogo" runat="server" Width="125px" />
                                        </div>
                                    </div>
                                    <div class="col-md-9" style="float: left;">
                                        <div class="col-sm-6">
                                            125x125
                                        </div>
                                        <div class="col-sm-6">
                                            Profile Picture
                                        </div>
                                        <br />
                                        <br />
                                        <br />
                                        <div class="col-sm-6">
                                            <input type="file" class="form-control" id="fileProfileImageUpload" />
                                        </div>
                                        <div class="col-sm-3 btnSubmitDiv">
                                            <input type="button" value="Upload" class="btn btn-successnew" id="btnUpload" />
                                        </div>
                                        <br />
                                        <div class="col-sm-12" style="margin-top: 40px; margin-bottom: 0px; text-align: left; float: left;">
                                            <asp:CheckBox ID="chkProfile" runat="server" Text="Do not use photograph to embed into your contact on other accounts contacts." />
                                        </div>
                                    </div>
                                    <div class="box-header with-border CommonHeader col-md-12" style="background-color: #8B9DC3;">
                                        <h3 class="box-title" id="H2" runat="server">&nbsp;</h3>
                                    </div>
                                </div>



                                <div class="box-body">
                                    <div class="col-md-6">
                                        <label for="txtNumber" class="col-sm-6 control-label">*ID:</label>
                                        <div class="col-sm-6">
                                            <asp:Label ID="lblSerial" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="col-sm-12">
                                            <asp:Label ID="lblMessage" ForeColor="Green" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="box-body">
                                    <div class="col-md-6">
                                        <label for="txtContactName" class="col-sm-6 control-label">*First Name:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtContactName" ClientIDMode="Static" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtContactName" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="First Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtLastname" class="col-sm-6 control-label">*Last Name:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ControlToValidate="txtLastName" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtContactTitle" class="col-sm-6 control-label">Age:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtContactTitle" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="col-sm-6 control-label">Blood Group:</label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlCompany" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="">Select Blood Group</asp:ListItem>
                                                <asp:ListItem Value="A+">A+</asp:ListItem>
                                                <asp:ListItem Value="B+">B+</asp:ListItem>
                                                <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                                <asp:ListItem Value="O+">O+</asp:ListItem>
                                                <asp:ListItem Value="A-">A-</asp:ListItem>
                                                <asp:ListItem Value="B-">B-</asp:ListItem>
                                                <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                                <asp:ListItem Value="O-">O-</asp:ListItem>
                                            </asp:DropDownList>
                                            <%-- <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                            <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtCompany" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Company Name Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtEmail" class="col-sm-6 control-label">*Email:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEmail" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Email Address Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="txtReEmail" class="col-sm-6 control-label">*Re-Enter Email:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtReEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtReEmail" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Re-Enter Email Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Invalid Re-Enter Email" ControlToValidate="txtReEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtReEmail" ForeColor="Red"
                                                ControlToCompare="txtEmail" Display="Dynamic" runat="server" ErrorMessage="Email Address Does Not Match"></asp:CompareValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="col-sm-6 control-label" id="Label1" runat="server">*Country Code:</label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlCountryCode" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCountryCode" InitialValue="-1" ErrorMessage="Please Select Country Code" ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ddlCountry" class="col-sm-6 control-label" style="float: left;">*Country:</label>
                                        <div class="col-sm-6">
                                            <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator Display="Dynamic" ID="countrytype" runat="server" ControlToValidate="ddlCountry" InitialValue="-1" ErrorMessage="Please select Country" ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="col-sm-6 control-label" id="lblPhone" runat="server">*Mobile Number:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtNumber" ValidationGroup="Contact"
                                                Display="Dynamic" runat="server" ErrorMessage="Cell Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator26" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Invalid Cell Number" ForeColor="Red" ControlToValidate="txtNumber" ValidationExpression="^(?=(?:\D*\d){10,18}\D*$)(?:\(?0?[0-9]{1,3}\)?|\+?[0-9]{1,3})[\s-]?(?:\(0?[0-9]{1,5}\)|[0-9]{1,5})[-\s]?[0-9][\d\s-]{5,7}\s?(?:x[\d-]{0,4})?(?:[-\s]?[0-9]{1,4}|[-\s])$"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <label for="txtWorkNumber" class="col-sm-6 control-label">Emergency Contact Number:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtWorkNumber" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Invalid Emergency Contact Number" ForeColor="Red" ControlToValidate="txtWorkNumber" ValidationExpression="^(?=(?:\D*\d){10,18}\D*$)(?:\(?0?[0-9]{1,3}\)?|\+?[0-9]{1,3})[\s-]?(?:\(0?[0-9]{1,5}\)|[0-9]{1,5})[-\s]?[0-9][\d\s-]{5,7}\s?(?:x[\d-]{0,4})?(?:[-\s]?[0-9]{1,4}|[-\s])$"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>

                                    



                                    <div class="col-md-6">
                                        <label for="txtAddress" class="col-sm-6 control-label">*Address:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtAddress" TextMode="MultiLine" Height="100" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ControlToValidate="txtAddress" ValidationGroup="Contact"
                                                runat="server" ErrorMessage="Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                  

                                </div>



                                <div class="box-body">
                                    <div class="col-md-12">
                                        <label for="txtOther" class="col-sm-3 control-label">Medical Records:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtOther" TextMode="MultiLine" Height="300" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="col-sm-6">
                                            <asp:CheckBox runat="server" Checked="false" ID="chkAdmin" Text="Is Admin" Style="float: left; padding-right: 13px;" />
                                        </div>
                                    </div>
                                     <div class="col-md-3">
                                        <div class="col-sm-6">
                                            <asp:CheckBox runat="server" Checked="true" ID="CanLogin" Text="Can Login" Style="float: left; padding-right: 13px;" />
                                        </div>
                                    </div>

                                </div>

                                <div class="box-header with-border CommonHeader col-md-12" style="background-color: #8B9DC3;">
                                    <h3 class="box-title" id="H1" runat="server">&nbsp;</h3>
                                </div>

                                <div class="box-body" style="margin-top: 0px; margin-bottom: 0px; text-align: center;">

                                    <div class="col-md-12" style="margin-top: 40px; margin-bottom: 0px; text-align: left;">
                                        <div class="col-sm-12">
                                            <asp:CheckBox ID="chkAgree" runat="server" ValidationGroup="Contact" Text="By checking this box I agree to all the terms and conditions within Terms and Conditions Agreement" />
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ValidationGroup="Contact" ErrorMessage="Please accept the terms and conditions" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                                        </div>
                                    </div>
                                </div>

                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <div class="col-md-12">
                                        <div class="col-md-4 btnSubmitDiv">
                                            <asp:Button ID="btnBack" runat="server" Text="Cancel" OnClick="btnBack_Click" CssClass="btn btn-success " />
                                        </div>

                                        <div class="col-md-4 btnSubmitDiv">
                                            <asp:Button ID="btnSave" runat="server" Text="Create / Update Profile" OnClientClick="CheckVal()" OnClick="btnSubmit_Click" CssClass="btn btn-success" ValidationGroup="Contact" />
                                        </div>
                                        <div class="col-md-4 btnSubmitDiv">
                                            <asp:Button ID="btnDeleteUser" runat="server" Text="Delete Profile" OnClientClick='return confirm("Are you sure you want to delete?");' OnClick="btnDeleteUser_Click" CssClass="btn btn-success " />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="col-sm-12">
                                            <asp:Label ID="lblMessageNew" ForeColor="Green" Font-Bold="true" Font-Size="Large" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function show_confirm() {
            var r = confirm("Are You Sure To Delete?");
            if (r) {
                return true;
            }
            else {
                return false;
            }
        }

        function CheckVal() {
            if (typeof (Page_ClientValidate) == 'function') {
                Page_ClientValidate();
            }
        }

    </script>
    <script type="text/javascript">
        var G_ImageName = "";
        //----- Web Page & Image -----//
        $("body").on("click", "#btnUpload", function () {
            if (document.getElementById("fileProfileImageUpload").value != "") {
                var file = document.getElementById('fileProfileImageUpload').files[0];
                G_ImageName = file.name;
                var fileName = document.getElementById("fileProfileImageUpload").value;
                var idxDot = fileName.lastIndexOf(".") + 1;
                var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == 'gif' || extFile == 'tiff') {

                    var reader = new FileReader();
                    reader.readAsDataURL(file);
                    reader.onload = UpdateFiles;
                } else {
                    alert("Only .gif, .jpg, .png, .tiff and .jpeg are allowed!");
                    $("#fileProfileImageUpload").val("");
                }
            }
            else {
                alert('Please select Profile Picture');
            }
        });

        function UpdateFiles(evt) {
            var currentPagePath = "https://etag365.net/epatient/Pages/Admin/AddUser.aspx" + "/";
            //var pagePath = window.location.pathname + "/uploadprofilepicture";
            var pagePath = currentPagePath + "uploadprofilepicture";

            var result = evt.target.result;
            var fileName = document.getElementById("fileProfileImageUpload").value;
            var idxDot = fileName.lastIndexOf(".") + 1;
            var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();

            var ImageSave = "";
            if (extFile == "jpg" || extFile == "jpeg") {
                ImageSave = result.replace("data:image/jpeg;base64,", "");
            }
            else if (extFile == "png") {
                ImageSave = result.replace("data:image/png;base64,", "");
            }
            else if (extFile == "gif") {
                ImageSave = result.replace("data:image/gif;base64,", "");
            }
            else if (extFile == "tiff") {
                ImageSave = result.replace("data:image/tiff;base64,", "");
            }


            if (G_ImageName === "undefined" || G_ImageName === "") {
                $("#fileProfileImageUpload").css({ 'border': '1px solid red' });
            } else {
                $.ajax({
                    type: "POST",
                    url: pagePath,
                    data: "{ 'Image':'" + ImageSave + "' , 'ImageName':'" + G_ImageName + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    error:
                        function (XMLHttpRequest, textStatus, errorThrown) {
                            alert("Profile Picture Upload failed");
                            G_ImageName = "";
                        },
                    success:
                        function (result) {
                            G_ImageName = "";

                            if (result.d == '') {
                                alert("Profile Picture Upload Failed !!");
                            } else {
                                var content = "";
                                var url = result.d;
                                content += "<a href='" + url + "' target='_blank'><img alt='" + url + "' width='125px' src= '" + url + "' /></a>";

                                $("#imgProfile").empty();
                                $("#imgProfile").append(content);
                                alert("Profile Picture Uploaded Successfully !!");

                            }
                        }

                });
            }
        }

        //$("body").on("click", "#btnUploadCompany", function () {
        //    if (document.getElementById("fileCompanyImageUpload").value != "") {
        //        var file = document.getElementById('fileCompanyImageUpload').files[0];
        //        G_ImageName = file.name;
        //        var fileName = document.getElementById("fileCompanyImageUpload").value;
        //        var idxDot = fileName.lastIndexOf(".") + 1;
        //        var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
        //        if (extFile == "jpg" || extFile == "jpeg" || extFile == "png" || extFile == 'gif' || extFile == 'tiff') {

        //            var reader = new FileReader();
        //            reader.readAsDataURL(file);
        //            reader.onload = UpdateFilesCompany;
        //        } else {
        //            alert("Only .gif, .jpg, .png, .tiff and .jpeg are allowed!");
        //            $("#fileCompanyImageUpload").val("");
        //        }
        //    }
        //    else {
        //        alert('Please select Company Logo');
        //    }
        //});

        //function UpdateFilesCompany(evt) {
        //    var currentPagePath = "/Pages/Admin/AddUser.aspx" + "/";
        //    var pagePath = currentPagePath + "uploadcompanypicture";
        //    //var pagePath = window.location.pathname + "/uploadcompanypicture";

        //    var result = evt.target.result;
        //    var fileName = document.getElementById("fileCompanyImageUpload").value;
        //    var idxDot = fileName.lastIndexOf(".") + 1;
        //    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();

        //    var ImageSave = "";
        //    if (extFile == "jpg" || extFile == "jpeg") {
        //        ImageSave = result.replace("data:image/jpeg;base64,", "");
        //    }
        //    else if (extFile == "png") {
        //        ImageSave = result.replace("data:image/png;base64,", "");
        //    }
        //    else if (extFile == "gif") {
        //        ImageSave = result.replace("data:image/gif;base64,", "");
        //    }
        //    else if (extFile == "tiff") {
        //        ImageSave = result.replace("data:image/tiff;base64,", "");
        //    }


        //    if (G_ImageName === "undefined" || G_ImageName === "") {
        //        $("#fileCompanyImageUpload").css({ 'border': '1px solid red' });
        //    } else {
        //        $.ajax({
        //            type: "POST",
        //            url: pagePath,
        //            data: "{ 'Image':'" + ImageSave + "' , 'ImageName':'" + G_ImageName + "'}",
        //            contentType: "application/json; charset=utf-8",
        //            dataType: "json",
        //            error:
        //                function (XMLHttpRequest, textStatus, errorThrown) {
        //                    alert("Company Logo Upload failed");
        //                    G_ImageName = "";
        //                },
        //            success:
        //                function (result) {
        //                    G_ImageName = "";

        //                    if (result.d == '') {
        //                        alert("Company Logo Upload Failed !!");
        //                    } else {
        //                        var content = "";
        //                        var url = result.d;
        //                        content += "<a href='" + url + "' target='_blank'><img alt='" + url + "' width='125px' src= '" + url + "' /></a>";

        //                        $("#imgCompany").empty();
        //                        $("#imgCompany").append(content);
        //                        alert("Company Logo Uploaded Successfully !!");

        //                    }
        //                }

        //        });
        //    }
        //}

    </script>
    <style type="text/css">
        .input-validation-error {
            border: 1px solid #ff0000;
            background-color: #ffeeee !important;
        }

        .field-validation-error {
            color: #ff0000 !important;
        }
    </style>
</asp:Content>
