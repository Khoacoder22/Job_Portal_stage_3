<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineJobPortal.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- login page -->
    <section>
        <div class="container pt-50 pb-40">
            <div class="row">
                <div class="col-12 pb-20">
                    <asp:Label ID="lbMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="col-12">
                    <h2 class="contact-title" style="text-align: center">Login Form <i class='fas fa-chess' style='font-size: 34px; margin-left: 5px;'></i>
                    </h2>
                </div>
                <div class="col-lg-6 mx-auto">
                    <div class="form-contact contact_form">
                        <div class="row">

                            <!-- ten dang nhap -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>User name</label>
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Your name" required></asp:TextBox>
                                </div>
                            </div>

                            <!-- Nhap mat khau -->
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Your password" TextMode="Password" required></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <label>Login Type</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddlLoginType" runat="server" CssClass="form-control w-1">
                                        <asp:ListItem Value="0">Select Login Type</asp:ListItem>
                                        <asp:ListItem>Admin</asp:ListItem>
                                        <asp:ListItem>User</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="UserType is required" ControlToValidate="ddlLoginType" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Size="Small" InitialValue="0"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group mt-3">
                                <asp:Button ID="btnLogin" runat="server" CssClass="button button-ContactForm boxed-btn" OnClick="btnLogin_Click" Text="Login" />
                                <span class="clickLink"><a href="../User/Register.aspx" style="color: black; font-family: Arial; font-weight: 500; font-size: 15px; margin-left: 10px;">New? Click Here now !</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>
