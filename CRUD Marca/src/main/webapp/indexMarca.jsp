<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <title>Marca</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light ">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Pimpolhos</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <div class="col-12 navHamb">
                    <ul class="navbar-nav menuLateralTab">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#">Meu perfil</a>
                        </li>
                        <hr>
                        <li class="nav-item">
                            <a class="nav-link clientes " aria-current="page" href="#">Clientes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link categorias" href="#">Categorias</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link produtos" href="#">Produtos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fornecedores" href="#">Fornecedores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link pedidos" href="#">Pedidos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link marcas" href="#">Marcas</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    
    <form action="ServletPimpolhos" method="post">
		<button class="btn btn-secondary col-2" style=" margin:0px 0px 35px 18px; font-weight: bold; background-color: #9ACCFF; border: none;" type="submit"  name="option" value="insertForm"> Adicionar Marca</button>

	</form>

    <div class="row bodyRow" style="justify-content:space-around;">
        <div class="col-2 navLateral">
            <ul class="navbar-nav menuLateralTab">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#">Meu perfil</a>
                </li>
                <hr>
                <li class="nav-item">
                    <a class="nav-link clientes " aria-current="page" href="#">Clientes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link categorias" href="#">Categorias</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link produtos" href="#">Produtos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fornecedores" href="#">Fornecedores</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link pedidos" href="#">Pedidos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link marcas" href="#">Marcas</a>
                </li>
            </ul>
        </div>
        
        
        
        
        <div class="col-md-12 col-lg-9 conteudo">
          <div class = "table-responsive">
            <table class="table table-hover ">
                <thead>
                    <tr>
                        <th>Cod. Marca</th>
                        <th>Marca</th>
                        <th>A��es</th>
                    </tr>
                </thead>
                <tbody>
				<c:forEach var="marca" items="${listUser}">
					<tr>
						<form action="ServletPimpolhos" method="post"> 
							<td>
								<c:out value="${marca.cod_marca}"/>
								<input type="hidden" name="cod_marca" value="${marca.cod_marca}"/>
							</td>
							<td><c:out value="${marca.nome_marca}"/></td>
							
							<td class="btnAcoes">
								<button type="submit" name="option" value="delete">Deletar</button>
								<button type="submit" name="option" value="updateForm">Atualizar</button>
							</td>
						</form>	

					</tr>
				</c:forEach>
			</tbody>
              </table>
            </div>
        </div>
    </div>
    
    
    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>