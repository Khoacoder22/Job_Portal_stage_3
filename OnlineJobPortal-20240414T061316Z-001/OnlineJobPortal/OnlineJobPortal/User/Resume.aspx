<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Resume.aspx.cs" Inherits="OnlineJobPortal.User.Resume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div class="container pt-50 pb-40">
            <div class="row">
                <div class="col-12 pb-20">
                    <asp:Label ID="lbMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="col-12">
                    <h2 class="contact-title" style="text-align: center">Resume</h2>
                </div>
                <div class="col-lg-6 mx-auto">
                    <div class="form-contact contact_form">

                        <div class="row">
                            <div class="col-12">
                                <h6>Personal Information</h6>
                            </div>
                            <!-- Full Name -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Your name" required></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Inappropriate name!" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <!-- User Name -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>User name</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Your name" required></asp:TextBox>
                                </div>
                            </div>

                            <!-- Address -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Your address" TextMode="MultiLine" required></asp:TextBox>
                                </div>
                            </div>

                            <!-- Mobile -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Your Phone Number" required></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Inappropriate Phone Number!Must have 10 digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <!-- Email -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your email" TextMode="Email" required></asp:TextBox>
                                </div>
                            </div>

                            <!-- Country -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Country</label>
                                    <asp:DropDownList ID="ddlCountry" runat="server" DataSourceID="SqlDataSource1" CssClass="form-contact w-100" AppendDataBoundItems="true" DataTextField="CountryName">
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Country is required" ControlToValidate="ddlCountry" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT * FROM [Country]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <br />
                        <!--  -------------------------- -->
                        <!-- thông tin người dùng -->
                        <div class="col-12 pt-4">
                            <h6>Resume Information</h6>
                        </div>

                        <div class="row-md-6 col-sm-12">
                            <div class="form-group">
                                <label>GPA</label>
                                <asp:TextBox ID="txtGPA" runat="server" CssClass="form-control" placeholder="Your GPA of bachelor" required></asp:TextBox>
                            </div>
                        </div>


                        <div class="row-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Phd grade</label>
                                <asp:TextBox ID="txtPhd" runat="server" CssClass="form-control" placeholder="Your GPA of Phd"></asp:TextBox>
                            </div>
                        </div>


                        <div class="row-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Works</label>
                                <asp:TextBox ID="txtWork" runat="server" CssClass="form-control" placeholder="Your GPA of PhD"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Experience</label>
                                <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="Your Experience"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Resume</label>
                            <asp:FileUpload ID="fuResume" runat="server" CssClass="form-control pt-2"
                                ToolTip=".doc, .docx, .pdf extension only" />
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button button-ContactForm boxed-btn" OnClick="btnUpdate_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
