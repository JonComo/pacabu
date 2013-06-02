var twilio = require("twilio");
twilio.initialize("AC0ed0cb4e469cf4c561c79c02056e36a3","022384045cbc5882ef8218c1dafcc879");

Parse.Cloud.define('inviteWithTwilio', function(request, response) {
    twilio.sendSMS({
      From: "+12064960313",
      To: request.params.number,
      Body: "Start using Parse and Twilio! Your Verification number is 2386"
    }, {
    success: function(httpResponse) {
      console.log(httpResponse);
      response.success("SMS sent!");
    },
    error: function(httpResponse) {
      console.error(httpResponse);
      response.error("Uh oh, something went wrong");
    }
  });
});
