Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 471EC973B5B
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Sep 2024 17:19:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X36n00rbMz2ymr
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Sep 2024 01:19:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.204
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725981553;
	cv=none; b=l1maQjSb87dEwnyGtzUuwC7kwtCd8HKCmHt0pj8LphnRTZ6ZVl/QoAKyAU/v0yVUCBs7nJRD3GwjsDWG9TvRGBRO3Ha6UqOMqLXnmRWQw8nRuuxaeJgo8NJT09oN/1vR007c7bGhjD9LfV0pDFpuzOJ+fwip7a4auPdvV2leDmuV5iLW8MVUgtUj8E6zt2NsePnr/XDne5lyAw4ctqeNYtog2xlxhNs9OhbSWSKpyVIysKM5Q3e2ae1KZYsuzPd5/8o+1kYW4vlRNhWRtWViNsCU14iJ1dZcakMlKnQwvpjdhw+jI0mxdfFZxVXHHXNrrrVkQaV1BUZZ/XOXZWIPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725981553; c=relaxed/relaxed;
	bh=bH18GJzoWKGwGvHMd7iUmCtoqaYG1kF4qrJPIO4whE0=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=N672AP+JtpQHMzDx53kmyeiZaIcDrJjXZlyeJCtEC0gB5ZR4104Kw+YK9olESdqLcasf4pCA1KYST2ltwFhZj1kJNzxyWTiqgA3cqCqEjbakxEUEH1eVngtPu8rrVim3UIMFhz5CZAnKhfwQvM+F8u776JKRuO4YGmMLUsF+5ka7evkSG6zOs3CcdkLyspXV+BdDKIC9BmmviNb88kuFbZLL5qHjWtzYicVGnonBXeomwuHWQ9bJMSmLrfEnkAjAz7ctpAx1wMtw+64GMZzPAZ/EqKWiWnM9KziPI0FTARr7EFSNeGpRuVnOhrCaz9jraaUFagRRTnMf0MzNbxSCMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.204; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=83.223.95.204; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X36mx4dCYz2xs7
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Sep 2024 01:19:13 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id EB19510191783;
	Tue, 10 Sep 2024 17:19:09 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id BBD7760A8B01;
	Tue, 10 Sep 2024 17:19:09 +0200 (CEST)
X-Mailbox-Line: From 65b1bb40a042cc73ba486e0ed41d3f6bfd083929 Mon Sep 17 00:00:00 2001
Message-ID: <65b1bb40a042cc73ba486e0ed41d3f6bfd083929.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:20 +0200
Subject: [PATCH v2 10/19] crypto: drivers - Drop sign/verify operations
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
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
Cc: Marek Behun <kabel@kernel.org>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Zhiqi Song <songzhiqi1@huawei.com>, William Qiu <william.qiu@starfivetech.com>, linux-aspeed@lists.ozlabs.org, Stephan Mueller <smueller@chronox.de>, Neal Liu <neal_liu@aspeedtech.com>, Ignat Korchagin <ignat@cloudflare.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, David Howells <dhowells@redhat.com>, Varad Gautam <varadgautam@google.com>, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Jia Jie Ho <jiajie.ho@starfivetech.com>, Longfang Liu <liulongfang@huawei.com>, Denis Kenzior <denkenz@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The drivers aspeed-acry.c, hpre_crypto.c and jh7110-rsa.c purport to
implement sign/verify operations for raw (unpadded) "rsa".

But there is no such thing as message digests generally need to be
padded according to a predefined scheme (such as PSS or PKCS#1) to
match the size of the usually much larger RSA keys.

The bogus sign/verify operations defined by these drivers are never
called but block removal of sign/verify from akcipher_alg.  Drop them.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/crypto/aspeed/aspeed-acry.c         | 2 --
 drivers/crypto/hisilicon/hpre/hpre_crypto.c | 2 --
 drivers/crypto/starfive/jh7110-rsa.c        | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index b4613bd4ad96..7a1e153733e1 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -601,8 +601,6 @@ static struct aspeed_acry_alg aspeed_acry_akcipher_algs[] = {
 		.akcipher.base = {
 			.encrypt = aspeed_acry_rsa_enc,
 			.decrypt = aspeed_acry_rsa_dec,
-			.sign = aspeed_acry_rsa_dec,
-			.verify = aspeed_acry_rsa_enc,
 			.set_pub_key = aspeed_acry_rsa_set_pub_key,
 			.set_priv_key = aspeed_acry_rsa_set_priv_key,
 			.max_size = aspeed_acry_rsa_max_size,
diff --git a/drivers/crypto/hisilicon/hpre/hpre_crypto.c b/drivers/crypto/hisilicon/hpre/hpre_crypto.c
index 764532a6ca82..bdd7e1df8a06 100644
--- a/drivers/crypto/hisilicon/hpre/hpre_crypto.c
+++ b/drivers/crypto/hisilicon/hpre/hpre_crypto.c
@@ -2004,8 +2004,6 @@ static void hpre_curve25519_exit_tfm(struct crypto_kpp *tfm)
 }
 
 static struct akcipher_alg rsa = {
-	.sign = hpre_rsa_dec,
-	.verify = hpre_rsa_enc,
 	.encrypt = hpre_rsa_enc,
 	.decrypt = hpre_rsa_dec,
 	.set_pub_key = hpre_rsa_setpubkey,
diff --git a/drivers/crypto/starfive/jh7110-rsa.c b/drivers/crypto/starfive/jh7110-rsa.c
index a778c4846025..d109c743f076 100644
--- a/drivers/crypto/starfive/jh7110-rsa.c
+++ b/drivers/crypto/starfive/jh7110-rsa.c
@@ -565,8 +565,6 @@ static void starfive_rsa_exit_tfm(struct crypto_akcipher *tfm)
 static struct akcipher_alg starfive_rsa = {
 	.encrypt = starfive_rsa_enc,
 	.decrypt = starfive_rsa_dec,
-	.sign = starfive_rsa_dec,
-	.verify = starfive_rsa_enc,
 	.set_pub_key = starfive_rsa_set_pub_key,
 	.set_priv_key = starfive_rsa_set_priv_key,
 	.max_size = starfive_rsa_max_size,
-- 
2.43.0

