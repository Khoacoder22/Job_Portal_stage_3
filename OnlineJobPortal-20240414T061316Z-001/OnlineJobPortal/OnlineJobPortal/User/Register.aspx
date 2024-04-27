<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineJobPortal.User.Register" %>

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
                    <h2 class="contact-title" style="text-align: center">Sign Up</h2>
                </div>
                <div class="col-lg-6 mx-auto">
                    <div class="form-contact contact_form">

                        <div class="row">
                            <div class="col-12">
                                <h6>Login Information</h6>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>User name</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Your name" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Your password" TextMode="Password" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" placeholder="Your confirmed password" TextMode="Password" required></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Oops! Please make sure your password match" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:CompareValidator>
                                </div>
                            </div>

                            <!-- thông tin người dùng -->
                            <div class="col-12">
                                <h6>Personal Information </h6>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Your name" required></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Inappropriate name!" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Your address" TextMode="MultiLine" required></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Mobile Number</label>
                                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Your Phone Number" required></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Inappropriate Phone Number!Must have 10 digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="^[0-9]{10}$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your email" TextMode="Email" required></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Email Format!" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" ValidationExpression="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                                </div>
                            </div>

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
                        <div class="form-group mt-3">
                            <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="button button-ContactForm boxed-btn" OnClick="btnRegister_Click" />
                            <span class="clickLink"><a href="Login.aspx" style="color: black; font-family: Arial; font-weight: 500; font-size: 15px; margin-left: 10px;">Already Register? Click Here now !</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
