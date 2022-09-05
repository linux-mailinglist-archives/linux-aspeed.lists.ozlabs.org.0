Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B945AC8EA
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 04:56:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLY7b40n4z2yyd
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Sep 2022 12:56:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71; helo=twspam01.aspeedtech.com; envelope-from=neal_liu@aspeedtech.com; receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (unknown [211.20.114.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLY7P3XqTz2xHk
	for <linux-aspeed@lists.ozlabs.org>; Mon,  5 Sep 2022 12:55:55 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
	by twspam01.aspeedtech.com with ESMTP id 2852YhcH045911;
	Mon, 5 Sep 2022 10:34:43 +0800 (GMT-8)
	(envelope-from neal_liu@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 5 Sep
 2022 10:54:37 +0800
From: Neal Liu <neal_liu@aspeedtech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller"
	<davem@davemloft.net>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@aj.id.au>
Subject: [PATCH v2] crypto: aspeed: fix build module error
Date: Mon, 5 Sep 2022 10:54:33 +0800
Message-ID: <20220905025433.1610696-1-neal_liu@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 2852YhcH045911
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
Cc: BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

If CONFIG_MODULES=y and CONFIG_CRYPTO_DEV_ASPEED=m,
build modpost would be failed.

Error messages:
  ERROR: modpost: "aspeed_register_hace_hash_algs"
  [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
  ERROR: modpost: "aspeed_unregister_hace_hash_algs"
  [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!

Change build sequence to fix this.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
v2: Remove redundant obj- lines.

 drivers/crypto/aspeed/Makefile | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/aspeed/Makefile b/drivers/crypto/aspeed/Makefile
index 421e2ca9c53e..3be78cec0ecb 100644
--- a/drivers/crypto/aspeed/Makefile
+++ b/drivers/crypto/aspeed/Makefile
@@ -1,9 +1,6 @@
+hace-hash-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) := aspeed-hace.o aspeed-hace-hash.o
+hace-crypto-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) := aspeed-hace.o aspeed-hace-crypto.o
+
 obj-$(CONFIG_CRYPTO_DEV_ASPEED) += aspeed_crypto.o
-aspeed_crypto-objs := aspeed-hace.o	\
-		      $(hace-hash-y)	\
+aspeed_crypto-objs := $(hace-hash-y)	\
 		      $(hace-crypto-y)
-
-obj-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) += aspeed-hace-hash.o
-hace-hash-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_HASH) := aspeed-hace-hash.o
-obj-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) += aspeed-hace-crypto.o
-hace-crypto-$(CONFIG_CRYPTO_DEV_ASPEED_HACE_CRYPTO) := aspeed-hace-crypto.o
-- 
2.25.1

