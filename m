Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B937691BB1
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 10:41:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCpdx01zQz3f4x
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 20:41:25 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=formenos.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
Received: from formenos.hmeau.com (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCpdp17mkz3cdk
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 20:41:16 +1100 (AEDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pQPtp-009bul-2c; Fri, 10 Feb 2023 17:40:58 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Feb 2023 17:40:57 +0800
Date: Fri, 10 Feb 2023 17:40:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] crypto: aspeed - Fix modular aspeed-acry
Message-ID: <Y+YRKdWUA4jjoUZ2@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

When aspeed-acry is enabled as a module it doesn't get built at
all.  Fix this by adding it to obj-m.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/aspeed/Makefile b/drivers/crypto/aspeed/Makefile
index 24284d812b79..15862752c053 100644
--- a/drivers/crypto/aspeed/Makefile
+++ b/drivers/crypto/aspeed/Makefile
@@ -6,4 +6,6 @@ aspeed_crypto-objs := aspeed-hace.o	\
 		      $(hace-hash-y)	\
 		      $(hace-crypto-y)
 
-obj-$(CONFIG_CRYPTO_DEV_ASPEED_ACRY) += aspeed-acry.o
+aspeed_acry-$(CONFIG_CRYPTO_DEV_ASPEED_ACRY) += aspeed-acry.o
+
+obj-$(CONFIG_CRYPTO_DEV_ASPEED) += $(aspeed_acry-y)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
