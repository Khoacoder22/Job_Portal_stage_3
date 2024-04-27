<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewJobs.aspx.cs" Inherits="OnlineJobPortal.Admin.NewJobs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- background -->
    <div style="background-image: url('../Images/bg.jpg'); width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed">
       <!-- message --> 
        <div class="container pt-4 pb-4">
            <div>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            <!-- div 1-->
            <h3 class="text-center"><strong>Add Jobs  <i class='fas fa-chess-knight' style='font-size:36px'></i></strong></h3>
                 <!--add jobs-->
                 <div class="row mr-lg-5 ml-lg-5 mb-3">
                     <div class="col-md-6 pt-3">
                         <label for="txtJobTitle" style="font-weight: 600"><strong>Add Jobs</strong></label>
                         <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" placeholder="ex. web developer, app developer"></asp:TextBox>
                     </div>

                 <!--Number of Posts-->
                 <div class="col-md-6 pt-3">
                    <label for="txtNoOfPost" style="font-weight: 600"><strong>Number of Position</strong></label>
                    <asp:TextBox ID="txtNoOfPost" runat="server" CssClass="form-control" placeholder="Enter your number of Positions" TextMode="Number"></asp:TextBox>
                 </div>
              </div>
           
            <!-- div 2 -->
             <!--Description-->
              <div class="row mr-lg-5 ml-lg-5 mb-3">
                   <div class="col-md-12 pt-3">
                   <label for="txtDescription" style="font-weight: 600"><strong>Description</strong></label>
                   <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
              </div>
            </div>
            <!--div 3-->
            <!--Qualification-->
             <div class="row mr-lg-5 ml-lg-5 mb-3">
                  <div class="col-md-6 pt-3">
                  <label for="txtQualification" style="font-weight: 600"><strong>Qualification</strong></label>
                  <asp:TextBox ID="txtQualification" runat="server" CssClass="form-control" placeholder="ex. MCA, Bachelor, PhD" TextMode="MultiLine"></asp:TextBox>
             </div>

            <!--Experience-->
            <div class="col-md-6 pt-3">
                 <label for="txtExperience" style="font-weight: 600"><strong>Experience</strong></label>
                 <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" placeholder="ex. 5 years, 10 years" TextMode="MultiLine"></asp:TextBox>
            </div>
           </div>
            
           <!--div 4-->
            <!--Salary-->
           <div class="row mr-lg-5 ml-lg-5 mb-3">
                 <div class="col-md-6 pt-3">
                <label for="txtSalary" style="font-weight: 600"><strong>Salary</strong></label>
                <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" placeholder="ex. $7000,..." TextMode="MultiLine"></asp:TextBox>
          </div>

         <!--Date-->
         <div class="col-md-6 pt-3">
                <label for="txtLastDate" style="font-weight: 600"><strong>Last Date To Apply</strong></label>
                <asp:TextBox ID="txtLastDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
             </div>
          </div>
             
          <!--div 5-->
         <div class="row mr-lg-5 ml-lg-5 mb-3">
              <div class="col-md-6 pt-3">
              <label for="txtCompany" style="font-weight: 600"><strong>Company Name</strong></label>
              <asp:TextBox ID="txtCompany" runat="server" CssClass="form-control" placeholder="ex. Samsung, Microsoft, Vin,..." TextMode="MultiLine"></asp:TextBox>
         </div>

         <!--Number of Posts-->
          <div class="col-md-6 pt-3">
              <label for="txtLogo" style="font-weight: 600"><strong>Company Logo</strong></label>
              <asp:FileUpload ID="fuCompanyLogo" runat="server" CssClass="form-control" ToolTip=".jpg, .jpeg, .png"></asp:FileUpload>
           </div>
        </div>

        <!--div 6 -->
         <!--Email-->
         <div class="row mr-lg-5 ml-lg-5 mb-3">
            <div class="col-md-6 pt-3">
               <label for="txtEmail" style="font-weight: 600"><strong>Email</strong></label>
               <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@gmail.com" TextMode="Email"></asp:TextBox>
            </div>
               <!--Job type-->
              <div class="col-md-6 pt-3">
                  <label ID="ddlJobType" style="font-weight: 600"><strong>Job Type</strong></label>
                  <asp:DropDownList ID="ddlJobType" runat="server" CssClass="form-control">
                      <asp:ListItem Value="0">Select Job Type</asp:ListItem>
                      <asp:ListItem >Full Time</asp:ListItem>
                      <asp:ListItem >Part Time</asp:ListItem>
                      <asp:ListItem >Remote</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="JobType is required" ForeColor="Red" ControlToValidate="ddlJobType" InitialValue="0" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
         </div>

            <!--div 7 -->
            <div class="row mr-lg-5 ml-lg-5 mb-3">
                  <label for="txtAddress" style="font-weight: 600"><strong>Address</strong></label>
                  <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="ex 87/26 Nguyen Trai,..." TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="row mr-lg-5 ml-lg-5 mb-3 pt-4">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#27ae60" Text="Add Job" Onclick="btnAdd_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
