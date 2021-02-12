import React, { useEffect, useState } from 'react';
import { StyleSheet, Text, View, TouchableOpacity, Image, TextInput, ScrollView } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import CookieService from "./../services/CookieService";
import axios from 'axios';
import News from './News';

function NewsAll() {
  const [news, setNews ] = useState([]);

  // button
  const navigation = useNavigation();

  // pega dados da API web
  useEffect(() => {
    // sobe para o servidor a localizacao
    // ALTERE o host para o ip da maquina, porta 8000 roda o servidor da API
    axios.get('http://192.168.1.40:8000/api/news/list/all',{
    "headers": {
      "Authorization": "Bearer " + CookieService.get("access_token"),
      "content-type": "application/json",
    },
    }).then(response => {
      setNews(response.data.map(noticia => ({
        label: noticia.title,
        key: noticia.idNews,
        value: noticia.idNews
      })));
    })
  }, []);

  return (
    <>
      <ScrollView>
        <View style={styles.inputContainer}>
          {news.map(function(d){
            return (
              <View style={styles.card} onStartShouldSetResponder={() =>
                navigation.navigate('News', {id: d.key})
              }>
                <Text key={d.key} style={styles.title}>{d.label}</Text>
                <Text style={styles.littleText}>clique para ver a noticia</Text>
              </View>
            )
          })}
          <TouchableOpacity style={styles.button} onPress={() => navigation.navigate("Login")}>
            <Text style={styles.textButton}>Voltar</Text>
          </TouchableOpacity>
        </View>
      </ScrollView>
    </>
  );
};

const styles = StyleSheet.create({
    inputContainer: {
        margin: 20,
        alignItems: 'stretch',
        justifyContent: 'center'
    },
    card:{
      backgroundColor: '#dedcdc',
      margin: 5,
      padding: 10,
      alignItems: 'center'
    },
    title: {
        fontSize: 20,
    },
    littleText:{
      marginTop: 10,
      color: '#adaaaa',
    },
    input: {
        marginTop: 10,
        height: 60,
        backgroundColor: '#fff',
        borderRadius: 10,
        paddingHorizontal: 24,
        fontSize: 16,
        alignItems: 'stretch',
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

export default NewsAll;
