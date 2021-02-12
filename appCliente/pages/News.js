import React, { useEffect, useState } from 'react';
import { StyleSheet, Text, View, TouchableOpacity, Image, TextInput, ScrollView } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import CookieService from "./../services/CookieService";
// import { useNavigationParam } from 'react-navigation-hooks';
import axios from 'axios';

function News({route,navigation}){
  const [news, setNews ] = useState([]);
  const { id } = route.params;

  // pega dados da API web
  useEffect(() => {
    // sobe para o servidor a localizacao
    // ALTERE o host para o ip da maquina, porta 8000 roda o servidor da API
    axios.get('http://192.168.1.40:8000/api/news/list?id='+id,{
    "headers": {
      "Authorization": "Bearer " + CookieService.get("access_token"),
      "content-type": "application/json",
    },
    }).then(response => {
      console.log(response.data);
      setNews(response.data);
    })
  }, []);

  return (
      <ScrollView>
        <View style={styles.card}>
          <Text style={styles.title}>{news.title}</Text>
          <Text style={styles.text}>{news.content}</Text>
        </View>
        <TouchableOpacity style={styles.button} onPress={() => navigation.navigate("NewsAll")}>
          <Text style={styles.textButton}>Voltar</Text>
        </TouchableOpacity>
      </ScrollView>
  );
};

const styles = StyleSheet.create({
    card:{
      backgroundColor: '#dedcdc',
      margin: 5,
      padding: 10,
      alignItems: 'center'
    },
    title: {
        fontSize: 20,
        fontWeight: 'bold',
        marginBottom: 20,
    },
    text:{
      fontSize: 20,
    },
    textButton: {
        color: '#fff',
        fontWeight: 'bold',
    },
    button:{
      marginTop: 20,
      alignItems: 'center',
      backgroundColor: '#0000ff',
      padding: 10,
    },
});

export default News;
