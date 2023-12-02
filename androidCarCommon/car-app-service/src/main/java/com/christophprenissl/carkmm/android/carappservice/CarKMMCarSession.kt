package com.christophprenissl.carkmm.android.carappservice

import android.content.Intent
import androidx.car.app.Screen
import androidx.car.app.Session
import com.christophprenissl.carkmm.android.carappservice.presentation.MainScreen

class CarKMMCarSession : Session() {
    override fun onCreateScreen(intent: Intent): Screen {
        return MainScreen(carContext)
    }
}