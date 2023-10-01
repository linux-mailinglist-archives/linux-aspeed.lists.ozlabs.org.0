Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA27B498E
	for <lists+linux-aspeed@lfdr.de>; Sun,  1 Oct 2023 22:14:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=z24KQFyG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzFfm4sWqz3vXf
	for <lists+linux-aspeed@lfdr.de>; Mon,  2 Oct 2023 07:14:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=z24KQFyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=clabbe@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzFfb4BQvz3c5L
	for <linux-aspeed@lists.ozlabs.org>; Mon,  2 Oct 2023 07:14:12 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4066692ad35so12118295e9.1
        for <linux-aspeed@lists.ozlabs.org>; Sun, 01 Oct 2023 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696191244; x=1696796044; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5gdKKBRI8HMjzMvfQFYDp6loku3qgrG9OQcfyEaG8Y=;
        b=z24KQFyGNb/CnzaydCm5S/ccHpMRRS1h6G3/uRagwNVo9gvivIBP8mJZjhjqvcqRhL
         o4qaMSgFa8HSr/TyHoNkmyLwicGHVZ4kdaWApRUY/d41T5gQ1j3D+CvVIGYCWNHlbWAP
         +XZ/tgPq3MPFgbDIBxrom4nQwR+UmdYYQcCqfCRp1VYqOt15ngG65yUYWNadZ19uYXKb
         bls1LVTPILsEBltTHuwZQx5UOg+b5VWynD+LKGkjJmQAVvo99rzdj/n1ocH2x8j4j/21
         9iao/7MfINnnxPgi8MEwrSIv4diDcb0hE+AwedOg4LL2ouI7KSELxojKEK0+ZVAuut6b
         J2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696191244; x=1696796044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S5gdKKBRI8HMjzMvfQFYDp6loku3qgrG9OQcfyEaG8Y=;
        b=LBYXxPpsZBqFKtPj7rv8otsTLS/09jqA+ENYKVh+8NEl0CF4kr2SkA6m0+cbwVccek
         JXf4yzEU4h9VLNbcZA/1T7RbZHnSrEl6z/puBzhLQqKGH+EoY/91tz5tXmdrrC2/dkRn
         h9ceKHFKTwDg6RZqlnqIssbbW9/8M/MFdBtz6b955btaU013/iO/4s4wIAD/ihGnMX/l
         QTo8tGHv8PuMl0axxbliXNd5znSpWQFuTXZY/+uJfY+8N8o4rOMKze7h5zlVq3NE+bcI
         HhEjWk9HmIW7DdoCux1C/KfGHoFy3debSmNRtnvAh40EiS2UFRUdU1Zp8ac7cOElVh5y
         EZng==
X-Gm-Message-State: AOJu0YxAk6f1E7lYy2kUFrs3zVPwelUZYyp/enDcj6wM/OZaNINxi/4v
	OpRBHb5Fh/6RBECtke2wMhOC5Q==
X-Google-Smtp-Source: AGHT+IF8bQPLl/XkMjCK1GATpgLR3obNH1Yh0AnESH4KmxjbQ0tap497/YPYQvdhCNXwcL8NlYsgvQ==
X-Received: by 2002:a5d:63cb:0:b0:319:6e3f:d5f0 with SMTP id c11-20020a5d63cb000000b003196e3fd5f0mr9162433wrw.44.1696191244674;
        Sun, 01 Oct 2023 13:14:04 -0700 (PDT)
Received: from arnold.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j6-20020a5d6046000000b003259b068ba6sm6141665wrt.7.2023.10.01.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:14:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: andrew@aj.id.au,
	davem@davemloft.net,
	herbert@gondor.apana.org.au,
	joel@jms.id.au,
	john.allen@amd.com,
	neal_liu@aspeedtech.com,
	thomas.lendacky@amd.com
Subject: [PATCH] crypto: Move akcipher_request_cast helper to crypto header
Date: Sun,  1 Oct 2023 20:13:57 +0000
Message-Id: <20231001201357.2052949-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

There is already 2 driver implementing their own akcipher_request_cast.
In the future there will be also rockchip and allwinner driver that will
need this.
This is sufficient to move it in crypto headers.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/aspeed/aspeed-acry.c | 6 ------
 drivers/crypto/ccp/ccp-crypto-rsa.c | 6 ------
 include/crypto/akcipher.h           | 7 +++++++
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 247c568aa8df..ecb6e984367b 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -137,12 +137,6 @@ enum aspeed_rsa_key_mode {
 	ASPEED_RSA_DATA_MODE,
 };
 
-static inline struct akcipher_request *
-	akcipher_request_cast(struct crypto_async_request *req)
-{
-	return container_of(req, struct akcipher_request, base);
-}
-
 static int aspeed_acry_do_fallback(struct akcipher_request *req)
 {
 	struct crypto_akcipher *cipher = crypto_akcipher_reqtfm(req);
diff --git a/drivers/crypto/ccp/ccp-crypto-rsa.c b/drivers/crypto/ccp/ccp-crypto-rsa.c
index a14f85512cf4..32c9f524f3d5 100644
--- a/drivers/crypto/ccp/ccp-crypto-rsa.c
+++ b/drivers/crypto/ccp/ccp-crypto-rsa.c
@@ -19,12 +19,6 @@
 
 #include "ccp-crypto.h"
 
-static inline struct akcipher_request *akcipher_request_cast(
-	struct crypto_async_request *req)
-{
-	return container_of(req, struct akcipher_request, base);
-}
-
 static inline int ccp_copy_and_save_keypart(u8 **kpbuf, unsigned int *kplen,
 					    const u8 *buf, size_t sz)
 {
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index 670508f1dca1..4b6e610db18d 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -498,4 +498,11 @@ static inline int crypto_akcipher_set_priv_key(struct crypto_akcipher *tfm,
 
 	return alg->set_priv_key(tfm, key, keylen);
 }
+
+static inline struct akcipher_request *
+	akcipher_request_cast(struct crypto_async_request *req)
+{
+	return container_of(req, struct akcipher_request, base);
+}
+
 #endif
-- 
2.41.0

