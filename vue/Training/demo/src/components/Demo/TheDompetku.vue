<script>
import { ref, reactive } from 'vue'
import MyTodoItem from './MyTodoItem.vue'

const list = ref([
  { id: 0, text: 'Sarapan pagi : ',  qty: 12.000, },
  { id: 1, text: 'Makan Siang: ',  qty: 15.000 }, 
  { id: 2, text: 'Ongkos Perjalanan : ',  qty: 30000 },
])

// const listText = ref('')
const counterId = ref(3)
const todoText = ref('')

const submitFn = () => {
  list.value.push({ id: counterId, text: todoText.value })
  counterId.value++
} 

</script>

<template>
  <div>
        <Input v-model="todoText" />
        <button @click="submitFn">Add</button>
        <ol>
            <MyTodoItem v-for="item in list" :todo="item" :key="item.id"></MyTodoItem>
        </ol>
    </div>
 </template>