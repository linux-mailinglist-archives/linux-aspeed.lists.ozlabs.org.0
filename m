Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7F15BC2F3
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Sep 2022 08:39:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWFQZ6Qpxz30MT
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Sep 2022 16:39:34 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWFQT2HGQz2xrr
	for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Sep 2022 16:39:27 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 28J6GVap079123;
	Mon, 19 Sep 2022 14:16:32 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Sep
 2022 14:37:13 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH] crypto: aspeed: fix build error when only CRYPTO_DEV_ASPEED is enabled
Date: Mon, 19 Sep 2022 14:37:05 +0800
Message-ID: <20220919063705.358225-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 28J6GVap079123
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

Fix build error within the following configs setting:
- CONFIG_CRYPTO_DEV_ASPEED=y
- CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH is not set
- CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO is not set

Error messages:
make[4]: *** No rule to make target 'drivers/crypto/aspeed/aspeed_crypto.o'
, needed by 'drivers/crypto/aspeed/built-in.a'.
make[4]: Target '__build' not remade because of errors.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
---
 drivers/crypto/aspeed/Kconfig  | 3 +--
 drivers/crypto/aspeed/Makefile | 7 ++++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/aspeed/Kconfig b/drivers/crypto/aspeed/Kconfig
index ae3eb0eb57f6..ae2710ae8d8f 100644
--- a/drivers/crypto/aspeed/Kconfig
+++ b/drivers/crypto/aspeed/Kconfig
@@ -1,6 +1,7 @@
 config CRYPTO_DEV_ASPEED
 	tristate "Support for Aspeed cryptographic engine driver"
 	depends on ARCH_ASPEED || COMPILE_TEST
+	select CRYPTO_ENGINE
 	help
 	  Hash and Crypto Engine (HACE) is designed to accelerate the
 	  throughput of hash data digest, encryption and decryption.
@@ -20,7 +21,6 @@ config CRYPTO_DEV_ASPEED_DEBUG
 config CRYPTO_DEV_ASPEED_HACE_HASH
 	bool "Enable Aspeed Hash & Crypto Engine (HACE) hash"
 	depends on CRYPTO_DEV_ASPEED
-	select CRYPTO_ENGINE
 	select CRYPTO_SHA1
 	select CRYPTO_SHA256
 	select CRYPTO_SHA512
@@ -34,7 +34,6 @@ config CRYPTO_DEV_ASPEED_HACE_HASH
 config CRYPTO_DEV_ASPEED_HACE_CRYPTO
 	bool "Enable Aspeed Hash & Crypto Engine (HACE) crypto"
 	depends on CRYPTO_DEV_ASPEED
-	select CRYPTO_ENGINE
 	select CRYPTO_AES
 	select CRYPTO_DES
 	select CRYPTO_ECB
diff --git a/drivers/crypto/aspeed/Makefile b/drivers/crypto/aspeed/Makefile
index 3be78cec0ecb..a0ed40ddaad1 100644
--- a/drivers/crypto/aspeed/Makefile
+++ b/drivers/crypto/aspeed/Makefile
@@ -1,6 +1,7 @@
-hace-hash-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) := aspeed-hace.o aspeed-hace-hash.o
-hace-crypto-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) := aspeed-hace.o aspeed-hace-crypto.o
+hace-hash-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) := aspeed-hace-hash.o
+hace-crypto-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) := aspeed-hace-crypto.o
 
 obj-$(CONFIG_CRYPTO_DEV_ASPEED) += aspeed_crypto.o
-aspeed_crypto-objs := $(hace-hash-y)	\
+aspeed_crypto-objs := aspeed-hace.o	\
+		      $(hace-hash-y)	\
 		      $(hace-crypto-y)
-- 
2.25.1

