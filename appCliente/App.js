import { StatusBar } from 'expo-status-bar';
import React, {useState, useEffect} from 'react';
import { StyleSheet, Text, View, TouchableOpacity, PermissionsAndroid } from 'react-native';
import NavigationContainer from './Routes';
import CookieService from "./services/CookieService";

export default function App() {

  return (
      <NavigationContainer />
  );
}
