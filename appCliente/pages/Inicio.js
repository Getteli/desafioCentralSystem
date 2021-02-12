import { StatusBar } from 'expo-status-bar';
import React, { useEffect, useState } from 'react';
import { useNavigation, StackActions, NavigationActions } from '@react-navigation/native';
import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';
import * as Linking from 'expo-linking';
import CookieService from "./../services/CookieService";
import * as Location from 'expo-location';
import axios from 'axios';

function Inicio() {

  // button
  const navigation = useNavigation();
  const email = CookieService.get("email") ?? '';

  // ao carregar pega a localizacao, mas dentro tem um setInterval para a cada x segundos
  useEffect(() => {
    const interval = setInterval(() => {
      (async () => {
        let { status } = await Location.requestPermissionsAsync();
        if (status !== 'granted') {
          setErrorMsg('Permission to access location was denied');
          return;
        }
        let logado = CookieService.get("email")? true : false;

        if(logado)
        {
          let locationAPI = await Location.getCurrentPositionAsync({});

          // console.log("Latitude: " + locationAPI.coords.latitude + " Longitude: " + locationAPI.coords.longitude);
          // sobe para o servidor a localizacao
          // ALTERE o host para o ip da maquina, porta 8000 roda o servidor da API
          axios.post('http://192.168.1.40:8000/api/location/post',(locationAPI.coords),{
          "headers": {
            "Authorization": "Bearer " + CookieService.get("access_token"),
            "content-type": "application/json",
          },
          })
          .then(function(response) {
            console.log(response.data);
          })
          .catch(function(error) {
            // console.log(error);
          });
        }
        else{
          console.log("nao esta logado, nao pega localizacao");
        }

      })();
      return () => clearInterval(interval);
    }, 60000);
  }, []);

  useEffect(() => {
    // verifica se ta logado
    if (!CookieService.get("email")) {
      alert("faça login para usar o aplicativo.");
      // limpa
      CookieService.remove("email");
      CookieService.remove("access_token");
      // limpa e volta a rota
      navigation.reset({
          index: 0,
          routes: [{ name: 'Home' }],
      });
    }
  }, []);

  function logout() {
    // limpa
    CookieService.remove("email");
    CookieService.remove("access_token");
    // limpa e volta a rota
    navigation.reset({
        index: 0,
        routes: [{ name: 'Home' }],
    });
  }

  return (
    <View style={styles.container}>
    <Text>Bem vindo novamente {email}</Text>
      <TouchableOpacity style={styles.button} onPress={() =>
        navigation.reset({
            index: 0,
            routes: [{ name: 'Home' }],
        })
      }>
        <Text style={styles.text}>Home</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.button} onPress={logout}>
        <Text style={styles.text}>Sair</Text>
      </TouchableOpacity>

      <Text>Tire foto e envie para o servidor</Text>
      <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Photo')}>
        <Text style={styles.text}>Tirar foto</Text>
      </TouchableOpacity>

      <TouchableOpacity style={styles.button} onPress={() => navigation.navigate("NewsAll")}>
        <Text style={styles.textButton}>Ver Todas as Noticias</Text>
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
  },
  text:{
    fontWeight: 'bold',
    fontSize: 20,
  }
});

export default Inicio;
