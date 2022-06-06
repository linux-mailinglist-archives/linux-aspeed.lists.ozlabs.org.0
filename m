Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BE953E531
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 16:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGxRx2Wyxz3bkG
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 00:57:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=U21+DJBV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGxRk2xN7z2yJQ
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 00:57:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=b4Cas22YvXWguCl9MVadBf58XqwkKGzOV9uwbfM1yR0=; b=U21+DJBV8mG13ppaokHm7Fb782
	OisPxobgWgrV3MykMs2B+HToa2G1JM8pcAFqzM07rEr0ATq9w9Sgxa2/XMIGwX5mBViDPvpOq+KzI
	Y4lHufHP+NFfTNoHoJEylR4cq5df1AgldeQsNDiiokFwetdgyvySGJuts+/oEnW0jn9QcN2hx2Jt7
	c9f9VBlnPJYYenO9AqdCBxw0mumB42POg+bnjGKBJqTffldzk+2LovdMaymR4aJusfnILmUzuV393
	BT0ZUra2b3MHizDhn5B8UK0ahq7z372i0+DghbNc+ivcsBBEEusRfRv/z2/yFcDGTRTGBC9P14xxj
	tD0LVESQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEA5-005Taq-S8; Mon, 06 Jun 2022 14:56:59 +0000
Message-ID: <8f4176e7-87b0-1cf9-bcef-6a423d17fd6a@infradead.org>
Date: Mon, 6 Jun 2022 07:56:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 5/5] crypto: aspeed: add HACE crypto driver
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220606064935.1458903-1-neal_liu@aspeedtech.com>
 <20220606064935.1458903-6-neal_liu@aspeedtech.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220606064935.1458903-6-neal_liu@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi--

On 6/5/22 23:49, Neal Liu wrote:
> diff --git a/drivers/crypto/aspeed/Kconfig b/drivers/crypto/aspeed/Kconfig
> index 17b800286a51..5e4d18288bf1 100644
> --- a/drivers/crypto/aspeed/Kconfig
> +++ b/drivers/crypto/aspeed/Kconfig
> @@ -20,3 +20,19 @@ config CRYPTO_DEV_ASPEED_HACE_HASH
>  	  hash driver.
>  	  Supports multiple message digest standards, including
>  	  SHA-1, SHA-224, SHA-256, SHA-384, SHA-512, and so on.
> +
> +config CRYPTO_DEV_ASPEED_HACE_CRYPTO
> +        bool "Enable ASPEED Hash & Crypto Engine (HACE) crypto"
> +        depends on CRYPTO_DEV_ASPEED

The 2 lines above should be indented with one tab instead of multiple spaces.

> +	select CRYPTO_AES
> +	select CRYPTO_DES
> +	select CRYPTO_ECB
> +	select CRYPTO_CBC
> +	select CRYPTO_CFB
> +	select CRYPTO_OFB
> +	select CRYPTO_CTR
> +	help
> +	  Select here to enable ASPEED Hash & Crypto Engine (HACE)
> +	  crypto driver.
> +	  Supports AES/DES symmetric-key encryption and decryption
> +	  with ECB/CBC/CFB/OFB/CTR options.

-- 
~Randy
