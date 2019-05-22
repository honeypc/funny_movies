import $ from 'jquery';
import toastr from 'toastr';

$(document).on('ajax:complete', '#new_user', function(e){
  var response = e.detail;
  var xhr = response[0], status = response[1];
  if (xhr.statusText === "Created") {
    user = xhr.responseJSON;
    toastr.success('Hello ' + user.email);
  } else {
    toastr.error('Invalid email or password!');
  }
});
