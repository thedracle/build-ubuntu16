fn main() {
    let runtime = tokio::runtime::Runtime::new().unwrap();
    let response = runtime.spawn(async {
        let response = reqwest::get("https://www.rust-lang.org").await?;
        let body = response.text().await?;
        println!("{}", body);
        Ok::<(), reqwest::Error>(())
    });
    let _result = runtime.block_on(response).unwrap();
}
