// 画面が生成されるより先にJavaScriptが走るので、このイベントが必須
document.addEventListener("DOMContentLoaded", () => {

  const pwd = document.getElementById('js-password');
  const pwdCheck = document.getElementById('js-passwordCheck');
  const pwdBtnText = document.getElementById('js-pwdBtnText');

  pwdCheck.addEventListener('change', () => {
    if(pwdCheck.checked) {
        pwdBtnText.innerHTML = 'パスワードを隠す'
          pwd.setAttribute('type', 'text');
      } else {
        pwdBtnText.innerHTML = 'パスワードを表示する'
          pwd.setAttribute('type', 'password');
      }
  }, false);
})