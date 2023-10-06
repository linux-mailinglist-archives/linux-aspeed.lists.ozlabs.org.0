Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 258577BC14C
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Oct 2023 23:39:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WtHKJAnu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2MJq63rGz3fQR
	for <lists+linux-aspeed@lfdr.de>; Sat,  7 Oct 2023 08:39:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WtHKJAnu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2MJg46hSz3bPM
	for <linux-aspeed@lists.ozlabs.org>; Sat,  7 Oct 2023 08:39:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6669461B53;
	Fri,  6 Oct 2023 21:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD9BC433C9;
	Fri,  6 Oct 2023 21:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696628368;
	bh=2XziYcmjBQwlHQ8WEyRONsKUONRLFG9IYWm+kWdCfdQ=;
	h=From:To:Cc:Subject:Date:From;
	b=WtHKJAnumyWwN6Ciax6SvYhzJ3vyq+rbg41/4VP1xSVJ+NxVzQTDBqaNxGZ/CHUVC
	 F4fhrev+XNLFauaBsfhPEWAz9JxqCtVMe2QrrT6J5S0fjfpgMwdrO4mFuEZ2vvVA1r
	 +rW+efnyEjSqtWic+5vfK3grmgwgkgh94fO2UFilHOx2FnXHX1xVIJ4feCeIohqbPy
	 DRt4WjmxEjU4JS7mDmABQc/mioPuz38BsvFP/OxBKJZNt5jQwmOVPqlBRUspcYqfRe
	 Nv2spYh1jdV9w0i3BOqNp9hQRfRWiprXa6QI8RgdRqtAC8hggmEW7cL5lLWkEfVjm/
	 63N6yj698wwjg==
Received: (nullmailer pid 333873 invoked by uid 1000);
	Fri, 06 Oct 2023 21:39:26 -0000
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal_liu@aspeedtech.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] crypto: aspeed-hace: Use device_get_match_data()
Date: Fri,  6 Oct 2023 16:39:17 -0500
Message-Id: <20231006213917.333702-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/crypto/aspeed/aspeed-hace.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
index 8f7aab82e1d8..d9da04fb816e 100644
--- a/drivers/crypto/aspeed/aspeed-hace.c
+++ b/drivers/crypto/aspeed/aspeed-hace.c
@@ -12,11 +12,9 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #ifdef CONFIG_CRYPTO_DEV_ASPEED_DEBUG
 #define HACE_DBG(d, fmt, ...)	\
@@ -101,7 +99,6 @@ static const struct of_device_id aspeed_hace_of_matches[] = {
 static int aspeed_hace_probe(struct platform_device *pdev)
 {
 	struct aspeed_engine_crypto *crypto_engine;
-	const struct of_device_id *hace_dev_id;
 	struct aspeed_engine_hash *hash_engine;
 	struct aspeed_hace_dev *hace_dev;
 	int rc;
@@ -111,14 +108,13 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 	if (!hace_dev)
 		return -ENOMEM;
 
-	hace_dev_id = of_match_device(aspeed_hace_of_matches, &pdev->dev);
-	if (!hace_dev_id) {
+	hace_dev->version = (uintptr_t)device_get_match_data(&pdev->dev);
+	if (!hace_dev->version) {
 		dev_err(&pdev->dev, "Failed to match hace dev id\n");
 		return -EINVAL;
 	}
 
 	hace_dev->dev = &pdev->dev;
-	hace_dev->version = (unsigned long)hace_dev_id->data;
 	hash_engine = &hace_dev->hash_engine;
 	crypto_engine = &hace_dev->crypto_engine;
 
-- 
2.40.1

