import { StatusBar } from 'expo-status-bar';
import React, { useEffect, useState } from 'react';
import { useNavigation } from '@react-navigation/native';
import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';
import CookieService from "./../services/CookieService";
import * as Linking from 'expo-linking';
import * as Location from 'expo-location';
import axios from 'axios';

export default function App() {
  // button
  const navigation = useNavigation();
  const [logado, setLogado] = useState(false);
  const [location, setLocation] = useState(null);
  const [errorMsg, setErrorMsg] = useState(null);

  useEffect(() => {
    (async () => {
      setLogado(CookieService.get("email")? true : false);
    })();
  }, []);


  return (
    <View style={styles.container}>
      <Text>Bem vindo</Text>

      {logado == false ?
        <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Login')}>
          <Text style={styles.text}>Login</Text>
        </TouchableOpacity>
      : null }

      <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Inicio')}>
        <Text style={styles.text}>ir para a pagina inicio</Text>
      </TouchableOpacity>

      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  button:{
    backgroundColor: 'blue',
    padding: 10,
    margin: 20,
    width: 200,
    color: 'white',
    borderRadius: 40,
    alignItems: 'center',
    justifyContent: 'center',
  },
  text:{
    fontWeight: 'bold',
    fontSize: 20,
  }
});
