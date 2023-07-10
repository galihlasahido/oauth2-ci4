<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use ParagonIE\EasyRSA\EasyRSA;
use ParagonIE\EasyRSA\PrivateKey;
use phpseclib\Crypt\RSA as seclibrsa;
use ParagonIE\EasyRSA\Exception\InvalidKeyException;
use ParagonIE\EasyRSA\Exception\InvalidCiphertextException;

class MyPasswordFilter implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
      $json = $request->getJSON();
      $privateKey = new PrivateKey(file_get_contents(WRITEPATH.'privkey.pem'));
      $password = $this->rsaDecrypt(base64_decode($json->password), $privateKey);	
      $json->password = $password;
      return $json;
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Do something here
    }   
    
    private function rsaDecrypt($ciphertext, PrivateKey $rsaPrivateKey) {
      $rsa = EasyRSA::getRsa(seclibrsa::ENCRYPTION_PKCS1);
      $rsa->encryptionMode = seclibrsa::ENCRYPTION_PKCS1;

      $return = $rsa->loadKey($rsaPrivateKey->getKey());
      if ($return === false) {
          throw new InvalidKeyException('Decryption failed due to invalid key');
      }

      $return = @$rsa->decrypt($ciphertext);
      if (!\is_string($return)) {
          throw new InvalidCiphertextException('Decryption failed');
      }
      return $return;
    }
  

}