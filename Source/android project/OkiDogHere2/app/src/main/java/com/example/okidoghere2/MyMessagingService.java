package com.example.okidoghere2;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.IBinder;
import android.util.Log;

import androidx.annotation.NonNull;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

import java.util.Map;

public class MyMessagingService extends FirebaseMessagingService {
    public MyMessagingService() {
    }

    private static final String TAG = "FMS";

    @Override
    // 새로운 토큰을 확인했을 때 호출 됨
    public void onNewToken(@NonNull String token) {
        super.onNewToken(token);

        Log.d(TAG, "onNewToken 호출 됨: " + token);
    }
    // onMessageReceived 재정의
    // FirebaseMessagingService.onMessageReceived 메서드를 재정의하면 수신된 RemoteMessage 객체를 기준으로
    // 작업을 수행하고 메시지 데이터를 가져올 수 있습니다.
    @Override
    public void onMessageReceived(@NonNull RemoteMessage remoteMessage) {
        Log.d(TAG, "onMessageReceived 호출 됨.");
        //------------------------------------------------
        // (2) 메세지 수신 기능 추가
        // - push메시지 받았을 때 그 내용 확인한 후 액티비티 쪽으로 보내는 메소드 호출

        String from = remoteMessage.getFrom();
        Map<String, String> data = remoteMessage.getData();
        String contents = data.get("contents");
        Log.d(TAG, "from : " + from + ", contents : " + contents);

        sendToActivity(getApplicationContext(), from, contents);
    }
    //------------------------------------------------
    // (2) 메세지 수신 기능 추가


    // - 엑티비티 쪽으로 데이타를 보내기 위해 인텐트 객체를 만들고 startActivity() 호출

    private void sendToActivity(Context context, String from, String contents){
        //※ 인텐트란
        //
        // 앱 컴포넌트가 무엇을 할 것인지를 담는 메시지 객체입니다.
        // 메시지는 의사소통을 하기 위해 보내고 받는 것이지요.
        // 메시지를 사용하는 가장 큰 목적은 다른 액티비티, 서비스, 브로드캐스트 리시버, 컨텐트 프로바이더 등을 실행하는 것입니다.
        // 인텐트는 그들 사이에 데이터를 주고 받기 위한 용도로도 쓰입니다.x
        Intent intent = new Intent(context, MainActivity.class);
        intent.putExtra("from", from);
        intent.putExtra("contents", contents);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP | Intent.FLAG_ACTIVITY_CLEAR_TOP);

        context.startActivity(intent);
    }
}
