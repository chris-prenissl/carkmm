package com.christophprenissl.carkmm.android.presentation

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.car.app.connection.CarConnection
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.getValue
import androidx.compose.runtime.livedata.observeAsState
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.christophprenissl.carkmm.AppConstants

class MainActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            val carConnectionType by CarConnection(this).type.observeAsState(initial = -1)
            Surface(
                modifier = Modifier.fillMaxSize(),
                color = MaterialTheme.colorScheme.background
            ) {
                Column {
                    Text(
                        text = AppConstants.MetaData.APP_NAME,
                        style = MaterialTheme.typography.displayLarge,
                        modifier = Modifier.padding(8.dp)
                    )
                    ProjectionState(
                        carConnectionType = carConnectionType,
                        modifier = Modifier.padding(8.dp)
                    )
                }
            }
        }
    }
}