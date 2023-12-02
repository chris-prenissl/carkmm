package com.christophprenissl.carkmm.android.carappservice.presentation

import android.text.Spannable
import android.text.SpannableString
import androidx.car.app.CarContext
import androidx.car.app.Screen
import androidx.car.app.model.Action
import androidx.car.app.model.CarLocation
import androidx.car.app.model.Distance
import androidx.car.app.model.DistanceSpan
import androidx.car.app.model.ItemList
import androidx.car.app.model.Metadata
import androidx.car.app.model.Place
import androidx.car.app.model.PlaceListMapTemplate
import androidx.car.app.model.PlaceMarker
import androidx.car.app.model.Row
import androidx.car.app.model.Template
import com.christophprenissl.carkkm.android.carappservice.R

class MainScreen(carContext: CarContext) : Screen(carContext) {
    override fun onGetTemplate(): Template {
        return PlaceListMapTemplate.Builder()
            .setTitle(R.string.app_name.toString())
            .setHeaderAction(Action.APP_ICON)
            .setItemList(
                ItemList.Builder()
                    .addItem(
                        Row.Builder()
                            .setTitle("Bonzenviertel")
                            .addText(
                                SpannableString("  ").apply {
                                    setSpan(
                                        DistanceSpan.create(
                                            Distance.create(Math.random() * 100, Distance.UNIT_KILOMETERS)
                                        ), 0, 1, Spannable.SPAN_INCLUSIVE_EXCLUSIVE
                                    )
                                }
                            )
                            .setOnClickListener {}
                            .setMetadata(
                                Metadata.Builder()
                                    .setPlace(Place.Builder(CarLocation.create(49.20587,12.05387))
                                        .setMarker(PlaceMarker.Builder().build())
                                        .build())
                                    .build()
                            )
                            .build()
                    )
                    .build()
            ).build()
    }
}