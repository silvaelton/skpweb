$(document).ready(function(){
  $('.ui.dropdown').dropdown();
  $('.date').mask("00/00/0000", {placeholder: "__/__/____"});
  $('.hour').mask("00:00", {placeholder: "00:00"});
  $('.cpf').mask("000.000.000-00", {placeholder: "000.000.000-00"});
  $('.cnpj').mask("00.000.000/0000-00", {placeholder: "00.000.000/0000-00"});
  $('.document_number').mask("000-000.000/0000", {placeholder: "000-000.000/0000"});
  $('.cep').mask("00000-000", {placeholder: "00000-000"});
  $('.percent').mask("00.0", {placeholder: "00.0"});
  $('.coin').mask("######0.00", {reverse: true});
  $('.money').mask('000.000.000.000,00', {reverse: true});
  $('.telephone')
    .mask("(99) 9999-9999##")
})
