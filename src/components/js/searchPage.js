  export default {
    data:() => ({
      dialog: false,
      dialogDelete: false,
      headers: [
        {
          text: '名前',
          align: 'start',
          sortable: false,
          value: 'name',
        },
        { text: '社員ID', value: 'employee_id' },
        { text: 'フリガナ', value: 'frigana' },
        { text: '入社年月日', value: 'entering_date' },
        { text: '資格ID', value: 'certification_id' },
		    { text: '資格', value: 'certification_name' },
        { text: '取得年月日', value: 'get_date' },
        { text: '奨励金日付', value: 'encourage_date' },
        { text: '操作', value: 'actions', sortable: false },
      ],
      desserts: [],
      editedIndex: -1,
      editedItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0,
      },
      defaultItem: {
        name: '',
        calories: 0,
        fat: 0,
        carbs: 0,
        protein: 0,
      },
    }),

    computed: {
      formTitle () {
        return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
      },
    },

    watch: {
      dialog (val) {
        val || this.close()
      },
      dialogDelete (val) {
        val || this.closeDelete()
      },
    },

    created () {
      this.initialize()
    },

    methods: {
      initialize () {
          let _this = this;
  
          _this.$http.get('/employeeCertifications').then((res)=>{
        if(res.status == 200){
          console.log('res.data ', res.data)
          this.desserts = res.data;
        }else{
            alert('エラーが発生しました。');
        }
            console.log(res);
        },(err)=>{
            alert('APIエラーが発生しました。');
            console.log(err);
        });
      },

      newItem () {
        this.$emit('handleSwitch','input')
      },
      editItem (item) {
        this.editedIndex = this.desserts.indexOf(item)
        this.editedItem = Object.assign({}, item)
        console.log(this.editedItem)
        this.$emit('handleSwitch','input', this.editedItem)
      },

      /*deleteItem (item) {
        this.editedIndex = this.desserts.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialogDelete = true
      },*/
	  
	  deleteItem (item) {
        let _this = this;
	    //_this.editedIndex = this.desserts.indexOf(item);
        //_this.editedItem = Object.assign({}, item);
		_this.dialogDelete = true
  
          _this.$http.post('/deleteEmployeeCertification',item).then((res)=>{
            if(res.status == 200){
              _this.regInfo = res.data;
              if(_this.regInfo.status == 1){
                  // alert('提出成功しました。');
                  this.$emit('handleSwitch','search')
              }else{
                  alert('删除失敗しました。');
              }
            }else{
                alert('エラーが発生しました。');
            }
              console.log('res.data ', res.data)
            },(err)=>{
                alert('APIエラーが発生しました。');
                console.log(err);
            });
      },

      deleteItemConfirm () {
        this.desserts.splice(this.editedIndex, 1)
        this.closeDelete()
      },

      close () {
        this.dialog = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      closeDelete () {
        this.dialogDelete = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },

      save () {
        if (this.editedIndex > -1) {
          Object.assign(this.desserts[this.editedIndex], this.editedItem)
        } else {
          this.desserts.push(this.editedItem)
        }
        this.close()
      },
    },
  }
