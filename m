Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A1753E535
	for <lists+linux-aspeed@lfdr.de>; Mon,  6 Jun 2022 16:58:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGxT86zkfz3blV
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 00:58:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kl++s1Qq;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kl++s1Qq;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGxT51Jq1z3bm0
	for <linux-aspeed@lists.ozlabs.org>; Tue,  7 Jun 2022 00:58:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vDRclcjga8kGMaQ++bzfqjieH/Oopd34EHTMUp62p0w=; b=kl++s1QqBSCGGS515hpbBboz0R
	OnKKNW7bq+COAZEFWPlZWPixaZdt38PrmyMbE8UTZH8ZoX0sQWG9nACQuh3bNQdQOk6KcWBS24psn
	ohEhY7YoFGQbwRMKayE947pRRIH5FkJF4vYwpyOZ9BvX9s8q0Dx8gm9TH4epY2oyLT7LX5OP8YS+z
	mwQL8I8SKC4wpEV4YGGLNHB1hUXiKcdJxo14DZjBGdfMLcBlPx0jynqMxGNkD5ldaboXAGXL95eGT
	RMC53OZRWCb57vBcNmvHxNddub59uZwVROKf+8RnfeM5nRBBKL4019rKc+RBxfr55TIbPScmeTGP4
	/OWw8NfQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEBd-005Tbs-BR; Mon, 06 Jun 2022 14:58:33 +0000
Message-ID: <d0366136-428f-3af2-996e-a3d168b570e3@infradead.org>
Date: Mon, 6 Jun 2022 07:58:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/5] crypto: aspeed: Add HACE hash driver
Content-Language: en-US
To: Neal Liu <neal_liu@aspeedtech.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Johnny Huang <johnny_huang@aspeedtech.com>
References: <20220606064935.1458903-1-neal_liu@aspeedtech.com>
 <20220606064935.1458903-2-neal_liu@aspeedtech.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220606064935.1458903-2-neal_liu@aspeedtech.com>
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

Hi,

On 6/5/22 23:49, Neal Liu wrote:
> diff --git a/drivers/crypto/aspeed/Kconfig b/drivers/crypto/aspeed/Kconfig
> new file mode 100644
> index 000000000000..17b800286a51
> --- /dev/null
> +++ b/drivers/crypto/aspeed/Kconfig
> @@ -0,0 +1,22 @@
> +config CRYPTO_DEV_ASPEED
> +	tristate "Support for Aspeed cryptographic engine driver"
> +	depends on ARCH_ASPEED
> +	help
> +	Hash and Crypto Engine (HACE) is designed to accelerate the
> +	throughput of hash data digest, encryption and decryption.
> +
> +	Select y here to have support for the cryptographic driver
> +	available on Aspeed SoC.

All of the help text above (following the 'help' line) should be indented
with one tab + 2 spaces, as is done in the help text below here.

> +
> +config CRYPTO_DEV_ASPEED_HACE_HASH
> +        bool "Enable ASPEED Hash & Crypto Engine (HACE) hash"
> +        depends on CRYPTO_DEV_ASPEED

The 2 lines above should be indented with one tab instead of multiple spaces.

> +	select CRYPTO_SHA1
> +	select CRYPTO_SHA256
> +	select CRYPTO_SHA512
> +	select CRYPTO_HMAC
> +	help
> +	  Select here to enable ASPEED Hash & Crypto Engine (HACE)
> +	  hash driver.
> +	  Supports multiple message digest standards, including
> +	  SHA-1, SHA-224, SHA-256, SHA-384, SHA-512, and so on.

-- 
~Randy
