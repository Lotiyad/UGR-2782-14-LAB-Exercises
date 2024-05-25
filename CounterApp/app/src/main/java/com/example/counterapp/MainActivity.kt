package com.example.counterapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.example.counterapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        // Set up button click listeners
        binding.btnIncrement.setOnClickListener {
            count++
            binding.tvCount.text = count.toString()
        }

        binding.btnDecrement.setOnClickListener {
            count--
            binding.tvCount.text = count.toString()
        }

        binding.btnReset.setOnClickListener {
            count = 0
            binding.tvCount.text = count.toString()
        }
    }
}
