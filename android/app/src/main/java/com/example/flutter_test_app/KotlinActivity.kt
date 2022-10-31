package com.example.flutter_test_app

import android.annotation.SuppressLint
import android.net.Uri
import android.os.Bundle
import android.view.MenuItem
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import java.nio.charset.Charset

class KotlinActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_kotlin)
        supportActionBar!!.title = getString(R.string.title)
        supportActionBar!!.setDisplayHomeAsUpEnabled(true)
        supportActionBar!!.setDisplayShowHomeEnabled(true)
        init();
    }

    @SuppressLint("SetTextI18n")
    private fun init() {
        val firstTV = findViewById<TextView>(R.id.first_textview)
        val secondTV = findViewById<TextView>(R.id.second_textview)
        val thirdTV = findViewById<TextView>(R.id.third_textview)

        // get intent data
        val extras = intent.extras;
        if (extras != null) {
            val firstCounter = extras.getInt("first_counter")
            val secondCounter = extras.getInt("second_counter")
            val thirdCounter = extras.getInt("third_counter")
            val image = byteArrayOf(extras.getByte("image"))
            val s = String(image, Charset.forName("UTF-8"))
            val uri: Uri = Uri.parse(s)
            //findViewById<ImageView>(R.id.first_imageview).setImageURI(uri)
            findViewById<ImageView>(R.id.first_imageview).setImageDrawable(
                ContextCompat.getDrawable(this, R.drawable.rice)
            )
            findViewById<ImageView>(R.id.second_imageview).setImageDrawable(
              ContextCompat.getDrawable(this, R.drawable.salad)
            )
            findViewById<ImageView>(R.id.third_imageview).setImageDrawable(
                ContextCompat.getDrawable(this, R.drawable.business)
            )
            // set data to views
            firstTV.text = "A: $firstCounter times"
            secondTV.text = "B: $secondCounter times"
            thirdTV.text = "C: $thirdCounter times"
        }
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when(item.itemId){
            android.R.id.home -> {
                finish();
                true
            }
            else -> {
                super.onOptionsItemSelected(item)
            }
        }
    }
}