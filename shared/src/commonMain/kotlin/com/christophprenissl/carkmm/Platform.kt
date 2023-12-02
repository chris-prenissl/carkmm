package com.christophprenissl.carkmm

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform