<?php

try {
    $conexao = new PDO('mysql:host=127.0.0.1;dbname=banco_bueiro','root','');
    // Configura o PDO para lançar exceções em caso de erro
    $conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = "INSERT INTO tb_bueiro (numero_bueiro, rua, bairro, estado, cidade, latitude, longitude, profundidade, data_instalacao, id_sensor)
            VALUES (:numero_bueiro, :rua, :bairro, :estado, :cidade, :latitude, :longitude, :profundidade, :data_instalacao, :id_sensor)";
    
    $stmt = $conexao->prepare($sql);
    
    // Vinculando parâmetros
    $stmt->bindParam(':numero_bueiro', $_POST['numero_bueiro']);
    $stmt->bindParam(':rua', $_POST['rua']);
    $stmt->bindParam(':bairro', $_POST['bairro']);
    $stmt->bindParam(':estado', $_POST['estado']);
    $stmt->bindParam(':cidade', $_POST['cidade']);
    $stmt->bindParam(':latitude', $_POST['latitude']);
    $stmt->bindParam(':longitude', $_POST['longitude']);
    $stmt->bindParam(':profundidade', $_POST['profundidade']);
    $stmt->bindParam(':data_instalacao', $_POST['data_instalacao']);
    $stmt->bindParam(':id_sensor', $_POST['id_sensor']);
    
    // Executa a declaração preparada
    $stmt->execute();
    
    echo "Novo registro criado com sucesso";
} catch(PDOException $e) {
    echo "Erro: " . $e->getMessage();
}

$conexao = null;
?>
