Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB971494753
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jan 2022 07:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfXlC4c4lz30Nb
	for <lists+linux-aspeed@lfdr.de>; Thu, 20 Jan 2022 17:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZnWF/g0Y;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f31;
 helo=mail-qv1-xf31.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZnWF/g0Y; dkim-atps=neutral
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfXl72TW2z2ymt
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jan 2022 17:33:22 +1100 (AEDT)
Received: by mail-qv1-xf31.google.com with SMTP id h16so5686524qvk.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Jan 2022 22:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iIEWNGzZIA6PB46g/KfYUL/qJ1uv2/3umNgQBvWeius=;
 b=ZnWF/g0YBiWZOJ3Nk5G3ASaKTVMmyzTx6Z7TAwTbGHQajtgQkgxj6Ojo5wdgRYyKQq
 zqUadvm0ARZ7Xiz3U59Ef5rTQuJufMl8Tv80PdqS471EcF2gTI0vMPyLKj2UeO83528i
 PbxHxfXwn5SdB/lXSA2TZzEaGCIrH5ICxkJsWRr2ZeAVYU0PERMt5gB71gIb4MhIi4OW
 tif5agA2qjFk8gjXAQxRu/Eg5IE5TPlRPdJiCrbBO2q8qbBT5DfK5l0CqDERp+u1u3Fq
 m3xVlNubN4gLHGzwD2kgKTqTOreRjRER2bZ+KaCn4sT5vpxZ2oFukpCGiCw4zI3QmdkT
 Cx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=iIEWNGzZIA6PB46g/KfYUL/qJ1uv2/3umNgQBvWeius=;
 b=ke1xONRqQXWwYaNykHs5+hjz3mdIx5lIrSlXyN3k1ipo/0X5+BSRcPehSd1VMeSB0B
 LIo6PU0nwKo+6fd+8cDfwUEzDOcgc0ekXxykAxaZ6SsPit/te8NJggNvDHytGY5hohB2
 4WNF5OQ4TGxirKrK+b0LrH5Lel6jehtKmxtPCmuqtPMvO9+c9P+pbAITE6Cd7vkFfF3X
 YWI6r5/pyqNVIw6gViFtXJ9mXI+yjwxcJyUxIgBCJJSaOqKABdM4ej1/hYPmQ/dQYWvK
 o0IHg5fd+vq6sSkStY1nLcfZJeXzK5dNPtX0k75MObAQzGqTdEiXcjD79hyyG6eBEpwW
 PrKA==
X-Gm-Message-State: AOAM530EY1mJBY8rWIh5fJQmGaJn/alXX2kfjzAO5GZ0QvRhHjRhuxZ5
 8JU/uSqTP+KbLcYB4dmbZeg=
X-Google-Smtp-Source: ABdhPJxgLAF74UeUG/Gg3x7vyAGYXpPkEOS9JDkdvIfYUIFVpipTUSTqlf4WakSFwwmAwg+S0ma3dw==
X-Received: by 2002:a05:6214:ca3:: with SMTP id
 s3mr27526096qvs.9.1642660397430; 
 Wed, 19 Jan 2022 22:33:17 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id j186sm1053109qkb.57.2022.01.19.22.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 22:33:16 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Eddie James <eajames@linux.ibm.com>,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH] ARM: dts: aspeed: rainier: Remove SPI NOR controllers
Date: Thu, 20 Jan 2022 17:03:06 +1030
Message-Id: <20220120063307.63898-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Early Rainier builds had SPI NOR as a fallback boot device when eMMC
was not programmed. Most systems don't have the NOR populated, so remove
it from the device tree as it is not used.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 --------------------
 1 file changed, 24 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 652c866c14dc..43bacb16d336 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -2360,30 +2360,6 @@ &mac3 {
 	use-ncsi;
 };
 
-&fmc {
-	status = "okay";
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "bmc";
-		spi-max-frequency = <50000000>;
-#include "openbmc-flash-layout-128.dtsi"
-	};
-};
-
-&spi1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_spi1_default>;
-
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "pnor";
-		spi-max-frequency = <100000000>;
-	};
-};
-
 &wdt1 {
 	aspeed,reset-type = "none";
 	aspeed,external-signal;
-- 
2.34.1

