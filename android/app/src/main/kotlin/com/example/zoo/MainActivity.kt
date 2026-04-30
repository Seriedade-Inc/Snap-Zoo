package com.example.zoo

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.google.ar.core.ArCoreApk

class MainActivity: FlutterActivity() {
    private val CHANNEL = "ar_check"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                if (call.method == "isARSupported") {
                    val availability = ArCoreApk.getInstance().checkAvailability(this)

                    val isSupported = availability.isSupported
                    result.success(isSupported)
                } else {
                    result.notImplemented()
                }
            }
    }
}