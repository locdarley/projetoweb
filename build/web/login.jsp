<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

        .login-form {
    display: inline-block; 
    text-align: center; 
    max-width: 300px; 
    margin: 0 auto; 
}

.login-form h1 {
    font-size: 24px;
    margin-bottom: 20px;
    color: #333; 
}

.login-form p {
    font-size: 16px;
    color: #777; 
    margin-bottom: 10px;
}

.form-group {
    margin-bottom: 15px;
    text-align: center; 
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input[type="text"],
.form-group input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
    margin: 0 auto; 
}

button[type="submit"] {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    margin-top: 20px;
}

button[type="submit"]:hover {
    background-color: #0056b3;
}

.login-container {
    background-color: #fff;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    text-align: center; 
}   
        
        
    </style>
</head>
<body>
    <div class="login-container">
        <form class="login-form" action="login" method="post">
            <h1>Login</h1>
            <div class="form-group">
                <label for="usuario">Usuário:</label>
                <input type="text" id="usuario" name="usuario" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            <button type="submit">Entrar</button>
             <div class="error-message">
            <% 
                String erroParam = request.getParameter("erro");
                if (erroParam != null && erroParam.equals("1")) {
                    out.print("Usuário ou senha incorretos.");
                }
            %>
        </div>
        </form>
    </div>
</body>
</html>
