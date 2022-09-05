Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD55AD0F0
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 13:05:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLlzL6XDtz30L5
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 21:05:02 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLlz804wvz3cFm
	for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Sep 2022 21:04:50 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oV9tz-001AdR-4B; Mon, 05 Sep 2022 21:04:28 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Mon, 05 Sep 2022 19:04:27 +0800
Date: Mon, 5 Sep 2022 19:04:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v2] crypto: aspeed: fix build module error
Message-ID: <YxXXuyNrQIcMZBLI@gondor.apana.org.au>
References: <20220905025433.1610696-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905025433.1610696-1-neal_liu@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 05, 2022 at 10:54:33AM +0800, Neal Liu wrote:
>
> diff --git a/drivers/crypto/aspeed/Makefile b/drivers/crypto/aspeed/Makefile
> index 421e2ca9c53e..3be78cec0ecb 100644
> --- a/drivers/crypto/aspeed/Makefile
> +++ b/drivers/crypto/aspeed/Makefile
> @@ -1,9 +1,6 @@
> +hace-hash-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) := aspeed-hace.o aspeed-hace-hash.o
> +hace-crypto-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) := aspeed-hace.o aspeed-hace-crypto.o
> +
>  obj-$(CONFIG_CRYPTO_DEV_ASPEED) += aspeed_crypto.o
> -aspeed_crypto-objs := aspeed-hace.o	\
> -		      $(hace-hash-y)	\
> +aspeed_crypto-objs := $(hace-hash-y)	\
>  		      $(hace-crypto-y)

Does this still build if both HASH and CRYPTO are off?

I think this it's best if you do:

hace-hash-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) := aspeed-hace-hash.o
hace-crypto-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) := aspeed-hace-crypto.o

obj-$(CONFIG_CRYPTO_DEV_ASPEED) += aspeed_crypto.o
aspeed_crypto-objs := aspeed-hace.o	\
		      $(hace-hash-y)	\
		      $(hace-crypto-y)

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
