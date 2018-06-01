package inducesmile.com.sid.App;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.util.Log;
import org.json.JSONArray;

import java.util.HashMap;

import inducesmile.com.sid.Connection.ConnectionHandler;
import inducesmile.com.sid.Helper.UserLogin;
import inducesmile.com.sid.R;

import inducesmile.com.sid.Helper.Alert;
import inducesmile.com.sid.Helper.LoginType;

//Esta aplicação serve como base para vos ajudar, precisam de completar os métodos To do de modo a que a aplicação faça o minimo que é suposto, podem adicionar novas features ou mudar a UI se acharem relevante.
public class LoginActivity extends AppCompatActivity {
    private EditText ip, port,username,password;
    private Button login;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        ip = findViewById(R.id.ip);
        port = findViewById(R.id.port);
        username=findViewById(R.id.username);
        password = findViewById(R.id.password);
        login =  findViewById(R.id.login);

        checkDefaults();

    }

    private void checkDefaults() {

        //TODO - arranjar maneira de guardar os dados e voltar a inserir-los caso existam (ficheiro json)

        ip.setText(String.valueOf("sybasesid.ddns.net"));
        port.setText(String.valueOf("80"));
    }

    public void loginClick(View v){

        if(!ip.getText().toString().isEmpty() && !port.getText().toString().isEmpty() && !username.getText().toString().isEmpty() && !password.getText().toString().isEmpty()) {

            LoginType logintype = tryLogin();

            if(logintype == LoginType.VALID) {
                new UserLogin(ip.getText().toString(), port.getText().toString(),username.getText().toString(),password.getText().toString());
                Intent i = new Intent(this, MainActivity.class);
                startActivity(i);
                finish();
            } else {
                new Alert(this, "Alert", "Invalid Login! Please try again.");
            }

        } else {
            new Alert(this, "Alert", "Please fill all the inputs before login");
        }

    }

    private LoginType tryLogin() {


        String try_login_php = "http://" + ip + ":" + port + "/trylogin.php";
        HashMap<String, String> params = new HashMap<>();
        params.put("username", String.valueOf(username));
        params.put("password", String.valueOf(password));
        params.put("ip", String.valueOf(ip));
        params.put("port", String.valueOf(port));
        ConnectionHandler jParser = new ConnectionHandler();
        JSONArray result = jParser.getJSONFromUrl(try_login_php, params);

        if (result !=null){
            int valid = 0;

            Log.d("MSG", result.toString());



            if(valid == 1)
                return LoginType.VALID;

        }

        return LoginType.VALID;
    }
}
