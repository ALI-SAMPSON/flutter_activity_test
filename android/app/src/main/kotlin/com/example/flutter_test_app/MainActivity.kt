package com.example.flutter_test_app

import android.content.Intent
import android.os.Bundle

//import io.flutter.app.FlutterActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.jetbrains.annotations.NotNull
import java.nio.charset.Charset

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.flutter_test_app/intentChannel"
    private lateinit var channel : MethodChannel
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(@NotNull flutterEngine: FlutterEngine){
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        // receiving data from the flutter
        channel.setMethodCallHandler{ call, result ->
            if(call.method.equals("StartActivity")){
                // get arguments passed from flutter view
                val arguments = call.arguments<Map<String, Int>>() as Map<String, Int>;
                val intent = Intent(this, KotlinActivity::class.java)
                //intent.putExtra("image", arguments["image"] )
                intent.putExtra("first_counter", arguments["first_counter"])
                intent.putExtra("second_counter", arguments["second_counter"])
                intent.putExtra("third_counter", arguments["third_counter"])
                startActivity(intent)
                result.success("KotlinActivityStarted")
            }
            else{
                result.notImplemented()
            }
        }
        super.configureFlutterEngine(flutterEngine);
    }
}