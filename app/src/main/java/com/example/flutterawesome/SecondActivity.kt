package com.example.flutterawesome

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class SecondActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_second)
        startActivity(createDefaultIntent(this))
    }
}