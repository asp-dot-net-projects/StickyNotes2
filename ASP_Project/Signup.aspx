<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
          body , html 
        {  
            margin: 0;
            padding:0;
            height:100%;
            background-image: url(signup_background.jpg);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
         }

       
        .loginbox {
            width: 400px;
            height: 700px;
            background: #ff6a00;
            color: #fff;
            top: 50%;
            left: 50%;
            position: absolute;
            transform: translate(-50%,-50%);
            box-sizing: border-box;
            padding: 70px 30px;
            border-radius: 10%;
            background: rgba(0,0,0,0.5);
        }
        
        .loginbox a 
        {
            text-decoration:dotted;
            font-size:15px;
            line-height:20px;
            color:#ffc107;
        }

       .loginbox a:hover 
       {    
            color:#81e219;
       }
        .imagebox 
        {
            width: 55%;
            height:90%;
            top:50%;
            left:30%;
            position:absolute;
            transform:translate(-50%,-50%);
            box-sizing: border-box;
            padding:70px 30px;
            background-color:#ffc107;
            background-size:cover;
            background-repeat:no-repeat;
        }


        h1 
        {
            margin:0;
            padding:0 0 20px;
            text-align:center;
            font-size: 25px;
            color:#1f7fbf
        }

        .loginbox p 
        {
            margin:0;
            padding:0;
            font-weight:bold;
        }

        .loginbox input 
        {
            width:100%;
            margin-bottom:22px;
        }

        .loginbox input[type="text"], input[type="password"] 
        {
            border:none;
            border-bottom:1px solid #fff;
            background: transparent;
            outline:none;
            height:40px;
            color:#fff;
            font-size:16px;
        }

        .loginbox input[type="submit"] 
        {
            border:none;
            outline:none;
            height:40px;
            background:#fb2525;
            color:#fff;
            font-size:18px;
            border-radius:20px;
        }

        .loginbox input[type="submit"]:hover 
        {
            cursor:pointer;
            background:#ffc107;
            color:#000;
        }

        .avatar 
        {
            width:100px;
            height:100px;
            border-radius : 50%;
            position:absolute;
            top: -50px;
            left: calc(50% - 50px);
        }

       </style>

</head>
<body>
    <form id="form2" runat="server">
        <div class="loginbox">
            <h1>Sign Up</h1>
            <asp:Textbox runat="server" ID="firstname" name="firstname" placeholder="Enter First Name" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstname" ErrorMessage="* First Name Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            <asp:Textbox runat="server" ID="lastname" name="lastname" placeholder="Enter Last Name" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lastname" ErrorMessage="* Last Name Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            <asp:Textbox runat="server" ID="username" name="username" placeholder="Choose a Username" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="username" ErrorMessage="* Username Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            <asp:Textbox runat="server" ID="password" TextMode="Password" name="password" placeholder="Enter Password" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="password" ErrorMessage="* Password Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            <asp:Textbox runat="server" ID="confirm_password" TextMode="Password" name="confirm_password" placeholder="Confirm Password" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirm_password" ErrorMessage="* Both Password must be same" ForeColor="#FF3300"></asp:CompareValidator>


            <asp:Textbox runat="server" ID="email" name="email" placeholder="Email ID" />
<%--             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="email" ErrorMessage="* Email ID Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="* Enter a valid email id" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>   


            <asp:Button runat="server" Text="Sign Up" onclick="Signup_submit" />
            </div>
    </form>
</body>
</html>
