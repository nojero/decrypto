<html>
<head>
<meta charset="utf8"/>
<style>
.page {
	display:flex;
	font-family: Courier New;
}
.data {
	width: 70%;
}
.metadata {
	width: 30%;
}
.turn {
	margin-left:5px;
	font-size: 30px;
	height: 120px;
}
.words_container {
	display:flex;
	height: 120px;
	margin-left:30px;
}
.word_item {
	position:relative;
	width:25%;
	margin: 0 10 0 0;
	border: 1px solid black;
	border-radius: 5px;
	display:flex;
	align-items:center;
	background-color: rgba(255,0,0,0.3);
}
.word {
	margin:auto;
	font-size:22px;
	text-transform: capitalize;
}
.number {
    position: absolute;
    top: 10px;
    left: 10px;
}
.word_item .number {
    font-size: 25px;
}
.codes_container {
	display:flex;
	width: 20%;
	height:auto;
	margin:30 0 0 30;
	font-family: Courier New;
	flex-direction:column;
}
.code_item {
	position:relative;
	width:100%;
	height:8%;
	margin: 0 0 5 0;
	border: 1px solid black;
	border-radius: 3px;
	display:flex;
	align-items:center;
	background-color: rgba(0,0,0,0.2);
	color: rgba(224,68,68,0.7);
}
.code{
	margin:auto;
	font-size: 16px;
	display:none;
}
.code_item:hover .code.show {
	display: block;
}
.code_item .number {
    font-size: 16px;;
}
button {
  padding: 10px 26px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  border-radius: 2px;
  cursor:pointer;
}
#next {
  background-color: #4CAF50; /* Green */
  border: 1px solid #4CAF50;
  color: white;
}
#next:hover {
  background-color: white;
  color:#4CAF50; /* Green */
  border: 1px solid #4CAF50;
}
#new {
  background-color: #008CBA; /* Green */
  border: 1px solid #008CBA;
  color: white;
}
#new:hover {
  background-color: white;
  color:#008CBA; /* Green */
  border: 1px solid #008CBA;
}
.button-container {
  margin-bottom:15px;
}
.black-team {
  background-color: rgba(0,0,0,0.2);
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>BLANCO</title>
</head>
<body>
<div class="page">
  <div class="data">
    <div class="words_container">
      <div class="word_item">
        <div class="word">
          {{word_list[0]}}
        </div> 
        <div class="number">
          1
        </div> 
      </div> 
      <div class="word_item">
        <div class="word">
          {{word_list[1]}}
        </div> 
        <div class="number">
          2
        </div> 
      </div> 
      <div class="word_item">
        <div class="word">
          {{word_list[2]}}
        </div> 
        <div class="number">
          3
        </div> 
      </div> 
      <div class="word_item">
        <div class="word">
          {{word_list[3]}}
        </div> 
        <div class="number">
          4
        </div> 
      </div> 
    </div>
    <div class="codes_container">
      <div class="code_item">
         <div class="code show" data-turn="1">
          {{codes[0]}}
        </div> 
        <div class="number">
          1
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="2">
          {{codes[1]}}
        </div> 
        <div class="number">
          2
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="3">
          {{codes[2]}}
        </div> 
        <div class="number">
          3
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="4">
          {{codes[3]}}
        </div> 
        <div class="number">
          4
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="5">
          {{codes[4]}}
        </div> 
        <div class="number">
          5
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="6">
          {{codes[5]}}
        </div> 
        <div class="number">
          6
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="7">
          {{codes[6]}}
        </div> 
        <div class="number">
          7
        </div> 
      </div>
      <div class="code_item">
         <div class="code" data-turn="8">
          {{codes[7]}}
        </div> 
        <div class="number">
          8
        </div> 
      </div>
    </div>
  </div>
  <div class="metadata">
    <div class="turn">
      Turno: <span id="turn">1</span>
    </div>
    <div class="button-container">
      <button id="next">Siguiente turno</button>
    </div>
    <div class="button-container">
      <button id="new">Nuevo Juego</button>
    </div>
  </div>
</div>
<script type="text/javascript">
  $("#next").click(() => {
    let turn = parseInt($("#turn").html());
    if (turn == 8) {
      alert("No hay más turnos, el juego terminó");
    } else if(confirm("Seguro que desea avanzar de turno?")) {
      $("#turn").html(turn+1);
      $(".code").each(function() {
        let val = $(this).data("turn");
        if(val <= turn+1) {
          $(this).addClass("show");
        }
      });
    }
  });
  $("#new").click(() => {
    window.location.href = "/new";
  });
</script>
</body>
