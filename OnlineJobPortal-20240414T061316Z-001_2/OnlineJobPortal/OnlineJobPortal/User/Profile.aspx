<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OnlineJobPortal.User.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- div 1 -->
    <div class="container pt-5 pb-5">
        <div class="main-body">
            <asp:DataList ID="dlProfile" runat="server" Width="100%" OnItemCommand="dlProfile_ItemCommand">
                <ItemTemplate>
                    <div class="row gutters-sm">
                        <div class="col-md-4 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <img src="https://cdn-icons-png.flaticon.com/512/1366/1366466.png" alt="UserPic" class="rounded-circle" width="150" />
                                        <div class="mt-3">
                                            <div class="text-capitalize"><%# Eval("Name") %></div>
                                            <p class="text-secondary mb-1"><%# Eval("UserName") %></p>
                                            <p class="text-muted font-size-sm text-capitalize">
                                                <i class="fas fa-map-market-alt"></i><%# Eval("Country") %>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name </h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Name") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <!-- div 2 -->
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Email") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <!-- div 3 -->
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Mobile</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Mobile") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <!-- div 4 -->
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Address") %>
                                        </div>
                                    </div>
                                    <hr />
                                    <!-- div 5 -->
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Resume</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary text-capitalize">
                                            <%# Eval("Resume") == DBNull.Value ? "Not Upload" : "Uploaded" %>
                                        </div>
                                    </div>
                                    <hr />
                                    <!-- div 5 -->
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="button button-contactForm boxed-btn" CommandName="EditUserProfile" CommandArgument='<%# Eval("UserId") %>' />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
