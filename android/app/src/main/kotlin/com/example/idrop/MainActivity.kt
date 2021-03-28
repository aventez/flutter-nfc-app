package com.example.idrop

import android.net.Uri
import android.nfc.NdefMessage
import android.nfc.NdefRecord
import android.nfc.NfcAdapter
import android.nfc.Tag
import android.nfc.tech.NdefFormatable
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(), NfcAdapter.ReaderCallback {
    private val CHANNEL = "idrop.lib/nfc"
    private val DEFAULT_READER_FLAGS = NfcAdapter.FLAG_READER_NFC_A or NfcAdapter.FLAG_READER_NFC_B or NfcAdapter.FLAG_READER_NFC_F or NfcAdapter.FLAG_READER_NFC_V;
    private lateinit var url: Uri;

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
            if (call.method == "writeNfc") {
                val urlString: String = call.arguments as String;
                url = Uri.parse(urlString);

                val bundle = Bundle();
                val adapter = NfcAdapter.getDefaultAdapter(activity);
                if (adapter == null) {
                    result.success(false);
                } else {
                    adapter.enableReaderMode(activity, this, DEFAULT_READER_FLAGS, bundle);
                    result.success(true);
                }
            } else {
                result.notImplemented()
            }
        }
    }

    override fun onTagDiscovered(tag: Tag) {
        val formatable: NdefFormatable = NdefFormatable.get(tag);
        val uriRecord = NdefRecord.createUri(url);
        val message = NdefMessage(uriRecord);

        formatable.connect();
        formatable.format(message);
        formatable.close();
    }
}
