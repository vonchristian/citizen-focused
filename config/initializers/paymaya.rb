Paymaya.configure do |config|
  config.mode = :sandbox
  config.payment_vault_public_key = 'pk_abc123'
  config.payment_vault_secret_key = 'sk_abc123'
  config.checkout_public_key = 'pk_abc123'
  config.checkout_secret_key = 'sk_abc123'
end
