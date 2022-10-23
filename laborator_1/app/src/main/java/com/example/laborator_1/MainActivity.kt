package com.example.laborator_1

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import com.example.laborator_1.R

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

    }

    fun getSet(view: View) {

        val editTxt = findViewById<EditText>(R.id.editText);
        val string = editTxt.text.toString();
        var counter = 0
        val space = ' '
        var flag = 0
        val word_list = string.split(space)
        for (i in word_list){
            flag = 0
            for (j in i){
                if ((j == 'a')||(j == 'A'))
                    flag = 1
            }
            if (flag == 1){
                counter ++
            }
        }
        if (counter == 1) {
            val txtView = findViewById<TextView>(R.id.textView).apply {
                text = counter.toString().plus(" cuvant contine litera 'A'")
            }
        }
        else if (counter == 0) {
            val txtView = findViewById<TextView>(R.id.textView).apply {
                text = " nici un cuvant nu contine litera 'A'"
            }
        }
        else {
            val txtView = findViewById<TextView>(R.id.textView).apply {
                text = counter.toString().plus(" cuvinte contin litera 'A'")
            }
        }
    }
}