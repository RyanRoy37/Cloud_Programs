package com.example.intentexample;

import android.os.Bundle;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class SecondActivity extends AppCompatActivity {

    TextView textViewWelcome;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        textViewWelcome = findViewById(R.id.textViewWelcome);

        String name = getIntent().getStringExtra("user_name");
        textViewWelcome.setText("Welcome, " + name + "!");
    }
}
