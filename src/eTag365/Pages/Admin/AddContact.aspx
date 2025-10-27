<%@ Page Title=" View/Edit Contact" Language="C#" MasterPageFile="~/MasterPage/Site.master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AddContact.aspx.cs" Inherits="eTag365.Pages.Admin.AddContact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server" class="form-horizontal">
        <asp:ScriptManager runat="server" ID="sc1">
        </asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="userpanel">
            <ContentTemplate>
                <div class="box">
                    <div class="box-header with-border CommonHeader col-md-12">
                        <h3 class="box-title" id="lblHeadline" runat="server">View/Change Patient Information</h3>
                    </div>
                    <!-- left column -->
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="box box-primary">
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="box-body">
                                <div class="col-md-6">
                                    <label class="col-sm-6 control-label" id="Label1" runat="server">*Country Code:</label>
                                    <div class="col-sm-6">
                                        <asp:DropDownList ID="ddlCountryCode" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlCountryCode" InitialValue="-1" ErrorMessage="Please Select Country Code" ForeColor="Red" ValidationGroup="Contact"></asp:RequiredFieldValidator>

                                        <%-- <asp:TextBox ID="txtCC" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtCC" ValidationGroup="Contact"
                                            Display="Dynamic" runat="server" ErrorMessage="Country Code Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="Invalid Country Code" ForeColor="Red" ControlToValidate="txtCC" ValidationExpression="\d+"></asp:RegularExpressionValidator>--%>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtNumber" class="col-sm-6 control-label">*Mobile Number:</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtNumber" ValidationGroup="Contact"
                                            Display="Dynamic" runat="server" ErrorMessage="Cell Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator26" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="Invalid Cell Number" ForeColor="Red" ControlToValidate="txtNumber" ValidationExpression="^(?=(?:\D*\d){10,18}\D*$)(?:\(?0?[0-9]{1,3}\)?|\+?[0-9]{1,3})[\s-]?(?:\(0?[0-9]{1,5}\)|[0-9]{1,5})[-\s]?[0-9][\d\s-]{5,7}\s?(?:x[\d-]{0,4})?(?:[-\s]?[0-9]{1,4}|[-\s])$"></asp:RegularExpressionValidator>

                                    </div>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="col-md-6">
                                    <label for="txtContactName" class="col-sm-6 control-label">*First Name:</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ControlToValidate="txtContactName" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="First Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtLastName" class="col-sm-6 control-label">*Last Name:</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ControlToValidate="txtLastName" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtContactTitle" class="col-sm-6 control-label">Age:</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtContactTitle" runat="server" CssClass="form-control"></asp:TextBox>
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

                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <label for="txtAddress" class="col-sm-6 control-label">Address :</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>

                                    </div>
                                </div>



                                <div class="col-md-6">
                                    <label for="ddlCountry" class="col-sm-6 control-label" style="float: left;">Country:</label>
                                    <div class="col-sm-6">
                                        <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label for="txtEmail" class="col-sm-6 control-label">*Email Address:</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEmail" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="Email Address Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="Invalid Email" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="txtWorkNumber" class="col-sm-6 control-label">Emergency Contact Number:</label>
                                    <div class="col-sm-6">
                                        <asp:TextBox ID="txtWorkNumber" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                        <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" ValidationGroup="Contact"
                                            runat="server" ErrorMessage="Invalid Work Number" ForeColor="Red" ControlToValidate="txtWorkNumber" ValidationExpression="^(?=(?:\D*\d){10,18}\D*$)(?:\(?0?[0-9]{1,3}\)?|\+?[0-9]{1,3})[\s-]?(?:\(0?[0-9]{1,5}\)|[0-9]{1,5})[-\s]?[0-9][\d\s-]{5,7}\s?(?:x[\d-]{0,4})?(?:[-\s]?[0-9]{1,4}|[-\s])$"></asp:RegularExpressionValidator>

                                    </div>
                                </div>



                                <div class="box-body">

                                    <div class="col-md-6">
                                        <label for="txtOther" class="col-sm-6 control-label">Medical Records:</label>
                                        <div class="col-sm-6">
                                            <asp:TextBox ID="txtOther" TextMode="MultiLine" Height="100" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                    <div class="col-md-12">
                                        <div class="col-md-3 btnSubmitDiv">
                                            <asp:Button ID="btnBack" runat="server" Text="Cancel" OnClick="btnBack_Click" CssClass="btn btn-success" />
                                        </div>
                                        <div class="col-md-3 btnSubmitDiv">
                                            <asp:Button ID="btnSave" runat="server" Text="Update" OnClientClick="CheckVal()" OnClick="btnSubmit_Click" CssClass="btn btn-successNew" ValidationGroup="Contact" />
                                        </div>
                                        <div class="col-md-3 btnSubmitDiv">
                                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClientClick='return confirm("Are you sure you want to delete?");' OnClick="btnDelete_Click" CssClass="btn btn-success" />
                                        </div>
                                        <div class="col-md-3 btnSubmitDiv">
                                            <asp:Button ID="btnCancel" runat="server" Text="Clear Form" OnClick="btnClose_Click" CssClass="btn btn-success" />
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

    <style type="text/css">
        .input-validation-error {
            border: 1px solid #ff0000;
            background-color: #ffeeee !important;
        }

        .field-validation-error {
            color: #ff0000 !important;
        }

        .box-header.with-border {
            border-bottom: none;
            text-align: center;
        }

        .box {
            position: relative;
            background: none;
            border-top: none;
            margin-bottom: 20px;
            width: 100%;
            box-shadow: none;
        }
    </style>
</asp:Content>
