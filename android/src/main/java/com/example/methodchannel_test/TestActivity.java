package com.example.methodchannel_test;

import androidx.appcompat.app.AppCompatActivity;

import android.media.MediaPlayer;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.util.HashMap;
import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

public class TestActivity extends FlutterActivity {
    Button sendButton;
    TestActivity activity;
    private MethodChannel channel;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_test);
        activity = this;
        sendButton = (Button) findViewById(R.id.button);
        channel = new MethodChannel(getFlutterView(),"methodchannel_test");
        sendButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                channel.invokeMethod("CALL_TO_FLUTTER","test");
            }
        });
    }
}