<?php

try {
    $conexao = new PDO("mysql:host=127.0.0.1;dbname=banco_bueiro", 'root', '');
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    if (isset($_POST['nome']) && isset($_POST['email']) && isset($_POST['senha'])) {
        $nome = $_POST['nome'];
        $email = $_POST['email'];
        $senha = password_hash($_POST['senha'], PASSWORD_DEFAULT);

        $stmt = $conexao->prepare("INSERT INTO tb_usuarios (usuario, senha) VALUES (:usuario, :senha)");
        $stmt->bindParam(':usuario', $email);
        $stmt->bindParam(':senha', $senha);

        if ($stmt->execute()) {
            echo "Usuário registrado com sucesso!";
        } else {
            echo "Erro ao registrar usuário.";
        }
    } else {
        echo "Por favor, preencha todos os campos.";
    }
} catch(PDOException $e) {
    echo "Erro: " . $e->getMessage();
}

$conexao = null;
?>
