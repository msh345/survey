$(document).ready(function() {

  $('.hippo').click(function(){
    $(this).effect('bounce', {times:3}, 500);
    })

  // $('.hippo_success').click(function() {
  //     $(this).animate({
  //       height: '-=100px'});

  // $('.hippo_success').click(function() {
  //   $(this).effect('explode');
  //   $('.not_found_header').append('<p>I\'m sorry, take me <a href="/">Home!</a></p>')
  // })

  $('.hippo_failure').click(function() {
    $(this).effect('explode');
    $('.not_found_header').append('<p>I\'m sorry, take me <a href="/">Home!</a></p>')
  })

  var shortAnswerTemplate = $('.question-short-template');

  var multipleChoiceTemplate = $('.question-multiple-template');

  var questionSandbox = $('#question-sandbox');

  var addmultiplechoiceAnswerOption = $('.multiple-choice-question-template');

  var submitQuestions = function(event) {
    event.preventDefault();
    var data = $('form').serialize()
    $.post('/survey/create',data, function(response){
      $('html').html(response);
    });
  };

  var addMultipleChoiceQuestion = function() {
    questionSandbox.append(multipleChoiceTemplate.clone());
  }; //we're using clone here to try to append the same element over again
  //http://stackoverflow.com/questions/4114655/jquery-append-only-working-first-time

  var addShortAnswerQuestion = function() { 
    questionSandbox.append(shortAnswerTemplate.clone());
  }; //we're using clone here to try to append the same element over again
  //http://stackoverflow.com/questions/4114655/jquery-append-only-working-first-time

  var addMultipleChoiceOption = function(event) {
    // find enclosing container.
    var enclosingContainer = $(event.toElement).closest('.question-multiple-template');
    var multiChoiceSandbox = enclosingContainer.children('.multiple-choice-answer-sandbox');
      multiChoiceSandbox.append(addmultiplechoiceAnswerOption.clone());
    // get the single multiple choice answer template.




  };


  var bindButtons = function()
  {
    $('#question').submit(submitQuestions);

    //bind to add short question button
    var shortAnswerButton = $('#btn_short_question');
    shortAnswerButton.on("click", addShortAnswerQuestion);

    var multipleChoiceButton = $('#btn_mult_question');
    multipleChoiceButton.on("click", addMultipleChoiceQuestion);

    questionSandbox.on("click", ".addchoice", addMultipleChoiceOption);


  }

  bindButtons(); //calling bindButtons

});

    // var question = $('#question').find("input[name='question[]']").last()
    // $(question).after('<br> <label for="question">Question</label> <input type="text" name="question[]">')

