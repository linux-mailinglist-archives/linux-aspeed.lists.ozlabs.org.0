Return-Path: <linux-aspeed+bounces-4458-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +JXEOvDlUmpkVQMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4458-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Jul 2026 02:55:12 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11021743577
	for <lists+linux-aspeed@lfdr.de>; Sun, 12 Jul 2026 02:55:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kV4m75yN;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4458-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4458-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gyRtj6fPGz2yVv;
	Sun, 12 Jul 2026 10:55:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783681663;
	cv=none; b=IHUgJjLGowbqbuaW0Zi7EV9KjuKk6AJcF8XU/U5wPthhFMXY7Or2VEYHr/fAgOksS7aTRP36FUPy1WWmowzfQcSL9VLGYtT1CyKoBtBh+uOEotQpFtC/0SXZTypU5h3gKsWk2tARqz2enK+dQCdBG1fj/NL9H4qru1oKmMp5mwixtbUq/yM6oWD/Xcytv/K+mkDvtMz1xrEbny/yUR+aXQP2uEoBQ0hFFo4Mg+I2zBof3ACeJ7cl60gZbgyVTmNuFwYhrxbfU7T22OdHUMmQWAc/EvELMdVDL3Qs5xMmZy5yfPZUFkUY15OTEPAcP13pb7CBZTiZVC8gMBfN8rKc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783681663; c=relaxed/relaxed;
	bh=QMK3eVT0/oAQlr0eGKAyS3VOV21a/B1AmoQDrAJ9a3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZWzipEszOTGImaaCpLI0pxJG2xpEnPeWn0/BtTZsvTHA+UExVkaaLpZxQ79WsorChA0k9mpjCtRkjoi7LxwA3HXZ7+ZA4EvhhKr1sqHvIOWMx5kMFvdhFW6aJXo9FhrQbN5PspukzOLe7rDrs93EX4w8ItEzWXS/OGed32vDJbElT+h5oNTeIkxRUm+PaebywhwCCn2vw17jU7hc+yAqKJ6f0TP4osR3O9mGoNFau6+h8ZJnF1yHWXvOxzd339uaeuKdXFv9cAnH4MmAIoq2qgbwAuO2uSQ8+Wq82tt4FbMaNIHjSXh++xCplmqRk9lROSNG9UJpPU16mkE3At1vQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kV4m75yN; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=ahmisaranrao@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gxTZQ1jrnz2yS4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2026 21:07:41 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-381018b9375so1024523a91.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jul 2026 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681659; x=1784286459; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QMK3eVT0/oAQlr0eGKAyS3VOV21a/B1AmoQDrAJ9a3s=;
        b=kV4m75yNMNUXKP2yRb9jNqyK6zEDQG77X16S7wrtKZ1nk+ZoPMb4w5WBUG1gE26bZI
         l6qylM8II7kY5vfaeGhhNvvTr9fGpIbzpwI6hLcfCdrPJFESoxJMhwFfBaSjiLzWkjDc
         rI9x9149YmusW4cikroj3NJe5DgKj2FCLqFWinlLX56iG/HNNab7Xw4iMnVJTxyfnb+2
         swJie4Z8eBJ7SDANU3i0uc8EFo+nPmjmy9v6I9hDRmZfp0s2I4TUnjuswIbnF2u6SJh+
         NOoQGkWHlRfANr8qar2w7cHVXbsoutiibTVO8FhKzQ1er04YAEcAJwrdo9CTYy9IDiRw
         TuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681659; x=1784286459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMK3eVT0/oAQlr0eGKAyS3VOV21a/B1AmoQDrAJ9a3s=;
        b=IFhD3Vl+V3q6GZwwKcToq8hf1H9sdDrD+emZjGd4zi01tYtjcXLU8g6CWigw5X4FMe
         c0Q3Ib5SurV7oDbMBT6EaW6bIG+0coLG6X/kBP9/qsBQERLtCBwA/uaOmXYGLb7usw5T
         /fDULsZAf4kace/7RhjyRWEMnUtBcXJFjFl9CkG0U+SxW9QiSsrhEOkrT3Wzr98SyiF5
         LMQP6GzhvMmhVr+wlfITn+lcHT6LxPk7NZCKgc6AUYwT8gvOYhL+PTxTTjiGI+lYdDgr
         gKM9hBsrGh/7UJWprcdjplh/ftSS6RClD/vsHb2OB45USniq26pqVjgx+RD/CyOp1+m2
         Ntfw==
X-Forwarded-Encrypted: i=1; AHgh+RoyhAo/ajBGP0GSh1E1f19wGM46Yqc4vlmM/coqStNNXEDPtApxoJl3vDPNf6onAQqnJe7qI6kPVaJCMes=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8+m/gaYbNYMZ5Js28hK8LRkgfgq6cVPtaR2Wh5fHqJTr/8Z7p
	rpPs2LeH8jJ7J7AIjl1ozkARccU++0a7Ayk8PLAmvvk/XJh0+lQ/swui
X-Gm-Gg: AfdE7clCql7MfjwrY9jZApXmrrQ5ufWSUIO3p4vZW3fcAMjAkZ7KHTLN+632o7i23Lj
	3+uvGOtBAsMPpbr3pTCmv3STHfOG9XKdMmlexkSM6ibFKzxB6OLdKXwXSJJWoABuAPasmAzRbv/
	4BZm1AYNz23CGFisDuGTimM1oLURQxXOWZKGuQGs5kNgx4sdawXMyn0RRn3Nk1YZoWwnW5AcgGT
	ZBxlxqelt1aUgBjZNuHt5Exs9IdhplUUE+8jQsj3/AoORjN5B9fkQZkDUQW+lMKfhyJa7OR8cK2
	/YkE3IYkqcnZEM5PEwWZbg0xTQrhZZZ17q1Nsg7HM8ubUz5+/6zaTzWO1wFSAomkCPoUNFN9l+p
	BYDP+g3RBQwqjsUvUrJwldnlDH9kngtCZTh1cw8QhOIB53+/gNGxqql4nV3oNV/lDj2eHQFyp9f
	f0BaTwGkFSw9gHNSOtCjF7zJpxfLg=
X-Received: by 2002:a17:90b:564f:b0:37f:d6d5:8e8c with SMTP id 98e67ed59e1d1-3893d91fed4mr10524502a91.0.1783681659012;
        Fri, 10 Jul 2026 04:07:39 -0700 (PDT)
Received: from ahmi-PC.. ([2401:4900:88f4:a225:f83:5ab4:33ab:8313])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311838c9235sm35061109eec.21.2026.07.10.04.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:07:38 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>
Cc: Neal Liu <neal_liu@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	YueHaibing <yuehaibing@huawei.com>,
	linux-aspeed@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH] crypto: aspeed: Propagate platform_get_irq() errors
Date: Fri, 10 Jul 2026 16:37:29 +0530
Message-ID: <20260710110729.224090-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DATE_IN_PAST(1.00)[37];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4458-lists,linux-aspeed=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[aspeedtech.com,jms.id.au,codeconstruct.com.au,huawei.com,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ahmisaranrao@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:neal_liu@aspeedtech.com,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:yuehaibing@huawei.com,m:linux-aspeed@lists.ozlabs.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ahmisaranrao@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ahmisaranrao@gmail.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:from_smtp,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11021743577

platform_get_irq() returns a positive IRQ number on success and a negative
error code on failure. aspeed_acry_probe() and aspeed_hace_probe()
already detect negative returns, but both convert every failure to -ENXIO.

Return the original error code so callers can handle errors such as
-EPROBE_DEFER correctly.

Fixes: 2f1cf4e50c95 ("crypto: aspeed - Add ACRY RSA driver")
Fixes: 70513e1d6559 ("crypto: aspeed - Fix check for platform_get_irq() errors")
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
 drivers/crypto/aspeed/aspeed-acry.c | 2 +-
 drivers/crypto/aspeed/aspeed-hace.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index 5993bcba9716..301612556a76 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -728,7 +728,7 @@ static int aspeed_acry_probe(struct platform_device *pdev)
 	/* Get irq number and register it */
 	acry_dev->irq = platform_get_irq(pdev, 0);
 	if (acry_dev->irq < 0)
-		return -ENXIO;
+		return acry_dev->irq;
 
 	rc = devm_request_irq(dev, acry_dev->irq, aspeed_acry_irq, 0,
 			      dev_name(dev), acry_dev);
diff --git a/drivers/crypto/aspeed/aspeed-hace.c b/drivers/crypto/aspeed/aspeed-hace.c
index 3fe644bfe037..1f9afa002ae8 100644
--- a/drivers/crypto/aspeed/aspeed-hace.c
+++ b/drivers/crypto/aspeed/aspeed-hace.c
@@ -127,7 +127,7 @@ static int aspeed_hace_probe(struct platform_device *pdev)
 	/* Get irq number and register it */
 	hace_dev->irq = platform_get_irq(pdev, 0);
 	if (hace_dev->irq < 0)
-		return -ENXIO;
+		return hace_dev->irq;
 
 	rc = devm_request_irq(&pdev->dev, hace_dev->irq, aspeed_hace_irq, 0,
 			      dev_name(&pdev->dev), hace_dev);
-- 
2.43.0


