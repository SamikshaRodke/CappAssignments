function checkMail(){
        return new Promise((resolve, reject)=>{
            if(Math.random()>0.5){
                resolve("Mail recevied");
            }  
            else{
                reject("Mail not recevied");
            }
    });
}
     
    checkMail().then((mail)=>{
        console.log("Success :) ", mail);     
    }).catch((err)=>{
        console.log("Error !!", err);  
    }).finally(()=>{
        console.log("done"); 
    })

    const p1 = Promise.resolve(555);
    p1.then((v)=>{
        console.log(v);
    });


    let count = new Promise(function(resolve,reject){
        reject('rejected');
    });

    count.then(function realValue(v){
        console.log(v);
    }).catch(
        function unreal(v){
            console.log(v);
        }
    );
    