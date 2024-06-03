<?php
session_start();

try {
    $conexao = new PDO("mysql:host=127.0.0.1;dbname=banco_bueiro", 'root', '');
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (isset($_POST['usuario']) && isset($_POST['senha'])) {
        $usuario = $_POST['usuario'];
        $senha = $_POST['senha'];

        $stmt = $conexao->prepare("SELECT * FROM tb_usuarios WHERE usuario = :usuario");
        $stmt->bindParam(':usuario', $usuario);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user && password_verify($senha, $user['senha'])) {
            $_SESSION['user_id'] = $user['id'];
            $_SESSION['username'] = $user['usuario'];
            header("Location: index.php");
            exit();
        } else {
            echo "Nome de usuário ou senha inválidos.";
        }
    } else {
        echo "Por favor, preencha todos os campos.";
    }
} catch(PDOException $e) {
    echo "Erro: " . $e->getMessage();
}

$conexao = null;
?>
