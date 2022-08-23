package com.example.flutterawesome

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterView
import io.flutter.plugin.common.MethodChannel

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        var flutterView = FlutterView(this)
        setContentView(R.layout.activity_main)

        findViewById<TextView>(R.id.title).setOnClickListener {
//            startActivity(FlutterActivity.NewEngineIntentBuilder(FirstFlutterActivity::class.java).build(this))
            var createDefaultIntent = FlutterActivity.createDefaultIntent(this)
            createDefaultIntent.setClass(this,FirstFlutterActivity::class.java)
            startActivity(createDefaultIntent)
        }
//        findViewById<FrameLayout>(R.id.flutter_container).addView(
//            flutterView, FrameLayout.LayoutParams(
//                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT
//            )
//        )
    }
}