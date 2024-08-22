<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmStudentApplicant.ascx.cs" Inherits="joshcoWA.student.frmStudentApplicant" %>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
               <ContentTemplate>
                    <table>
                       <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD" colspan="3">
                                <strong>APPLICANT DETAILS - </strong>
                                 <asp:Label ID="lblApplicantDetails" runat="server" ForeColor="Red" Text="Incomplete"></asp:Label>
                            </td>
                        </tr>                      
                        <tr>
                            <td>&nbsp;</td>
                            <td class="formTextTD">
                                <asp:Label ID="lblRefNo" runat="server" Text="Reference No" ></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblStudentReferenceNo" runat="server" Font-Bold="True" ></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">First Name <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvFirstName" runat="server" BackColor="#FFFF99" ControlToValidate="txtStudentFirstName" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm"></asp:RequiredFieldValidator>
                                </td>
                            <td>
                                <asp:TextBox ID="txtStudentFirstName" runat="server" CssClass="form-control"  ValidationGroup="frmStudentApplicant"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Middle Name </td>
                            <td>
                                <asp:TextBox ID="txtStudentMiddleName" runat="server" CssClass="form-control"  ValidationGroup="frmStudentApplicant"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Last Name
                            </td>
                            <td>
                                <asp:TextBox id="txtStudentLastName" runat="server"  CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Gender
                              <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvGender" runat="server" BackColor="#FFFF99" ControlToValidate="ddlStudentGender" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
               
                            </td>
                            <td>
                                 <asp:DropDownList ID="ddlStudentGender"   CssClass="btn-outline-warning btn-fw"  runat="server">
                                     <asp:ListItem>--Select Gender-- </asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                      <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>                      
   
                         <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                ID/Passport Number
                                <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvStudentIdentificationNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtStudentIdentificationNumber" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
               
                            </td>
                            <td>
                                <asp:TextBox id="txtStudentIdentificationNumber" runat="server" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Email Address
                                <span style="color:red">*</span> <asp:RequiredFieldValidator ID="rfvEmailAddress" runat="server" BackColor="#FFFF99" ControlToValidate="txtStudentEmailAddress" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
                   
                            </td>
                            <td>
                                <asp:TextBox id="txtStudentEmailAddress" runat="server"  CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Mobile Number
                               <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvMobileNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtStudentMobileNumber" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
               
                            </td>
                            <td>
                                <asp:TextBox id="txtStudentMobileNumber" runat="server"  CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                          <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Home Address
                            </td>
                            <td>
                                <textarea  id="txtStudentHomeAddress" rows="5"  runat="server"  CssClass="form-control" ValidationGroup="frmStudentApplicant">
                                </textarea>
                        <%--        <asp:TextBox id="txtStudentHomeAddress" runat="server" MaxLength="50"  TextMode="MultiLine" Rows="10" ></asp:TextBox>
                      --%>      </td>
                            <td>&nbsp;</td>
                        </tr> 
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="formTextTD">
                                Nationality
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlStudentNationality" runat="server" CssClass="btn-outline-warning btn-fw" >

                                </asp:DropDownList>
                           </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Institution/University 
                                     <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvInstitution" runat="server" BackColor="#FFFF99" ControlToValidate="txtInstitution" ErrorMessage="*Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
               
                            </td>
                            <td>
                             <asp:TextBox id="txtInstitution" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>                      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>         
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Faculty 
                               <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvFaculty" runat="server" BackColor="#FFFF99" ControlToValidate="txtFaculty" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
               
                            </td>
                            <td>
                              <asp:TextBox id="txtFaculty" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>                      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>          
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Course</td>
                            <td>
                                <asp:TextBox id="txtCourse" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>                      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>          
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Student Number 
                                     <span style="color:red">*</span><asp:RequiredFieldValidator ID="rfvStudentNumber" runat="server" BackColor="#FFFF99" ControlToValidate="txtStudentNumber" ErrorMessage="Required" Font-Size="8pt" ForeColor="Red" ValidationGroup="StudentApplicationForm" Display="Dynamic"></asp:RequiredFieldValidator>
               
                            </td>
                            <td>
                              <asp:TextBox id="txtStudentNumber" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>                      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>          
                        <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Academic Year </td>
                            <td>        
                                <asp:TextBox id="txtAcademicYear" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>                      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>         
                            <tr>
                            <td>&nbsp; </td>
                            <td class="formTextTD">Course Duration in Years </td>
                            <td>        
                                <asp:TextBox id="txtCourseDuration" runat="server" MaxLength="50" CssClass="form-control" ValidationGroup="frmStudentApplicant"></asp:TextBox>                      
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr> 
                           
                    </table>
               </ContentTemplate>
                </asp:UpdatePanel>
<asp:HiddenField ID="hfID" runat="server" Value="0" />
