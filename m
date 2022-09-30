Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9FC5F0495
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Sep 2022 08:14:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf0LH0qDCz3c4x
	for <lists+linux-aspeed@lfdr.de>; Fri, 30 Sep 2022 16:14:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf0LC1NVgz2xG8
	for <linux-aspeed@lists.ozlabs.org>; Fri, 30 Sep 2022 16:14:11 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oe9HV-00A53u-JO; Fri, 30 Sep 2022 16:13:54 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 Sep 2022 14:13:53 +0800
Date: Fri, 30 Sep 2022 14:13:53 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH] crypto: aspeed: fix build error when only
 CRYPTO_DEV_ASPEED is enabled
Message-ID: <YzaJIYl9PW+d48/l@gondor.apana.org.au>
References: <20220919063705.358225-1-neal_liu@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919063705.358225-1-neal_liu@aspeedtech.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 19, 2022 at 02:37:05PM +0800, Neal Liu wrote:
> Fix build error within the following configs setting:
> - CONFIG_CRYPTO_DEV_ASPEED=y
> - CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH is not set
> - CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO is not set
> 
> Error messages:
> make[4]: *** No rule to make target 'drivers/crypto/aspeed/aspeed_crypto.o'
> , needed by 'drivers/crypto/aspeed/built-in.a'.
> make[4]: Target '__build' not remade because of errors.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> ---
>  drivers/crypto/aspeed/Kconfig  | 3 +--
>  drivers/crypto/aspeed/Makefile | 7 ++++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
