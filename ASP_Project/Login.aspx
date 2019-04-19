<%@ Page Language="C#" EnableSessionState="True" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
            background-image: url(background.png);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
         }

       
        .loginbox {
            width: 350px;
            height: 400px;
            background: #ff6a00;
            color: #fff;
            top: 50%;
            left: 70%;
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

        .l1 
        {
            font-family:'Tw Cen MT';
            color:red;
            font-size:large;
        }

       </style>

</head>
<body>
    <form id="form1" runat="server">
        <div  class="loginbox" >
            <img src="boy.png"  class="avatar"/>
              <h1>Login</h1>         
            <asp:Textbox runat="server" ID="username" name="username" placeholder="Enter Username" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username" ErrorMessage="* User Name Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            <asp:Textbox runat="server" ID="password" name="password" TextMode="Password" placeholder="Enter Password" />
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="* Password Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            <asp:Button runat="server" Text="Login" onclick="connection" />
            

            <a href="Signup.aspx">Create an Account</a> <br>
            <asp:Label ID="errlb" runat="server" CssClass="l1"></asp:Label>

        </div>
    </form>
</body>
</html>
