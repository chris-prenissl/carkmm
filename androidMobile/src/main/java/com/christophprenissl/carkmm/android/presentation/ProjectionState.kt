package com.christophprenissl.carkmm.android.presentation

import androidx.car.app.connection.CarConnection
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier

@Composable
fun ProjectionState(carConnectionType: Int, modifier: Modifier) {
    val text = when (carConnectionType) {
        CarConnection.CONNECTION_TYPE_NOT_CONNECTED -> "Not projecting"
        CarConnection.CONNECTION_TYPE_NATIVE -> "Running on Android Automotive OS"
        CarConnection.CONNECTION_TYPE_PROJECTION -> "Projecting"
        else -> "Unknown connection type"
    }

    Text(
        text = text,
        style = MaterialTheme.typography.bodyMedium,
        modifier = modifier
    )
}