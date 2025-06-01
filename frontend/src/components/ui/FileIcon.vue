<template>
  <div class="file-icon" :class="[extension]">
    <svg v-if="extension === 'pdf'" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
      <path fill="#E74C3C" d="M181.9 256.1c-5-16-4.9-46.9-2-46.9 8.4 0 7.6 36.9 2 46.9zm-1.7 47.2c-7.7 20.2-17.3 43.3-28.4 62.7 18.3-7 39-17.2 62.9-21.9-12.7-9.6-24.9-23.4-34.5-40.8zM86.1 428.1c0 .8 13.2-5.4 34.9-40.2-6.7 6.3-29.1 24.5-34.9 40.2zM248 160h136v328c0 13.3-10.7 24-24 24H24c-13.3 0-24-10.7-24-24V24C0 10.7 10.7 0 24 0h200v136c0 13.3 10.7 24 24 24zm-8 171.8c-20-12.2-33.3-29-42.7-53.8 4.5-18.5 11.6-46.6 6.2-64.2-4.7-29.4-42.4-26.5-47.8-6.8-5 18.3-.4 44.1 8.1 77-11.5 27.6-28.7 64.6-40.8 85.8-.1 0-.1.1-.2.1-27.1 13.9-73.9 44.5-73.9 44.5V448h248.2v-92.8c-43.3-26.7-73.9-72.3-83.5-103.4zM377 105L279 7c-4.5-4.5-10.6-7-17-7h-6v128h128v-6.1c0-6.3-2.5-12.4-7-16.9zm-74.1 255.3c4.1-2.7-2.5-11.9-42.8-9 37.1 15.8 42.8 9 42.8 9z"/>
    </svg>
    
    <svg v-else-if="extension === 'doc' || extension === 'docx'" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
      <path fill="#2B579A" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm57.1 120H305c7.7 0 13.4 7.1 11.7 14.7l-38 168c-1.2 5.5-6.1 9.3-11.7 9.3h-38c-5.5 0-10.3-3.8-11.6-9.1-25.8-103.5-20.8-81.2-25.6-110.5h-.5c-1.1 14.3-2.4 17.4-25.6 110.5-1.3 5.3-6.1 9.1-11.6 9.1H117c-5.6 0-10.5-3.9-11.7-9.4l-37.8-168c-1.7-7.5 4-14.6 11.7-14.6h24.5c5.7 0 10.7 4 11.8 9.7 15.6 78 20.1 109.5 21 122.2 1.6-10.2 7.3-32.7 29.4-122.7 1.3-5.4 6.1-9.1 11.7-9.1h29.1c5.6 0 10.4 3.8 11.7 9.2 24 100.4 28.8 124 29.6 129.4-.2-11.2-2.6-17.8 21.6-129.2 1-5.6 5.9-9.5 11.5-9.5zM384 121.9v6.1H256V0h6.1c6.4 0 12.5 2.5 17 7l97.9 98c4.5 4.5 7 10.6 7 16.9z"/>
    </svg>
    
    <svg v-else-if="extension === 'jpg' || extension === 'jpeg' || extension === 'png'" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
      <path fill="#4CAF50" d="M369.9 97.9L286 14C277 5 264.8-.1 252.1-.1H48C21.5 0 0 21.5 0 48v416c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V131.9c0-12.7-5.1-25-14.1-34zM332.1 128H256V51.9l76.1 76.1zM48 464V48h160v104c0 13.3 10.7 24 24 24h104v288H48zm32-48h224V288l-23.5-23.5c-4.7-4.7-12.3-4.7-17 0L176 352l-39.5-39.5c-4.7-4.7-12.3-4.7-17 0L80 352v64zm48-240c-26.5 0-48 21.5-48 48s21.5 48 48 48 48-21.5 48-48-21.5-48-48-48z"/>
    </svg>
    
    <svg v-else xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
      <path fill="#9E9E9E" d="M224 136V0H24C10.7 0 0 10.7 0 24v464c0 13.3 10.7 24 24 24h336c13.3 0 24-10.7 24-24V160H248c-13.2 0-24-10.8-24-24zm160-14.1v6.1H256V0h6.1c6.4 0 12.5 2.5 17 7l97.9 98c4.5 4.5 7 10.6 7 16.9z"/>
    </svg>
    
    <span class="extension">{{ extension }}</span>
  </div>
</template>

<script>
export default {
  props: {
    extension: {
      type: String,
      required: true,
      validator: value => value.length <= 5
    }
  }
}
</script>

<style scoped>
.file-icon {
  width: 40px;
  height: 40px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  position: relative;
  border-radius: 4px;
  overflow: hidden;
}

.file-icon svg {
  width: 24px;
  height: 24px;
}

.extension {
  position: absolute;
  bottom: 0;
  width: 100%;
  text-align: center;
  font-size: 8px;
  font-weight: bold;
  color: white;
  background-color: rgba(0, 0, 0, 0.6);
  padding: 2px 0;
  text-transform: uppercase;
}

/* Цвета фона для разных типов файлов */
.file-icon.pdf {
  background-color: #FFEBEE;
}

.file-icon.doc,
.file-icon.docx {
  background-color: #E3F2FD;
}

.file-icon.jpg,
.file-icon.jpeg,
.file-icon.png {
  background-color: #E8F5E9;
}

.file-icon.xls,
.file-icon.xlsx {
  background-color: #F1F8E9;
}

.file-icon.zip,
.file-icon.rar {
  background-color: #FFF3E0;
}

.file-icon.default {
  background-color: #F5F5F5;
}
</style>
