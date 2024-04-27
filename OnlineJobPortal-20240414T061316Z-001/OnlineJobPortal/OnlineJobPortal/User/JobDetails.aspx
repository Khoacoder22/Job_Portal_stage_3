<%@ Page Title="" Language="C#" MasterPageFile="~/User/user.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="OnlineJobPortal.User.JobDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>

        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider section-overly slider-height2 d-flex align-items-center" data-background="../assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2><%# jobTitle %></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End -->

        <div>
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <!-- job post company Start -->
        <div class="job-post-company pt-120 pb-120">
            <div class="container">
                <asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" OnItemDataBound="DataList1_ItemDataBound">

                    <ItemTemplate>
                        <div class="row justify-content-between">
                            <!-- Left Content -->
                            <div class="col-xl-7 col-lg-8">
                                <!-- job single -->
                                <div class="single-job-items mb-50">
                                    <div class="job-items">
                                        <div class="company-img company-img-details">
                                            <a href="#">
                                                <img width="80" src="<%# GetImageUrl(Eval("CompanyImage")) %>" alt=""></a>
                                        </div>
                                        <div class="job-tittle">
                                            <a href="#">
                                                <h4><%# Eval("Title") %></h4>
                                            </a>
                                            <ul>
                                                <li><%# Eval("CompanyName") %></li>
                                                <li><%# Eval("Salary") %></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <!-- job single End -->

                                <div class="job-post-details">
                                    <div class="post-details1 mb-50">
                                        <!-- Small Section Tittle -->
                                        <div class="small-section-tittle">
                                            <h4>Job Description</h4>
                                        </div>
                                        <p><%# Eval("Description") %></p>
                                    </div>
                                    <%--   <div class="post-details2  mb-50">
                                        <!-- Small Section Tittle -->
                                        <div class="small-section-tittle">
                                            <h4>Required Knowledge, Skills, and Abilities</h4>
                                        </div>
                                        <ul>
                                            <li>System Software Development</li>
                                            <li>Mobile Applicationin iOS/Android/Tizen or other platform</li>
                                            <li>Research and code , libraries, APIs and frameworks</li>
                                            <li>Strong knowledge on software development life cycle</li>
                                            <li>Strong problem solving and debugging skills</li>
                                        </ul>
                                    </div>--%>
                                    <div class="post-details2  mb-50">
                                        <!-- Small Section Tittle -->
                                        <div class="small-section-tittle">
                                            <h4>Education + Experience</h4>
                                        </div>
                                        <ul>
                                            <li><%# Eval("Qualification") %></li>
                                            <li><%# Eval("Experience") %></li>

                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <!-- Right Content -->
                            <div class="col-xl-4 col-lg-4">
                                <div class="post-details3  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Job Overview</h4>
                                    </div>
                                    <ul>
                                        <li>Application date : <span><%# DataBinder.Eval(Container.DataItem, "LastDate", "{0:dd MMMM yyyy}") %></span></li>
                                        <li>Position : <span><%# Eval("Position") %></span></li>
                                        <li>Job Type : <span><%# Eval("JobType") %><span></li>
                                        <li>Location : <span><%# Eval("Address") %></span></li>
                                        <li>Salary :  <span><%# Eval("Salary") %></span></li>
                                    </ul>
                                    <div class="apply-btn2">
                                        <asp:LinkButton ID="lbApplyJob" runat="server" CssClass="btn" Text="Apply now" CommandName="Apply"></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="post-details4  mb-50">
                                    <!-- Small Section Tittle -->
                                    <div class="small-section-tittle">
                                        <h4>Company Information</h4>
                                    </div>
                                    <span>Colorlib</span>
                                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                                    <ul>
                                        <li>Company Name: <span><%# Eval("CompanyName") %> </span></li>
                                        <li>Email: <span><%# Eval("Email") %></span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                </asp:DataList>

            </div>
        </div>
        <!-- job post company End -->

    </main>

</asp:Content>
