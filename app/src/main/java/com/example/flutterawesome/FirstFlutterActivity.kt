package com.example.flutterawesome;

import android.os.Bundle;
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant;

class FirstFlutterActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(flutterEngine!!)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "common.test.channel")
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "show_toast" -> {
                    Log.d("channel_log", "show_toast")

                    if (call.argument<Int>("type") == 1) {
                        Toast.makeText(
                            this,
                            call.argument<String>("content"),
                            Toast.LENGTH_SHORT
                        ).show()
                        result.success(call.argument<String>("content") + "success");
                    } else {
                        result.error(
                            "1001",
                             "show ${call.argument<String>("content")} error",
                            "not support toast type"
                        )
                    }

                }
                else -> Log.d("channel_log", "method not found")
            }
        }
    }


}